#!/bin/sh
#
# Generate the README.md file
#
# The lists are automatically derived from the source code
#

cat <<EOF
# C Code Quality Metrics
The program qmcalc will read a C source code file from its standard
input and print on its standard output a single line with the following
numbers separated by a single tab.

EOF

# Generate list of primary metrics
sed -n 's/^\t\t\/\/ VAL: /* /p' QualityMetrics.cpp
# Generate list of style metrics
sed -n '/^\tenum StyleError {/,/Add more elements here/{
	/enum StyleError/d
	/Add more elements here/d
	s/./\l&/g
	s/\t\t//
	s/^/Number of occurences of /
	s/_/ /g
	s/^/* /
	s/,$//
	s/ op$/ operator/
	p
}' QualityMetrics.h

cat <<EOF


## Building
### Prerequisites
* C++ compiler
* GNU make
* [CppUnit](http://sourceforge.net/projects/cppunit/)

* To build type `make`

## Further reading
The style checks performed are based on the following guidelines.
* [Google](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml)
* [FreeBSD](http://www.freebsd.org/cgi/man.cgi?query=style&sektion=9)
* [GNU](https://www.gnu.org/prep/standards/html_node/Formatting.html)
* [Recommended C Style and Coding Standards - updated version of the Indian Hill C Style and Coding Standards paper](http://www.cs.arizona.edu/~mccann/cstyle.html
* [Wikipedia summary](http://en.wikipedia.org/wiki/Indent_style)

Some other metrics are based on the paper [A Tale of Four Kernels](http://www.dmst.aueb.gr/dds/pubs/conf/2008-ICSE-4kernel/html/Spi08b.html)
EOF