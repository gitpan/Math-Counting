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
my $f   = '1.40500612e+51';
my $f2  = '1.08888695e+28';
my $p   = '1.07443118e+39';
my $p2  = '4.43426488e+38';
my $p3  = '1.31002051e+60';
my $p4  = '6.72559700e+43';
my $p5  = '1.50130938e+68';
my $p6  = '2.00000000e+00';
my $p7  = '9.00000000e+00';
my $p8  = '1.76214841e+08';
my $p9  = '9.75810738e+31';
my $nan = 'NaN';
my $inf = 'inf';

# Permutation without repetition
$x = permutation(-1, 0);
is $x, undef, "-1 P 0 == undef";
$x = permutation(0, -1);
is $x, undef, "0 P -1 == undef";
$x = permutation(0 - $k, 0 - $n);
is $x, undef, "-$k P -$n == undef";
$x = permutation(0, 0);
is $x, 1, "0 P 0 == 1";
$x = permutation(0, 1);
is $x, 0, "0 P 1 == 0";
$x = permutation(1, 0);
is $x, 1, "1 P 0 == 1";
$x = permutation(1, 1);
is $x, 1, "1 P 1 == 1";
$x = sprintf $format, permutation($k, $k);
is $x, $f2, "$k P $k == $f2";
$x = permutation($k, $n);
is $x, 0, "$k P $n == 0";
$x = sprintf $format, permutation($n, $k);
is $x, $p, "$n P $k == $p";
$x = sprintf $format, permutation($n, $n);
is $x, $f, "$n P $n == $f";

# Big Permutation without repetition
$x = bperm(0 - $k, 0 - $n);
is $x, $nan, "-$k bperm -$n == $nan";
$x = bperm(-1, 0);
is $x, $nan, "-1 bperm 0 == $nan";
$x = bperm(0, -1);
is $x, 1, "0 bperm -1 == 1";
$x = bperm(0, 0);
is $x, 1, "0 bperm 0 == 1";
$x = bperm(0, 1);
is $x, $nan, "0 bperm 1 == $nan";
$x = bperm(1, 0);
is $x, 1, "1 bperm 0 == 1";
$x = bperm(1, 1);
is $x, 1, "1 bperm 1 == 1";
$x = sprintf $format, bperm($k, $k);
is $x, $f2, "$k bperm $k == $f2";
$x = bperm($k, $n);
is $x, $nan, "$k bperm $n == $nan";
$x = sprintf $format, bperm($n, $k);
is $x, $p, "$n bperm $k == $p";
$x = sprintf $format, bperm($n, $n);
is $x, $f, "$n bperm $n == $f";

# Big Permutation with repetition
$x = bperm(0 - $k, 0 - $n, 1);
is $x, $nan, "-$k bperm -$n == $nan";
$x = bperm(-1, 0, 1);
is $x, 1, '-1 bperm 0 == 1';
$x = bperm(0, -1, 1);
is $x, $inf, "0 bperm -1 == $inf";
$x = bperm(0, 0, 1);
is $x, 1, "0 bperm 0 == 1";
$x = bperm(0, 1, 1);
is $x, 0, "0 bperm 1 == 0";
$x = bperm(1, 0, 1);
is $x, 1, "1 bperm 0 == 1";
$x = bperm(1, 1, 1);
is $x, 1, "1 bperm 1 == 1";
$x = sprintf $format, bperm($k, $k, 1);
is $x, $p2, "$k bperm $k == $p2";
$x = sprintf $format, bperm($k, $n, 1);
is $x, $p3, "$k bperm $n == $p3";
$x = sprintf $format, bperm($n, $k, 1);
is $x, $p4, "$n bperm $k == $p4";
$x = sprintf $format, bperm($n, $n, 1);
is $x, $p5, "$n bperm $n == $p5";

# Derangements
# 0, 1, 2, 9, 44, 265, 1854...
$x = bderange(0);
is $x, 1, "bderange(0) == 1";
$x = bderange(1);
is $x, 0, "bderange(1) == 0";
$x = bderange(2);
is $x, 1, "bderange(2) == 1";
$x = sprintf $format, bderange(3);
is $x, $p6, "bderange(3) == 2";
$x = sprintf $format, bderange(4);
is $x, $p7, "bderange(4) == 9";
$x = sprintf $format, bderange(12);
is $x, $p8, "bderange(12) == $p8";
$x = sprintf $format, bderange(30);
is $x, $p9, "bderange(30) == $p9";

done_testing();
