NFSIISE
=======

Need For Speed II SE - Linux port with 3D acceleration and TCP protocol!

## Compile:

* To compile the game you must have a 32-bit:
 * YASM assembler,
 * GCC compiler,
 * OpenGL devel,
 * SDL2 devel.
* Edit the "compile_nfs" script, modify what is needed, and then compile the game by executing script. It should automaticly generate executable file in "Need For Speed II SE" directory.

## Run:

* Copy fedata" and "gamedata" directories from the Need For Speed II SE original CD-ROM (or from CD image from the Internet) into "Need For Speed II SE" directory.
* You can delete unnecessary files, e.g. "fedata/pc/text/text.*", because TCP version uses new files in root directory.
* All files and directories copied from CD-ROM must have SMALL LETTERS on Linux!!!
* If you want to chang language, edit "install.win" and change first line. Leave "4nn" as is and modify language name. Possible languages are:
 * english,
 * french,
 * german,
 * italian,
 * spanish,
 * swedish.
* Run the game.
* The game settings files are located in "~/.nfs2se" ("%AppData%\.nfs2se" on Windows). At the first run the "nfs2se.conf.template" will be copied there. You can modify the file if you want to configure the game.
* The game will crash without original game data.

## What works:

* Game controllers (reconnected game controllers should be the same),
* Force Feedback (tested on Linux),
* TCP and UDP connection,
* Serial port connection,
* Brightness,
* Sound.

## What does not work:

* Modem connection (it will never work again, this feature was removed from assembly code),
* Force Feedback may don't work on Windows due to bugs in SDL2. You can try to enable it in "nfs2se.conf" file (WindowsForceFeedbackDevice).

## Patches:

* This directory contains patch for SDL 2.0.3 (SDL 2.0.4 has already this bugfix). It allows to use all axes in DualShock3 gamepad! You must also modify "nfs2se.conf" file (Joystick0Axes, Joystick0Buttons).
