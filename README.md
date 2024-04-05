NFSIISE
=======

![Screenshot](https://raw.githubusercontent.com/zaps166/GitHubCommonContents/master/Screenshots/NFSIISE.png)

Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!

## GIT clone:

Don't forget to update submodules:
```sh
git submodule update --init --recursive
```

## OpenGL

* By default OpenGL 2 is used (except Android - it always uses GLES2).
* To use OpenGL 1, add `gl1` argument to compilation script.
* To use OpenGL|ES 2, add `gles2` argument to compilation script.

## Compile for x86:

* To compile the game, you must have:
  * GCC or Clang compiler which can generate **32-bit** code for x86 (set by `$CC` environment variable),
  * **32-bit** OpenGL devel and drivers,
  * **32-bit** SDL2 devel.
  * Yasm assembler,
* On **Debian** you should add 32-bit architecture and install 32-bit dependencies (run as `root`):
```sh
dpkg --add-architecture i386
apt-get update
apt-get install libsdl2-dev:i386 gcc-multilib yasm
```
* Edit the `compile_nfs` script, modify what do you want. Compile the game by executing the script - it will automatically generate executable file inside `Need For Speed II SE` directory:
  * `./compile_nfs` - native compilation for Unix-like systems (Linux, macOS up to Mojave, ...),
  * `./compile_nfs win32` - cross compilation for Windows (on Arch Linux install: `mingw-w64-gcc` and `mingw-w64-sdl2` from AUR).

## Notes About Windows Build using WSL:
* One way is to use WSL (Windows Subsystem for Linux) and install `mingw-w64` which cross-compiles to Windows
```sh
sudo apt install mingw-w64
```
also `gcc-multilib` might be needed to be installed using
```sh
sudo apt install gcc-multilib
```

* Don't install SDL using apt-get, instead take it from their [official repo packages page](https://github.com/libsdl-org/SDL/releases/), get the package with **mingw** suffix

* Inside the package folder you should use the one called *`i686-w64-mingw32`*
* Either copy the `include, bin, lib, share` to your system files (not recommended) or you can modify the following lines in the file `compile_nfs`:

  - On line 27 with:
      ```sh
      C_FLAGS="$COMMON_FLAGS -O2 $CPU_FLAGS"
      ```
      add before the last quotation mark `-I/path/to/include/folder` so that it becomes:
      ```sh
      C_FLAGS="$COMMON_FLAGS -O2 $CPU_FLAGS -I/path/to/include/folder"
      ```

  - On line 23 add the same include directory paramter before the quote

  - On line 39 which has:
      ```sh
      i686-w64-mingw32-ld --enable-stdcall-fixup -o "../Need For Speed II SE/nfs2se.exe" *.o --stack=0x7D00,0x7D00 --heap=0x2000,0x1000 -lws2_32 -lwinmm -lmingwex -lmsvcrt -lkernel32 -lopengl32 -lSDL2 -lSDL2main -lSDL2_test -subsystem=$WIN_SUBSYSTEM $STRIP -e _start &&
      ```
      After the `-lSDL2_test` add `-L/path/to/lib/folder/`
  - Now the command `./compile_nfs win32` should work fine
  - If you try to run the exe, windows will say the dll is missing so you should get it from the `same SDL packages link` but this time the package for `win32-x86`
  - Copy the dll you get from decompressing the zip file and put it in the same directory as the game's exe file
  - Now if you follow the other steps (of copying game data and dealing with possible errors explained futher), it should work fine

## Compile for non-x86 CPUs:

### Information:
* This game can run on ARM devices, also on Android. Only **32-bit little-endian** CPUs are supported.
* The performance is a bit lower than the original assembly code.
* May be less stable than assembly code due to possible translation bugs.

### Requirements:
* SDL2 (32-bit) and OpenGL (32-bit).
* Clang compiler and lld linker (must generate 32-bit output).

### Compilation:

#### Linux:
* run `./compile_nfs cpp`

#### Android:
* install SDK and NDK for chosen SDL2 version,
* set environment variables: `ANDROID_HOME` and `ANDROID_NDK_HOME`,
* download SDL2 source code and unpack it,
* create symlink to unpacked `SDL2-*` directory into `src/Android/app/jni/SDL`,
* run `./compile_nfs android` or `./compile_nfs android install`.

## Run:

* Copy `fedata` and `gamedata` directories from the Need For Speed™ II SE original CD-ROM into `Need For Speed II SE` directory.
* This game **needs** data from Need For Speed 2 **Special Edition**, otherwise you'll see a 'MOVIE FILE NOT FOUND' message!
* You can delete unnecessary files, e.g. `fedata/pc/text/text.*`, because TCP version uses new files in root directory.
* All files and directories copied from CD-ROM **must** have *small letters* on Unix-like systems!!!
  * Please use the `Need For Speed II SE/convert_to_lowercase` script if you have UPPERCASE names.
* If you want to change the language, edit `install.win` file (with text editor which doesn't modify last line or line edings!) and change the first line. Leave `4nn` as is and modify only language name. Possible languages are:
  * english,
  * french,
  * german,
  * italian,
  * spanish,
  * swedish.
* Run the game.
* The game settings files are located in `~/.nfs2se` (`%AppData%\.nfs2se` on Windows). At the first run, the `nfs2se.conf.template` will be copied there. You can modify the file if you want to configure the game. On Windows, you can use `open_config.bat` to open the config file in notepad.
* On Android devices, copy `gamedata`, `fedata`, `install.win`, `text.*`, `nfs2se.conf` (rename `nfs2se.conf.template` to `nfs2se.conf`) into `/sdcard/NFSIISE` or `/storage/emulated/0/NFSIISE` (create `NFSIISE` directory first).
* For Batocera Linux devices (an open-source and completely free retro-gaming distribution), tested with version 39:
  * take Windows version (e.g `nfs2se-win32-v1.4.0.zip` under Releases), unpack it,
  * copy original `fedata` and `gamedata` directories into `Need For Speed II SE` directory,
  * in `Need For Speed II SE` directory create new file `autorun.cmd` with content `CMD=nfs2se.exe`,
  * rename directory `Need For Speed II SE` to `Need For Speed II SE.pc`,
  * place directory `Need For Speed II SE.pc` into your Batocera Linux directory `/userdata/roms/windows/`,
  * to update the game list in Batocera using your controller, press `START` and go to `GAME SETTINGS` → `UPDATE GAMELISTS`, the game is listed under `Windows` section and will be successfully emulated via Wine

## What works:

* Game controllers (reconnected game controllers should be the same),
* Force Feedback (tested on Linux),
* TCP and UDP connection,
* Serial port connection,
* Brightness,
* Sound.

## What does not work:

* Modem connection (it will never work again, this feature has been removed from assembly code),

## Function keys in-game

* F1  - toggle rain
* F2  - car detail
* F3  - view distance
* F4  - toggle horizon
* F5  - toggle HUD (player 1)
* F6  - toggle HUD (player 2)
* F7  - toggle mirror
* F8  - toggle music
* F9  - toggle sound effects
* F10 - brightness
* F11 - reset car (player 1)
* F12 - reset car (player 2)

## Additional information:

* Arch Linux package is available in AUR as `nfs2se-git`.
* Compilation on *BSD systems probably needs changes in compilation script (not tested).
* Cockpit view and night driving are unavailable (original 3D-accelerated version doesn't have this), see [NFSIISEN](https://github.com/zaps166/NFSIISEN) repository.
* OpenGL 1.x only: if the game crashes it might not restore the gamma properly. In this case run: `xgamma -gamma 1.0`.
* There is Docker based build environment available on [GitHub](https://github.com/thomas-mc-work/nfsiise-build-env).
* LICENSE is only for wrapper source code.
