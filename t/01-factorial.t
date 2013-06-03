#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use_ok 'Math::Counting', qw(:student :big);

# This is not the most rigorous test.
# 42 is the magic constant of the smallest magic cube composed with
# the numbers 1 to 27.  And 27 is the first odd perfect cube, apart
# from the number 1.

my $format = '%.8e';
my $x;
my $n   = 42;
my $k   = 27;
my $f3  = 171;
my $f4  = '1.24101807e+309';
my $f1  = qr/1\.40500612e\+0?51/;
my $f2  = qr/1\.08888695e\+0?28/;
my $nan = 'NaN';
my $inf = 'inf';

# Factorial
$x = factorial();
is $x, undef, 'undef!';
$x = factorial(-1);
is $x, undef, "-1!";
$x = factorial(0);
is $x, 1, "0!";
$x = factorial(1);
is $x, 1, "1!";
$x = factorial(2);
is $x, 2, "2!";
$x = sprintf $format, factorial($k);
like $x, $f2, "$k! is $f2";
$x = sprintf $format, factorial($n);
like $x, $f1, "$n!";
$x = sprintf $format, factorial($f3);
# Test on machines that are "differently-abled."
if ( $x eq $inf ) {
    is $x, $inf, "$f3!";
}
else {
    is $x, $f4, "$f3!";
}

# Big Factorial
$x = bfact(-1);
is $x, $nan, "-1!";
$x = bfact(0);
is $x, 1, "0!";
$x = bfact(1);
is $x, 1, "1!";
$x = bfact(2);
is $x, 2, "2!";
$x = sprintf $format, bfact($k);
like $x, $f2, "$k!";
$x = sprintf $format, bfact($n);
like $x, $f1, "$n!";
$x = sprintf $format, bfact($f3);
# Test on machines that are "differently-abled."
if ( $x eq $inf ) {
    is $x, $inf, "$f3!";
}
else {
    is $x, $f4, "$f3!";
}

done_testing();
