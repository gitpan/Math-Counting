#!/usr/bin/perl
use strict;
use warnings;
use Test::More 'no_plan';

use_ok 'Math::Counting', qw(:student :big);

# This is not a rigorous test.  However, it works.  More importantly,
# 42 is the magic constant of the smallest magic cube composed with
# the numbers 1 to 27.  And 27 is the first odd perfect cube, apart
# from the number, 1.

my $format = '%.10e';
my $x;
my $n   = 42;
my $r   = 27;
my $f   = '1.4050061178e+51';
my $f2  = '1.0888869450e+28';
my $p   = '1.0744311827e+39';
my $c   = 98_672_427_616;
my $nan = 'NaN';

# Factorial  ---------------------------------------------------------

$x = eval { factorial() };
is $x, undef, 'undef! == undef';
$x = eval { factorial('foo') };
is $x, undef, 'foo! == undef';
$x = eval { factorial(0 - $r) };
is $x, undef, "-$r! == undef";
$x = eval { factorial(-1) };
is $x, undef, "-1! == undef";
$x = eval { factorial(0) };
is $x, 1, "0! == 1";
$x = eval { factorial(1) };
is $x, 1, "1! == 1";
$x = eval { factorial(2) };
is $x, 2, "2! == 2";
$x = eval { sprintf $format, factorial($r) };
is $x, $f2, "$r! == $f2";
$x = eval { sprintf $format, factorial($n) };
is $x, $f, "$n! == $f";

# Permutation --------------------------------------------------------

$x = eval { permutation('foo', 'bar') };
is $x, undef, 'foo P bar does not make sense';
$x = eval { permutation(0 - $r, 0 - $n) };
is $x, undef, "-$r P -$n == undef";
$x = eval { permutation(-1, 0) };
is $x, undef, "-1 P 0 == undef";
$x = eval { permutation(0, -1) };
is $x, undef, "0 P -1 == undef";
$x = eval { permutation(0, 0) };
is $x, 1, "0 P 0 == 1";
$x = eval { permutation(0, 1) };
is $x, 0, "0 P 1 == 0";
$x = eval { permutation(1, 0) };
is $x, 1, "1 P 0 == 1";
$x = eval { permutation(1, 1) };
is $x, 1, "1 P 1 == 1";
$x = eval { sprintf $format, permutation($r, $r) };
is $x, $f2, "$r P $r == $f2";
$x = eval { permutation($r, $n) };
is $x, 0, "$r P $n == 0";
$x = eval { sprintf $format, permutation($n, $r) };
is $x, $p, "$n P $r == $p";
$x = eval { sprintf $format, permutation($n, $n) };
is $x, $f, "$n P $n == $f";

# Combination --------------------------------------------------------

$x = eval { combination('foo', 'bar') };
is $x, undef, 'foo C bar does not make sense';
$x = eval { combination(0 - $n, 0 - $r) };
is $x, undef, "-$n C -$r == undef";
$x = eval { combination(-1, 0) };
is $x, undef, "-1 C 0 == undef";
$x = eval { combination(0, -1) };
is $x, undef, "0 C -1 == undef";
$x = eval { combination(0, 0) };
is $x, 1, "0 C 0 == 1";
$x = eval { combination(0, 1) };
is $x, 0, "0 C 1 == 0";
$x = eval { combination(1, 0) };
is $x, 1, "1 C 0 == 1";
$x = eval { combination(1, 1) };
is $x, 1, "1 C 1 == 1";
$x = eval { combination($r, $r) };
is $x, 1, "$r C $r == 1";
$x = eval { combination($r, $n) };
is $x, 0, "$r C $n == 0";
$x = eval { combination($n, $r) };
is $x, $c, "$n C $r == $c";
$x = eval { combination($n, $n) };
is $x, 1, "$n C $n == 1";

# Factorial  ---------------------------------------------------------

$x = eval { bfact(0 - $r) };
is $x, $nan, "-$r! == $nan";
$x = eval { bfact(-1) };
is $x, $nan, "-1! == $nan";
$x = eval { bfact(0) };
is $x, 1, "0! == 1";
$x = eval { bfact(1) };
is $x, 1, "1! == 1";
$x = eval { bfact(2) };
is $x, 2, "2! == 2";
$x = eval { sprintf $format, bfact($r) };
is $x, $f2, "$r! == $f2";
$x = eval { sprintf $format, bfact($n) };
is $x, $f, "$n! == $f";

# Permutation --------------------------------------------------------

$x = eval { bperm(0 - $r, 0 - $n) };
is $x, $nan, "-$r bperm -$n == $nan";
$x = eval { bperm(-1, 0) };
is $x, $nan, "-1 bperm 0 == $nan";
$x = eval { bperm(0, -1) };
is $x, 1, "0 bperm -1 == 1";
$x = eval { bperm(0, 0) };
is $x, 1, "0 bperm 0 == 1";
$x = eval { bperm(0, 1) };
is $x, $nan, "0 bperm 1 == $nan";
$x = eval { bperm(1, 0) };
is $x, 1, "1 bperm 0 == 1";
$x = eval { bperm(1, 1) };
is $x, 1, "1 bperm 1 == 1";
$x = eval { sprintf $format, bperm($r, $r) };
is $x, $f2, "$r bperm $r == $f2";
$x = eval { bperm($r, $n) };
is $x, $nan, "$r bperm $n == $nan";
$x = eval { sprintf $format, bperm($n, $r) };
is $x, $p, "$n bperm $r == $p";
$x = eval { sprintf $format, bperm($n, $n) };
is $x, $f, "$n bperm $n == $f";

# Combination --------------------------------------------------------

$x = eval { bcomb(0 - $n, 0 - $r) };
is $x, $nan, "-$n bcomb -$r == $nan";
$x = eval { bcomb(-1, 0) };
is $x, $nan, "-1 bcomb 0 == $nan";
$x = eval { bcomb(0, -1) };
is $x, $nan, "0 bcomb -1 == $nan";
$x = eval { bcomb(0, 0) };
is $x, 1, "0 bcomb 0 == 1";
$x = eval { bcomb(0, 1) };
is $x, $nan, "0 bcomb 1 == $nan";
$x = eval { bcomb(1, 0) };
is $x, 1, "1 bcomb 0 == 1";
$x = eval { bcomb(1, 1) };
is $x, 1, "1 bcomb 1 == 1";
$x = eval { bcomb($r, $r) };
is $x, 1, "$r bcomb $r == 1";
$x = eval { bcomb($r, $n) };
is $x, $nan, "$r bcomb $n == $nan";
$x = eval { bcomb($n, $r) };
is $x, $c, "$n bcomb $r == $c";
$x = eval { bcomb($n, $n) };
is $x, 1, "$n bcomb $n == 1";
