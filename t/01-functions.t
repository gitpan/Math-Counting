#!/usr/bin/perl
use strict;
use warnings;
use Test::More 'no_plan';

use_ok 'Math::Counting', qw(:student :big);

# This is not the most rigorous test.
# 42 is the magic constant of the smallest magic cube composed with
# the numbers 1 to 27.  And 27 is the first odd perfect cube, apart
# from the number, 1.

my $format = '%.8e';
my $x;
my $n   = 42;
my $r   = 27;
my $f   = 1.40500612e+051;
my $f2  = 1.08888695e+028;
my $p   = 1.07443118e+039;
my $c   = 98_672_427_616;
my $nan = 'NaN';

# Factorial  ---------------------------------------------------------

$x = factorial();
is $x, undef, 'undef! == undef';
$x = factorial('foo');
is $x, undef, 'foo! == undef';
$x = factorial(0 - $r);
is $x, undef, "-$r! == undef";
$x = factorial(-1);
is $x, undef, "-1! == undef";
$x = factorial(0);
is $x, 1, "0! == 1";
$x = factorial(1);
is $x, 1, "1! == 1";
$x = factorial(2);
is $x, 2, "2! == 2";
$x = sprintf $format, factorial($r);
is $x, $f2, "$r! is $f2";
$x = sprintf $format, factorial($n);
is $x, $f, "$n! == $f";

# Permutation --------------------------------------------------------

$x = permutation('foo', 'bar');
is $x, undef, 'foo P bar does not make sense';
$x = permutation(0 - $r, 0 - $n);
is $x, undef, "-$r P -$n == undef";
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
$x = sprintf $format, permutation($r, $r);
is $x, $f2, "$r P $r == $f2";
$x = permutation($r, $n);
is $x, 0, "$r P $n == 0";
$x = sprintf $format, permutation($n, $r);
is $x, $p, "$n P $r == $p";
$x = sprintf $format, permutation($n, $n);
is $x, $f, "$n P $n == $f";

# Combination --------------------------------------------------------

$x = combination('foo', 'bar');
is $x, undef, 'foo C bar does not make sense';
$x = combination(0 - $n, 0 - $r);
is $x, undef, "-$n C -$r == undef";
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
$x = combination($r, $r);
is $x, 1, "$r C $r == 1";
$x = combination($r, $n);
is $x, 0, "$r C $n == 0";
$x = combination($n, $r);
is $x, $c, "$n C $r == $c";
$x = combination($n, $n);
is $x, 1, "$n C $n == 1";

# Factorial  ---------------------------------------------------------

$x = bfact(0 - $r);
is $x, $nan, "-$r! == $nan";
$x = bfact(-1);
is $x, $nan, "-1! == $nan";
$x = bfact(0);
is $x, 1, "0! == 1";
$x = bfact(1);
is $x, 1, "1! == 1";
$x = bfact(2);
is $x, 2, "2! == 2";
$x = sprintf $format, bfact($r);
is $x, $f2, "$r! == $f2";
$x = sprintf $format, bfact($n);
is $x, $f, "$n! == $f";

# Permutation --------------------------------------------------------

$x = bperm(0 - $r, 0 - $n);
is $x, $nan, "-$r bperm -$n == $nan";
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
$x = sprintf $format, bperm($r, $r);
is $x, $f2, "$r bperm $r == $f2";
$x = bperm($r, $n);
is $x, $nan, "$r bperm $n == $nan";
$x = sprintf $format, bperm($n, $r);
is $x, $p, "$n bperm $r == $p";
$x = sprintf $format, bperm($n, $n);
is $x, $f, "$n bperm $n == $f";

# Combination --------------------------------------------------------

$x = bcomb(0 - $n, 0 - $r);
is $x, $nan, "-$n bcomb -$r == $nan";
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
$x = bcomb($r, $r);
is $x, 1, "$r bcomb $r == 1";
$x = bcomb($r, $n);
is $x, $nan, "$r bcomb $n == $nan";
$x = bcomb($n, $r);
is $x, $c, "$n bcomb $r == $c";
$x = bcomb($n, $n);
is $x, 1, "$n bcomb $n == 1";
