cspice-dskexp(1) -- exports data from DSK files to text files
=============================================================

SYNOPSIS
--------
 * **cspice dskexp**:
                    **-dsk** _dsk_
                    **-text** _output_name_
                    **-format** _format_
                    [**-prec** _n_]


DESCRIPTION
-----------
**DSKEXP** enables SPICE Toolkit users to "export" data from a DSK file
to any of a variety of simple, easily parsed text formats. This capability
enables users to easily transform DSK files into formats required by other
applications; it also makes it easy to inspect the data in a DSK file.

**DSKEXP** currently is limited to processing type 2 (plate model) DSK
segments.

If the input DSK file contains multiple segments, an output text file will be
created for each segment.

**DSKEXP** is part of the CSPICE Toolkit. See **cspice**(7) for more
information.


OUTPUT FORMATS
--------------
The supported formats are:

 1. _plate-vertex_ table. The format code for this format is _1_. The output
    file format is:

        <vertex count NV>
        1   <vertex 1  X value><Y value><Z value>
            ...
        NV  <vertex NV X value><Y value><Z value>
        <plate count NP>
        1  <plate 1  vertex 1 ID><vertex 2 ID><vertex 3 ID>
            ...
        NP <plate NP vertex 1 ID><vertex 2 ID><vertex 3 ID>

 2. _vertex-facet_ table. This format is also called _obj_ format. The format
    code for this format is _3_. The output file format is:

        v <vertex 1  X value><Y value><Z value>
            ...
        v <vertex NV X value><Y value><Z value>
        f <plate 1  vertex 1 ID><vertex 2 ID><vertex 3 ID>
            ...
        f <plate NP vertex 1 ID><vertex 2 ID><vertex 3 ID>



 3. Rosetta/OSIRIS _ver_ format. The format code for this format is _4_. The
    output file format is:

        <vertex count NV> <plate count NP>
          <vertex 1  X value><Y value><Z value>
              ...
          <vertex NV X value><Y value><Z value>
        3
          <plate 1  vertex 1 ID><vertex 2 ID><vertex 3 ID>
              ...
        3
          <plate NP vertex 1 ID><vertex 2 ID><vertex 3 ID>

In the diagram above, NV and NP are the vertex and plate counts, respectively.

The Gaskell ICQ format (format code 2) is not supported as an export format.


OPTIONS
-------
 * `-dsk` _dsk_:
    Specify DSK input file.

 * `-text` _text_:
    Specify output text file. If the input file contains multiple segments,
    an output file will be written for each segment. The file for the nth
    segment, where n is greater than 1, will have the string "_<n-1>"
    appended to the output file name specified on the command line. For
    example, if the input DSK contains multiple segments and if the specified
    output file name is 'phobos.plt' then the file for the first segment will
    have that name, the file for the second segment will be named
    'phobos.plt_1' and so on.

 * `-format` _format_:
    Specifies the output file format. Output formats may be specified by
    name or by integer code. All of the supported output formats are valid
    **cspice-mkdsk** input file formats. See the section "OUTPUT FORMATS"
    above for further information.

 * `-prec` _n_:
    The optional output precision specification allows users to limit the
    precision of the double precision numbers representing components of
    plate model vertices. Reducing the output precision can significantly
    reduce the size of the output file. By default, full precision (17
    mantissa digits) is used. Range is 1:17.

EXAMPLES
--------
Create a vertex-facet format output file. This example uses default
precision for the output vertices:

    cspice dskexp -dsk phobos.bds -text phobos.obj -format vertex-facet

Create a vertex-facet format output file. Use 9-digit mantissas for the
vertices. The format name "obj" can be used to indicate vertex-facet format.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format obj -prec 9

Create a vertex-facet format output file. Use 9-digit mantissas for the
vertices. The format code 3 can be used to indicate vertex-facet format.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format 3 -prec 9

Create a plate-vertex format output file. This example uses default precision
for the output vertices.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format plate-vertex

Create a plate-vertex format output file. Use the integer code for this format.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format 1

Create a Rosetta "ver" format output file.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format ver

Create a Rosetta "ver" format output file. Use the integer code for this
format.

    cspice dskexp -dsk phobos.bds -text phobos.obj -format 4


SEE ALSO
--------
**cspice**(7), **cspice-mkdsk**(1)

Full documentation is provided by package cspice-doc on /usr/share/doc/cspice
or it can be obtained online on https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/.
