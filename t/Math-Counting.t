#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 30;

use_ok 'Math::Counting', qw(factorial permutation combination);

# This is not what I would call a rigorous test.  However, it works
# and more importantly, 42 is the magic constant of the smallest magic
# cube composed with the numbers 1 to 27.  And 27 is the first odd
# perfect cube, apart from 1, so that's cool. Anyway, the commented
# tests work but produce errors which "looks bad."
#
my $x;
my $n  = 42;
my $r  = 27;
my $f  = 1.40500611775288e+51;
my $f2 = 1.08888694504184e+28;
my $p  = 1.07443118266648e+39;
my $c  = 98_672_427_616;
# These variables are for the working but "commented-out" tests below.
#my $nr = "$n.$r";
#my $rn = "$r.$n";
#my $f3 = 1.15779768813762e+51;
#my $p2 = 2.1509587366946e+40;
#my $p3 = -5.63517016619666e+39;
#my $c2 = 1032981615959.22;
#my $c3 = -4.86714580961129e-12;

# Factorial  ---------------------------------------------------------
#$x = eval { factorial() };
#is $x, 1, "undef! == 1 and produces that error.";

#$x = eval { factorial('foo') };
#is $x, 1, "foo! == 1 and produces that error.";

$x = eval { factorial(0 - $r) };
is $x, 1, "-$r! == 1";

$x = eval { factorial(-1) };
is $x, 1, "-1! == 1";

$x = eval { factorial(0) };
is $x, 1, "0! == 1";

$x = eval { factorial(1) };
is $x, 1, "1! == 1";

$x = eval { factorial(2) };
is $x, 2, "2! == 2";

$x = eval { factorial($r) };
is $x, $f2, "$r! == $f2";

$x = eval { factorial($n) };
is $x, $f, "$n! == $f";

#$x = eval { factorial($nr) };
#is $x, $f3, "$nr! == $f3";

# Permutation --------------------------------------------------------
$x = eval { permutation(0 - $r, 0 - $n) };
is $x, 1, "-$r P -$n == 1";

$x = eval { permutation(0, 0) };
is $x, 1, "-1 P 0 == 1";

$x = eval { permutation(0, 0) };
is $x, 1, "0 P -1 == 1";

$x = eval { permutation(0, 0) };
is $x, 1, "0 P 0 == 1";

$x = eval { permutation(0, 1) };
is $x, 0, "0 P 1 == 0";

$x = eval { permutation(1, 0) };
is $x, 1, "1 P 0 == 1";

$x = eval { permutation(1, 1) };
is $x, 1, "1 P 1 == 1";

$x = eval { permutation($r, $r) };
is $x, $f2, "$r P $r == $f2";

$x = eval { permutation($r, $n) };
is $x, 0, "$r P $n == 0";

$x = eval { permutation($n, $r) };
is $x, $p, "$n P $r == $p";

$x = eval { permutation($n, $n) };
is $x, $f, "$n P $n == $f";

#$x = eval { permutation($rn, $nr) };
#is $x, $p3, "$rn P $nr == $p3";

#$x = eval { permutation($nr, $rn) };
#is $x, $p2, "$nr P $rn == $p2";

#$x = eval { permutation($nr, $nr) };
#is $x, $f3, "$nr P $nr == $f3";

#$x = eval { permutation('foo', 'bar') };
#ok $x, "foo P bar doesn't make sense, does it?";

# Combination --------------------------------------------------------
$x = eval { combination(0 - $n, 0 - $r) };
is $x, 1, "-$n C -$r == 1";

$x = eval { combination(-1, 0) };
is $x, 1, "-1 C 0 == 1";

$x = eval { combination(0, -1) };
is $x, 1, "0 C -1 == 1";

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

#$x = eval { combination($rn, $nr) };
#is $x, $c3, "$rn C $nr == $c3";

#$x = eval { combination($nr, $rn) };
#is $x, $c2, "$nr C $rn == $c2";

#$x = eval { combination('foo', 'bar') };
#ok $x, "Sorry. foo C bar doesn't make sense either.";
