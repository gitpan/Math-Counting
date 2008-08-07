#!/usr/bin/perl
require 5.006001;
use strict;
use warnings;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME => 'Math::Counting',
    VERSION_FROM => 'lib/Math/Counting.pm',
    PREREQ_PM => {},
    ( $] >= 5.005
        ? (ABSTRACT_FROM => 'lib/Math/Counting.pm',
           AUTHOR => 'Gene Boggs <gene@cpan.org>')
        : ()
    ),
);
