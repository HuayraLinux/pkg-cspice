cspice-spacit(1) -- manipulate and examine SPICE binary kernels
===============================================================

SYNOPSIS
--------
`cspice spacit`


DESCRIPTION
-----------
**SPACIT** is an interactive menu driven program which provides a collection
of services useful for manipulating and examining SPICE binary kernel files.
The program may be used to convert SPICE binary kernel files into equivalent
ASCII files, called SPICE transfer files, and to convert the SPICE transfer
files back to binary. SPACIT may also be used to summarize the information
contained in SPICE binary kernel files and to read the comments contained in
the comment area of a SPICE binary kernel file.

The **SPACIT** program currently supports the CK, EK, PCK, and SPK SPICE binary
kernel file formats.

In addition to SPICE binary kernel files, **SPACIT** requires additional
SPICE files when used to summarize a binary kernel file. A leap seconds
kernel is required for summarizing CK, EK, PCK and SPK binary kernel files.
A SCLK kernel is required for summarizing binary CK files.

**SPACIT** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
