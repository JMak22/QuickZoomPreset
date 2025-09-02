-- QuickPresetZoom: set the view to a preset percentage.
-- Uses only view actions; does not change paper size or templates.

----------------------------------------------------------------
-- CONFIG – edit these to taste
----------------------------------------------------------------
local PRESET_PERCENT = 74         -- e.g., 74 or your desired percentage
local STEP_PERCENT   = 10         -- your zoom step; Xournal++ default is 10, unless you have edited settings.xml "zoomStep" value
local APPLY_ON_START = false      -- set true to apply once shortly after startup, without triggering any commands **note this is currently not working as intended, unknown reasons**
local MENU_LABEL     = "QuickZoom: Preset "..PRESET_PERCENT.."%"
local HOTKEY         = "<Ctrl><Alt>Z"
----------------------------------------------------------------

-- Derived factors
local TARGET_FACTOR = PRESET_PERCENT / 100.0
local STEP_UP       = 1.0 + STEP_PERCENT / 100.0   -- e.g., 1.10
local STEP_DOWN     = 1.0 / STEP_UP                -- e.g., ~0.909...
local MAX_PRESSES   = 40

-- Broad action name sets for cross-build robustness, hopefully
local A_ZOOM_100 = { "ACTION_ZOOM_100", "ACTION_VIEW_ZOOM_100", "ACTION_ZOOM_RESET", "ACTION_RESET_ZOOM" }
local A_ZOOM_IN  = { "ACTION_ZOOM_IN", "ACTION_VIEW_ZOOM_IN", "ACTION_ZOOM_FACTOR_INCREASE", "ACTION_INCREASE_ZOOM" }
local A_ZOOM_OUT = { "ACTION_ZOOM_OUT","ACTION_VIEW_ZOOM_OUT","ACTION_ZOOM_FACTOR_DECREASE","ACTION_DECREASE_ZOOM" }

local function runOne(list)
  for _, a in ipairs(list) do
    if pcall(app.uiAction, { action = a }) then return true end
  end
  return false
end

local function ensureDocOpen()
  local ok, doc = pcall(app.getDocumentStructure)
  return ok and doc and doc.pages and #doc.pages > 0
end

-- Compute how many presses from 100% to approach target with given step
local function pressesFrom100(target)
  local function rint(x) return math.floor(x + 0.5) end
  if target >= 1.0 then
    local n = rint(math.log(target) / math.log(STEP_UP))
    if n < 0 then n = 0 end
    if n > MAX_PRESSES then n = MAX_PRESSES end
    return n, "in"
  else
    local n = rint(math.log(target) / math.log(STEP_DOWN))
    if n < 0 then n = 0 end
    if n > MAX_PRESSES then n = MAX_PRESSES end
    return n, "out"
  end
end

local function applyPreset()
  if not ensureDocOpen() then return end

  -- Normalize to 100% if possible; if not, presses become relative to current zoom.
  runOne(A_ZOOM_100)

  local n, dir = pressesFrom100(TARGET_FACTOR)
  if dir == "in" then
    for _ = 1, n do if not runOne(A_ZOOM_IN) then break end end
  else
    for _ = 1, n do if not runOne(A_ZOOM_OUT) then break end end
  end
end

-- Optional gentle startup apply (off by default)
local function applySoon()
  local okLgi, lgi = pcall(require, "lgi")
  if not okLgi then return end
  local GLib = lgi.GLib
  GLib.timeout_add(GLib.PRIORITY_DEFAULT, 300, function() applyPreset(); return false end)
  GLib.timeout_add(GLib.PRIORITY_DEFAULT,1000, function() applyPreset(); return false end)
end

function quickzoom_preset() applyPreset() end

function initUi()
  -- Menu + hotkey
  app.registerUi({
    menu = MENU_LABEL,
    callback = "quickzoom_preset",
    accelerator = HOTKEY
  })

  -- Apply once right away; if a document is already open (e.g., autoloadMostRecent=true),
  -- this will work immediately. If not, nothing breaks; just use the menu once you open/create a doc.
  if APPLY_ON_START then
    pcall(quickzoom_preset)
  end
end
