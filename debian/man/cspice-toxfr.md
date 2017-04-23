cspice-toxfr(1) -- converts binary format SPICE files to transfer format
========================================================================

SYNOPSIS
--------
`cspice toxfr` _transfer_format_file_ [_binary_format_file_]


DESCRIPTION
-----------
**TOXFR** converts a SPICE binary format SPK, CK, PCK, DSK and EK file into
a transfer file format that is used to transfer, or port, the binary data to
a different computing environment. **TOXFR** requires at least the name of
the input binary file, which is the first argument on the command line.
Optionally, a name for the output transfer file may be specified as the
second argument on the command line. If a name for the output file is
provided on the command line it overrides the automatic naming conventions
used by the program.

If only the name of the input binary file is provided on the command line,
**TOXFR** will generate a name for the output transfer file that has the
same base name as the input binary file and an appropriate filename
extension, based on the filename extension of the binary file. If **TOXFR**
does not recognize the filename extension of the input binary file, or there
is no filename extension on the input binary file, a filename extension of
'.xfr' will be used as the filename extension of the output transfer file.
If a file having the same name as the output file already exists, **TOXFR**
signals an error and stops. Again, we assume that it is bad form to
overwrite or replace an existing file.

**TOXFR** recognizes the filename extensions ".bc", ".bee", ".bpc", and
".bsp" which are associated with SPICE binary kernel files. These are
converted to the transfer filename extensions ".xc", ".xee", ".xpc", and
".xsp," respectively.

**TOXFR** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
