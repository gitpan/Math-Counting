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
my $c   = '9.86724276e+10';
my $c1  = '9.73469713e+14';
my $c2  = '4.37683992e+18';
my $c3  = '6.80841765e+18';
my $c4  = '8.39455243e+23';
my $nan = 'NaN';
my $inf = 'inf';

# Combination without repetition
$x = combination('foo', 'bar');
is $x, undef, 'foo C bar does not make sense';
$x = combination(0 - $n, 0 - $k);
is $x, undef, "-$n C -$k == undef";
$x = combination(-1, 0);
is $x, undef, "-1 C 0 == undef";
$x = combination(0, -1);
is $x, undef, "0 C -1 == undef";
$x = combination(0, 0);
is $x, 1, "0 C 0 == 1";
$x = combination(0, 1);
is $x, 0, "0 C 1 == 0";
$x = combination(1, 0);
is $x, 1, "1 C 0 == 1";
$x = combination(1, 1);
is $x, 1, "1 C 1 == 1";
$x = combination($k, $k);
is $x, 1, "$k C $k == 1";
$x = combination($k, $n);
is $x, 0, "$k C $n == 0";
$x = sprintf $format, combination($n, $k);
is $x, $c, "$n C $k == $c";
$x = combination($n, $n);
is $x, 1, "$n C $n == 1";

# Big Combination without repetition
$x = bcomb(0 - $n, 0 - $k);
is $x, $nan, "-$n bcomb -$k == $nan";
$x = bcomb(-1, 0);
is $x, $nan, "-1 bcomb 0 == $nan";
$x = bcomb(0, -1);
is $x, $nan, "0 bcomb -1 == $nan";
$x = bcomb(0, 0);
is $x, 1, "0 bcomb 0 == 1";
$x = bcomb(0, 1);
is $x, $nan, "0 bcomb 1 == $nan";
$x = bcomb(1, 0);
is $x, 1, "1 bcomb 0 == 1";
$x = bcomb(1, 1);
is $x, 1, "1 bcomb 1 == 1";
$x = bcomb($k, $k);
is $x, 1, "$k bcomb $k == 1";
$x = bcomb($k, $n);
is $x, $nan, "$k bcomb $n == $nan";
$x = sprintf $format, bcomb($n, $k);
is $x, $c, "$n bcomb $k == $c";
$x = bcomb($n, $n);
is $x, 1, "$n bcomb $n == 1";

# Big Combination with repetition
$x = bcomb(0 - $n, 0 - $k, 1);
is $x, $nan, "-$n bcomb -$k == $nan";
$x = bcomb(-1, 0, 1);
is $x, $nan, "-1 bcomb 0 == $nan";
$x = bcomb(0, -1, 1);
is $x, $nan, "0 bcomb -1 == $nan";
$x = bcomb(0, 0, 1);
is $x, $nan, "0 bcomb 0 == $nan";
$x = bcomb(0, 1, 1);
is $x, $nan, "0 bcomb 1 == $nan";
$x = bcomb(1, 0, 1);
is $x, 1, "1 bcomb 0 == 1";
$x = bcomb(1, 1, 1);
is $x, 1, "1 bcomb 1 == 1";
$x = sprintf $format, bcomb($k, $k, 1);
is $x, $c1, "$k bcomb $k == $c1";
$x = sprintf $format, bcomb($k, $n, 1);
is $x, $c2, "$k bcomb $n == $c2";
$x = sprintf $format, bcomb($n, $k, 1);
is $x, $c3, "$n bcomb $k == $c3";
$x = sprintf $format, bcomb($n, $n, 1);
is $x, $c4, "$n bcomb $n == $c4";

done_testing();
