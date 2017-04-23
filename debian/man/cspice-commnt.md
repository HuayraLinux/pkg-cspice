cspice-commnt(1) -- manipulate comments from SPICE binary kernel files
======================================================================

SYNOPSIS
--------
`cspice commnt`  
`cspice commnt` **-h**  
`cspice commnt` **-a** | **-e** _kernel_file_ _comment_file_  
`cspice commnt` **-r** | **-d** _kernel_file_

DESCRIPTION
-----------
The COMMNT utility program provides a collection of services useful for
manipulating and examining the contents of the comment area in SPICE
binary kernel files. The COMMNT program can add comments to the comment
area from a text file, read the comment area, displaying the comments on
the terminal screen, extract the comment area to a text file, or delete
the entire comment area of a SPICE binary kernel file.

COMMNT can be used as a menu driven interactive program or as a command line
utility.

The COMMNT program supports the CK, DSK, EK, PCK, and SPK SPICE binary
kernel file formats.

The comments are stored in a "what you put in is what you get out"
fashion, so care should be taken when formatting the comments before
placing them into the comment area of a SPICE binary kernel file.

**COMMNT** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
To use COMMNT as a menu driven interactive program, run the program without any arguments.

 * `-a` _kernel_file_ _comment_file_:
    Add comments to a kernel file from a text file.

 * `-e` _kernel_file_ _comment_file_:
    Extract comments from a kernel file to a text file.

 * `-r` _kernel_file_:
    Read the comments in a kernel file, displaying the results on the
    Standard Output.

 * `-d` _kernel_file_:
    Delete all of the comments in a kernel file.

 * `-h`:
    Display usage information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
