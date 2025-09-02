# QuickZoom Plugin for Xournal++

**What it does:**
Sets the **view zoom** to a preset percentage (no document size or template changes)

**Install:** 
Put `plugin.ini` and `main1.lua` in `…\AppData\Local\xournalpp\plugins\QuickPresetZoom\`, enable in **Plugins → Plugin Manager**, restart Xournal++

**Configure:** 
Open `main1.lua` with Notepad or your text editor of choice, edit `PRESET_PERCENT` (e.g., 74 or 134). If your zoom step isn’t the default 10%, adjust `STEP_PERCENT`

**Use:** 
**Plugins → QuickZoom: Preset X%** 
(default hotkey **Ctrl+Alt+Z**, can be changed in `main1.lua`)

**Optional:** 
Set `APPLY_ON_START = true` to apply once on launch. -- this is currently not working as inteded, for unknown reasons. If you can find a robust solution, please share it with the community. I've tried editing the settings.xml file to set autoloadMostRecent=true and I'm not getting my last document as I should.

### Attempted but not implemented
Hotkeys to fit page width/height to window. These view actions didn’t respond on my build, so I left them out.
Please note the at there is a function ```app.setZoom``` that greatly simplifies the code, but it's currently (Sep 2025) available only in the nightly build. I will look into publishing a version that takes advantage of the function.

## Dependencies for plugins: 
- Xournal++ (with plugin support enabled)
- Lua 5.3+ runtime

I didn't have luck finding a .zip package with a lua.exe for Windows on SourceForge, so I installed it via Scoop (Chocolatey had Lua 5.1 *but* Xournal++ plugins require Lua 5.3+, hence the need for Scoop).

### To install via Scoop (on Windows):
1. Open PowerShell (normal user is fine)
2. run ```Set-ExecutionPolicy -Scope CurrentUser RemoteSigned```
3. run ```irm get.scoop.sh | iex```
4. install Lua ```scoop install lua```
5. close terminal
6. open new terminal, verify install by typing ```lua -v``` -- you should see something like "Lua 5.4.8 Copyright (C) 1994-2025 Lua.org, PUC-Rio"
7. verify ```lua -v``` shows version 5.3 or higher. If ```where lua``` lists multiple versions, make sure the Scoop path is first

I cannot give you instructions for any other OS, as this is the only one I'm familiar with. If anyone else is willing to create versions that will work in other OS, by all means. :)

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
