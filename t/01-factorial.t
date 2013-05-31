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
my $f   = '1.40500612e+51';
my $f2  = '1.08888695e+28';
my $nan = 'NaN';
my $inf = 'inf';

# Factorial
$x = factorial();
is $x, undef, 'undef! == undef';
$x = factorial('foo');
is $x, undef, 'foo! == undef';
$x = factorial(-1);
is $x, undef, "-1! == undef";
$x = factorial(0);
is $x, 1, "0! == 1";
$x = factorial(1);
is $x, 1, "1! == 1";
$x = factorial(2);
is $x, 2, "2! == 2";
$x = sprintf $format, factorial($k);
is $x, $f2, "$k! is $f2";
$x = sprintf $format, factorial($n);
is $x, $f, "$n! == $f";
$x = sprintf $format, factorial($f3);
ok $x eq $inf || $x eq $f4, "$f3! == $inf or $f4";

# Big Factorial
$x = bfact(-1);
is $x, $nan, "-1! == $nan";
$x = bfact(0);
is $x, 1, "0! == 1";
$x = bfact(1);
is $x, 1, "1! == 1";
$x = bfact(2);
is $x, 2, "2! == 2";
$x = sprintf $format, bfact($k);
is $x, $f2, "$k! == $f2";
$x = sprintf $format, bfact($n);
is $x, $f, "$n! == $f";
$x = sprintf $format, bfact($f3);
ok $x eq $inf || $x eq $f4, "$f3! == $inf or $f4";

done_testing();
