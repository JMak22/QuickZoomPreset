# QuickZoom Plugin for Xournal++

**What it does:** Sets the **view zoom** to a preset percentage (no document size changes).

**Install:** Put `plugin.ini` and `main.lua` in `…\AppData\Local\xournalpp\plugins\QuickPresetZoom\`, enable in **Plugins → Plugin Manager**, restart Xournal++.

**Configure:** Open `main.lua` with Notepad or your text editor of choice, edit `PRESET_PERCENT` (e.g., 74 or 134). If your zoom step isn’t the default 10%, adjust `STEP_PERCENT`.

**Use:** **Plugins → QuickZoom: Preset X%** (hotkey defaults to **Ctrl+Alt+Z**, you can change that in `main.lua` as well if those hotkeys are unavailable).

**Optional:** Set `APPLY_ON_START = true` to apply once on launch. -- this is currently not working as inteded, for unknown reasons. If you can figure it out, share with the community. I've tried editing the settings.xml file to set autoloadMostRecent=true and I'm not getting my last document as I should, so maybe something's broken on my end.
