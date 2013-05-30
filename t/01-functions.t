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
my $p   = '1.07443118e+39';
my $p2  = '4.43426488e+38';
my $p3  = '1.31002051e+60';
my $p4  = '6.72559700e+43';
my $p5  = '1.50130938e+68';
my $c   = '9.86724276e+10';
my $c1  = '9.73469713e+14';
my $c2  = '4.37683992e+18';
my $c3  = '6.80841765e+18';
my $c4  = '8.39455243e+23';
my $nan = 'NaN';
my $inf = 'inf';

# Factorial
$x = factorial();
is $x, undef, 'undef! == undef';
$x = factorial('foo');
is $x, undef, 'foo! == undef';
$x = factorial(0 - $k);
is $x, undef, "-$k! == undef";
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
is $x, $inf, "($f3)! == $inf";

# Permutation without repetition
$x = permutation('foo', 'bar');
is $x, undef, 'foo P bar does not make sense';
$x = permutation(0 - $k, 0 - $n);
is $x, undef, "-$k P -$n == undef";
$x = permutation(-1, 0);
is $x, undef, "-1 P 0 == undef";
$x = permutation(0, -1);
is $x, undef, "0 P -1 == undef";
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

# Big Factorial
$x = bfact(0 - $k);
is $x, $nan, "-$k! == $nan";
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
ok $x ne $f4, "($f3)! != $f4";

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
