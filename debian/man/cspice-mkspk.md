cspice-mkspk(1) -- creates an SPK file from trajectory information
==================================================================

SYNOPSIS
--------
`cspice mkspk` **-setup** _setup_file_ [_options_]  
`cspice mkspk` **-template** [_input_type_ _output_type_]  
`cspice mkspk` **-u** | **-h**


DESCRIPTION
-----------
**MKSPK** is an utility program that generates a new, or appends data to an
existing, spacecraft or target body's ephemeris file in SPICE SPK format
using one of the following SPK types: 5, 8, 9, 10, 12, 13, 15, 17. This SPK
file is a binary file constructed according to the SPICE DAF (Double
Precision Array File) architecture, containing one or more SPK data segments.

The **MKSPK** program accepts one ASCII text file containing descriptions of
input data (setup file) and a second ASCII text file (input file) containing
the source ephemeris data to be processed.

Source ephemeris data can be time ordered lists of states (positions and
velocities), sets of conic elements, sets of two-line elements, or a single
set of equinoctial elements. All input data must be defined in a reference
frame and relative to a body center both of which are specified in the setup
file.

The program allows the user to optionally specify some descriptive text in a
separate file (comment file) to be placed into the "comment area" of the
SPK ephemeris file. (Doing this is highly recommended.)

For archival documentation purposes the content of the MKSPK setup file is
automatically placed at the end of the "comment area" of the SPK file.

**MKSPK** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OPTIONS
-------
Command lines options can be provided in any order. Option keys must be
strictly lowercase.

 * `-setup` _setup_file_:
    Provide the setup file name. If a setup file name isn't provided on the
    command line using the **-setup** key, the program will prompt for it. If
    options **-input** or **-output** are provided, any file names assigned
    using setup file keywords are ignored.

 * `-input` _input_file_:
    Provide the input data file name. The input file must already exist.

 * `-output` _output_file_:
    Provide the output SPK file name. The output must not exist unless the
    **-append** option or the corresponding setup file keyword tells the
    program to run in the append mode.

 * `-append`:
    Append new data to the specified output SPK file. If the SPK file
    specified after the **-output** option doesn't exist, then a new SPK
    file with the name specified will be created.

    CAUTION: if the program fails for any reason, it, in most cases, deletes
    the output file, even if it was appending data to an existing SPK file.

 * `-u`, `-usage`:
    Display usage information.

 * `-h`, `-help`:
    Display a brief summary of the program's functionality.

 * `-t`,  `-template` [_input_type_ _output_type_]:
    Display either the complete setup file template or a type-specific setup
    file template and exit. If specified by itself, the program displays the
    complete setup file template including all required, optional, and
    conditional setup file keywords. To display a more concise,
    type-specific template, the _input_type_ (**states**, **elements**,
    **eq_elements**, or **tl_elements**) and the _output_type_ (**5**,
    **8**, **9**, **10**, **12**, **13**, **15** or **17**) can be
    specified. Such templates will include only keywords applicable for the
    specified type combination.



SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
