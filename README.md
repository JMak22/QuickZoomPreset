# QuickZoom Plugin for Xournal++

**What it does:** Sets the **view zoom** to a preset percentage (no document size changes).

**Install:** Put `plugin.ini` and `main.lua` in `…\AppData\Local\xournalpp\plugins\QuickPresetZoom\`, enable in **Plugins → Plugin Manager**, restart Xournal++.

**Configure:** Open `main.lua` with Notepad or your text editor of choice, edit `PRESET_PERCENT` (e.g., 74 or 134). If your zoom step isn’t the default 10%, adjust `STEP_PERCENT`.

**Use:** **Plugins → QuickZoom: Preset X%** (hotkey defaults to **Ctrl+Alt+Z**, you can change that in `main.lua` as well if those hotkeys are unavailable).

**Optional:** Set `APPLY_ON_START = true` to apply once on launch. -- this is currently not working as inteded, for unknown reasons. If you can figure it out, share with the community. I've tried editing the settings.xml file to set autoloadMostRecent=true and I'm not getting my last document as I should, so maybe something's broken on my end.

## To run a Lua plugin: 
You will need a Lua runtime environment. I didn't have luck finding a .zip package for Windows on SourceForge, so I installed it via Scoop (Chocolatey had Lua 5.1 BUT Xournal++ plugins require Lua 5.3+, hence the need for Scoop).

### To install via Scoop (on Windows):
1. Open PowerShell (normal user is fine)
2. run ```Set-ExecutionPolicy -Scope CurrentUser RemoteSigned```
3. run ```irm get.scoop.sh | iex```
4. install Lua ```scoop install lua```
5. close terminal
6. open new terminal, check install ```lua -v``` -- you should see something like "Lua 5.4.8 Copyright (C) 1994-2025 Lua.org, PUC-Rio"
7. for sanity, verify that the PATH order is correct for the version of Lua needed to run the plugin (Windows Settings -->System-->About-->Advanced system settings-->Environment variables see where LUA_CPATH and LUA_EXE point to, ensure it's the correct version of Lua (5.3+) needed for the plugin to work

# Lua
[www.lua.org](https://www.lua.org/about.html)
"Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports several programming styles: procedural, object-oriented, functional, data-driven, and data description."

# What is Xournal++?
[Xournal++](https://github.com/xournalpp)
"Xournal++ is a handwriting notetaking software with PDF annotation support. Written in C++ with GTK3, supporting Linux (e.g. Ubuntu, Debian, Arch, SUSE), macOS and Windows 10. Supports pen input from devices such as Wacom Tablets."

## Other tools used:
[Zettlr](https://www.zettlr.com/)

[Notepad++](https://notepad-plus-plus.org/)

Lua code written with the assistance of chatGPT
