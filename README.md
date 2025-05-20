## Overview

pdfmm (for "pdf minus minus", or "pdf--") is a graphical assistant to reduce the size of PDF files.

<img src="https://raw.githubusercontent.com/jpfleury/pdfmm/master/doc/exemple1-en.png" width="683" height="526" alt="Simple GUI tool to reduce PDF file sizes">

Here are some results obtained with randomly selected PDF files:

| Input size | Output size | % optimization |
| ---------- | ----------- | -------------- |
| 29   KiB   | 23   KiB    | 20 %           |
| 363  KiB   | 72   KiB    | 80 %           |
| 733  KiB   | 658  KiB    | 10 %           |
| 991  KiB   | 349  KiB    | 65 %           |
| 1.7  MiB   | 0.8  MiB    | 52 %           |
| 1.9  MiB   | 1.1  MiB    | 40 %           |
| 2.3  MiB   | 1.6  MiB    | 31 %           |
| 3.4  MiB   | 1.3  MiB    | 60 %           |
| 7.1  MiB   | 5.4  MiB    | 23 %           |
| 14.8 MiB   | 9.4  MiB    | 36 %           |
| 54.3 MiB   | 14.6 MiB    | 73 %           |

Of course, this table is presented as an example only. The result will certainly not be the same with other files of similar size. It depends on the content.

## Requirements

pdfmm is a shell script requiring bash (>= 4.0), sed, zenity, and ghostscript.

## Installation

- [Download the archive of the latest version.](https://github.com/jpfleury/pdfmm/archive/master.zip)

- Extract the archive.

### Current user

The script is ready to be used by the current user.

### All users

To make the script available to all users, add the `pdfmm` file to the `/usr/bin/` folder (root privileges required).

In this case, the folder created by the extraction can be deleted after the copy.

## Uninstallation

### Current user

Just delete the folder created by the extraction.

### All users

Delete the `pdfmm` file previously copied to `/usr/bin/` (root privileges required).

## Usage

**Notes:**

- Original files are never modified. The optimized file is created in the same folder as the original.

- After optimized files have been created, a window appears listing them. Clicking *OK* will keep these files; clicking *Cancel* will remove them.

- A configuration file is created in the home folder of the user running `pdfmm`:

		~/.config/pdfmm.conf

	This file contains the parent folder of the last file selected. This folder will be proposed the next time `pdfmm` is used.

### Current user

To use the script in a terminal, run the `pdfmm` file with the appropriate path:

	path/to/pdfmm

If your working folder is the same as the folder containing `pdfmm`, the command is:

	./pdfmm

In any case, the PDF files to optimize can be specified as arguments, for example:

	./pdfmm path/to/the/file1.pdf path/to/the/file2.pdf

The script can also be launched by clicking on the `pdfmm` file (single or double click depending on your configuration) and choosing to run it.

If you prefer, you can create a launcher with the absolute path as the command, for example:

	/home/USER/path/to/pdfmm

### All users

In a terminal, just enter `pdfmm`. The PDF files to optimize can be specified in the command line.

A launcher can also be created with the `pdfmm` command.

## Localisation

pdfmm is translatable. Anyone interested can translate all the strings in the *Localisation* section of the `pdfmm` file and send me the result. Currently, pdfmm is available in English, French, and German.

## Development

Git is used for revision control. [The repository can be browsed online or cloned.](https://github.com/jpfleury/pdfmm)

## License

Author: Jean-Philippe Fleury (<https://github.com/jpfleury>)  
Copyright © 2011-2015, 2019, 2025 Jean-Philippe Fleury

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
