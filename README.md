NFSIISE
=======

![Screenshot](https://raw.githubusercontent.com/zaps166/GitHubCommonContents/master/Screenshots/NFSIISE.png)

Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!

## GIT clone:

Don't forget to update submodules:
```sh
$ git submodule init
$ git submodule update
```

## OpenGL

* By default OpenGL 1 is used (except Android - it always uses GLES2).
* To use OpenGL 2, add `gl2` argument to compilation script.
* To use OpenGL|ES 2, add `gles2` argument to compilation script.

## Compile for x86:

* To compile the game, you must have:
  * GCC or Clang compiler which can generate **32-bit** code for x86 (set by `$CC` environment variable),
  * **32-bit** OpenGL devel and drivers,
  * **32-bit** SDL2 devel.
  * Yasm assembler,
* On Debian you should add 32-bit architecture and install 32-bit dependencies (run as `root`):
```sh
dpkg --add-architecture i386
apt-get update
apt-get install libsdl2-dev:i386 gcc-multilib yasm
```
* Edit the `compile_nfs` script, modify what do you want. Compile the game by executing the script - it will automatically generate executable file inside `Need For Speed II SE` directory:
  * `./compile_nfs` - native compilation for Unix-like systems (Linux, OS X, ...),
  * `./compile_nfs win32` - cross compilation for Windows.

## Compile for non-x86 CPUs:

### Information:
* This game can run on ARM devices, also on Android. Only **32-bit little-endian** CPUs are supported.
* The performance is lower than the original assembly code.
* It can be less stable than assembly code due to possible translation bugs.

### Requirements:
* SDL2 (32-bit) and OpenGL (32-bit),
* target must be 32-bit little-endian,
* GCC 4.9 or higher (currently Clang is not supported).

### Compilation:

#### Linux:
* run `./compile_nfs cpp`

#### Android:
* install NDK and SDK (API levels: 14 and 16),
* set environment variables: `ANDROID_NDK_ROOT` and `ANDROID_HOME`,
* create directory path: `src/Android/jni/SDL/include/SDL2`,
* download SDL2 sources and create symlinks from SDL2 source directory:
  * `android-project/app/src/main/java/org` to `src/Android/src/org`,
  * `src` to `src/Android/jni/SDL`,
  * `include/*.h` to `src/Android/jni/SDL/include/SDL2`,
* run `./compile_nfs android` or `./compile_nfs android install`

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
* The game settings files are located in `~/.nfs2se` (`%AppData%\.nfs2se` on Windows). At the first run, the `nfs2se.conf.template` will be copied there. You can modify the file if you want to configure the game. On Windows, you can use `open_config.bat` to open the config file in notepad.
* On Ubuntu 16.04 you can quick start by installing these dependencies:
    `sudo apt install libgl1-mesa-glx:i386 libxinerama1:i386 libxrandr2:i386`

## What works:

* Game controllers (reconnected game controllers should be the same),
* Force Feedback (tested on Linux),
* TCP and UDP connection,
* Serial port connection,
* Brightness,
* Sound.

## What does not work:

* Modem connection (it will never work again, this feature has been removed from assembly code),
* If Force Feedback does not work, you can try to select Force Feedback device in `nfs2se.conf` file (`ForceFeedbackDevice`).

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
* Cockpit view and night driving are unavailable (original 3D-accelerated version doesn't have this), see [NFSIISEN](https://github.com/zaps166/NFSIISEN) repository.
* OpenGL 1.x only: if the game crashes it might not restore the gamma properly. In this case run: `xgamma -gamma 1.0`.
* There is Docker based build environment available on [GitHub](https://github.com/thomas-mc-work/nfsiise-build-env).

## Patches:

* This directory contains patch for SDL 2.0.3 (SDL 2.0.4 has already this bugfix). It allows to use all axes in DualShock3 gamepad! You must also modify `nfs2se.conf` file (Joystick0Axes, Joystick0Buttons).
  * Unfortunately, only main 6 axes in DualShock 3 are accessible since Linux 4.12.
