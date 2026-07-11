<div align="center">

# <img src="https://media3.giphy.com/media/l4FGr7tMjH3ajuwy4/giphy.gif" width="4%"> Linux Retroism <img src="https://media3.giphy.com/media/l4FGr7tMjH3ajuwy4/giphy.gif" width="4%">

</div>

▐ **Linux Retroism is a Linux-rice based on the 1980-1990's user-interface aesthetic** ▌

</div>

![image](./.screenshots/default.png)

<br>

### Features (v0.1) 🛈

- Fully quickshell-based front-end (taskbar, app launcher, settings menu, etc)
- Theme support & Built-in theme switcher
- Icon theme & GTK theme

<br>

<div style="border-left: 4px solid #c8bfa1ff; padding: 12px 100px 1px 12px; background-color: #0000003e; margin-bottom: 8px">
<strong>Window Manager:</strong><br>

`Hyprland` (mandatory because this is my config and I said so :3)

<br>

### Download & Installation 🡇

<div style="border-left: 4px solid #c8bfa1ff; padding: 12px 4px 1px 2px; background-color: #0000003e; margin-bottom: 12px">

- After you've cloned the repo, move the repo to `/etc`. Move your `hardware-configuration.nix` to the folder before renaming it to `/etc/nixos`.
- This config uses Home Manager, so you will have to add the nix channel for Home Manager. Google it, and make sure you get the version correct based on the version specified in `configuration.nix`.
- After getting Home Manager added to the nix channels, you can run `sudo nixos-rebuild boot && reboot`. It'll probably work after that.
- Oh, and make sure to edit the username in the config to match your own username that you've set up during the installation of NixOS. It won't work unless you do that.
- I probably forgot some steps so best of luck. :)

### ✦ Notes & TODO Lists

Both the Icon theme and GTK theme are very early, I may or may not update them within a reasonable timeframe if/when diinki does.

**v0.2 TODO List:**

- [ ] Update GTK Theme to be less janky.
- [ ] Higher res icon theme and more icons.
- [ ] Proper settings menu, change font sizes, font, wallpapers, etc.
- [ ] Refactor quickshell code where need be.
- [ ] Better laptop support (battery indicator)
- [ ] UI/UX Improvements

### ✦ License

This project is licensed under the permissive MIT license, which is included in the root directory
of this repository.
