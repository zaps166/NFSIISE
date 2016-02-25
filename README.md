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
* Run the game. Go to Options->Graphics and set all to maximum.
* On Linux the game saves files in "~/.nfs2se". At the first run, "nfs2se.conf" will be copied into "~/.nfs2se".
* If you want to configure the game, go to "~/.nfs2se" directory, edit "nfs2se.conf" and modify what you want.
* The game crashes without original game data.

## What works:

* Game controllers (reconnected game controllers should be the same),
* Force Feedback (tested on Linux),
* TCP and UDP connection,
* Serial port connection,
* Brightness,
* Sound.

## What does not work:

* Modem connection (it will never work again, this feature was removed from assembly code),
* Force Feedback on Window$ may not work due to bugs in SDL2.

## Patches:

* This directory contains patch for SDL 2.0.3 (SDL 2.0.4 has already this bugfix). It allows to use all axes in DualShock3 gamepad! You must also modify "nfs2se.conf" file (Joystick0Axes, Joystick0Buttons).
