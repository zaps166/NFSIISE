NFSIISE
=======

![Screenshot](http://zaps166.sourceforge.net/gh-imgs/NFSIISE-screenshot.png)

Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!

## Compile:

* To compile the game you must have a **32-bit**:
 * GCC or Clang compiler (set by `$CC` environment variable),
 * OpenGL devel,
 * SDL2 devel.
* You need the Internet connection and CURL to download needed file for compilation.
* Edit the `compile_nfs` script, modify what do you want. Compile the game by executing the script - it will automaticly generate executable file inside `Need For Speed II SE` directory:
 * `./compile_nfs` - native compilation for Unix-like systems (Linux, OS X, ...),
 * `./compile_nfs win32` - cross compilation for Windows.

## Run:

* Copy `fedata` and `gamedata` directories from the Need For Speed™ II SE original CD-ROM into `Need For Speed II SE` directory.
* This game **needs** data from Need For Speed 2 **Special Edition**, otherwise you'll see a 'MOVIE FILE NOT FOUND' message!
* You can delete unnecessary files, e.g. `fedata/pc/text/text.*`, because TCP version uses new files in root directory.
* All files and directories copied from CD-ROM **must** have *small letters* on Unix-like systems!!!
 * Please use the `Need For Speed II SE/convert_to_lowercase` script if you have UPPERCASE names.
* If you want to change the language, edit `install.win` file and change the first line. Leave `4nn` as is and modify only language name. Possible languages are:
 * english,
 * french,
 * german,
 * italian,
 * spanish,
 * swedish.
* Run the game.
* The game settings files are located in `~/.nfs2se` (`%AppData%\\.nfs2se` on Windows). At the first run the `nfs2se.conf.template` will be copied there. You can modify the file if you want to configure the game. On Windows you can use `open_config.bat` to open the config file in notepad.

## What works:

* Game controllers (reconnected game controllers should be the same),
* Force Feedback (tested on Linux),
* TCP and UDP connection,
* Serial port connection,
* Brightness,
* Sound.

## What does not work:

* Modem connection (it will never work again, this feature has been removed from assembly code),
* Force Feedback might not work on Windows due to bugs in SDL2. You can try to enable it in `nfs2se.conf` file (WindowsForceFeedbackDevice).

## Function keys in-game

* F1  - toggle rain,
* F2  - car detail,
* F3  - view distance,
* F4  - toggle horizon,
* F5  - toggle HUD (player 1),
* F6  - toggle HUD (player 2),
* F7  - toggle mirror,
* F8  - toggle music,
* F9  - toggle sound effects,
* F10 - brightness,
* F11 - reset car.

## Additional information:

* Arch Linux package is available in AUR as `nfs2se-git`.
* Compilation on *BSD systems probably needs changes in compilation script (not tested).
* Cockpit view and night driving are unavailable (original 3D-accelerated version doesn't have this).
* If the game crashes it might not restore the gamma properly. In this case run: `xgamma -gamma 1.0`.

## Patches:

* This directory contains patch for SDL 2.0.3 (SDL 2.0.4 has already this bugfix). It allows to use all axes in DualShock3 gamepad! You must also modify `nfs2se.conf` file (Joystick0Axes, Joystick0Buttons).
