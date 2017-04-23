cspice-mkdsk(1) -- creates a DSK file from a text file
=======================================================

SYNOPSIS
--------
 * **cspice mkdsk**:
                    [**-setup** _setup_file_]  
                    **-input** _input_data_file_  
                    **-output** _output_dsk_file_  
                    [**-h**|**-t**|**-u**|**-v**]


DESCRIPTION
-----------
**MKDSK** converts a text file containing surface shape and size data
to a binary Digital Shape Kernel (DSK).

The MKDSK program requires as input a setup file containing input
parameters and a second file containing the shape data to be processed.

Data files provided to this program either represent an object's surface as a
collection of triangular plates, or as a height grid.

Currently the only supported output DSK data type is type 2: this type
represents the surface of a specified body as a collection of triangular
plates.

The program allows the user to optionally specify some descriptive text in a
separate file, called the "comment file" to be placed into the
"comment area" of the DSK file. (Doing this is highly recommended.)

For archival documentation purposes the content of the MKDSK setup file
is automatically placed at the end of the "comment area" of the DSK file.

**MKDSK** is part of the CSPICE Toolkit. See cspice(7) for more information.


OPTIONS
-------
 * `-setup` _setup_file_:
    If a setup file name isn't provided on the command line, MKDSK will
    prompt for it. For more information on the setup file format please refer
    to the documentation.

 * `-input` _input_data_file_:
    Specify the input shape data file. If the input or output file names are
    provided on the command line, any corresponding file names assigned using
    setup keywords are ignored.

 * `-output` _output_dsk_file_:
    Specify the output DSK file. If the input or output file names are
    provided on the command line, any corresponding file names assigned using
    setup keywords are ignored.

 * `-h`, `-help`:
    Pint help message and exit.

 * `-t`, `-template`:
    Print a complete MKDSK setup file template and exit.

 * `-u`, `-usage`:
    Print usage information and exit.

 * `-v`, `-version`:
    Print version and exit.


SEE ALSO
--------
**cspice**(7)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on http://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
