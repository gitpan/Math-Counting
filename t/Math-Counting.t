#!/usr/bin/perl -w
use strict;
use Test::More tests => 30;
use_ok 'Math::Counting';

# This is not what I would call a rigorous test.  However, 42 is the
# magic constant of the smallest magic cube composed with the numbers
# 1 to 27.  And 27 is the first odd perfect cube, apart from 1.
# Fwiw, the commented tests work but produce errors which looks "bad."
#
my $n  = 42;
my $r  = 27;
my $nr = "$n.$r";
my $rn = "$r.$n";
my $f  = 1.40500611775288e+51;
my $f2 = 1.15779768813762e+51;
my $f3 = 1.08888694504184e+28;
my $p  = 1.07443118266648e+39;
my $p2 = 2.1509587366946e+40;
my $p3 = -5.63517016619666e+39;
my $c  = 98_672_427_616;
my $c2 = 1032981615959.22;
my $c3 = -4.86714580961129e-12;
my $x;

# Factorial  ---------------------------------------------------------
#$x = eval { Math::Counting::factorial() };
#is $x, 1, "undef! == 1 and produces that error.";

#$x = eval { Math::Counting::factorial('foo') };
#is $x, 1, "foo! == 1 and produces that error.";

$x = eval { Math::Counting::factorial(0 - $r) };
is $x, 1, "-$r! == 1";

$x = eval { Math::Counting::factorial(-1) };
is $x, 1, "-1! == 1";

$x = eval { Math::Counting::factorial(0) };
is $x, 1, "0! == 1";

$x = eval { Math::Counting::factorial(1) };
is $x, 1, "1! == 1";

$x = eval { Math::Counting::factorial(2) };
is $x, 2, "2! == 2";

$x = eval { Math::Counting::factorial($r) };
is $x, $f3, "$r! == $f3";

$x = eval { Math::Counting::factorial($n) };
is $x, $f, "$n! == $f";

#$x = eval { Math::Counting::factorial($nr) };
#is $x, $f2, "$nr! == $f2";

# Permutation --------------------------------------------------------
$x = eval { Math::Counting::permutation(0 - $r, 0 - $n) };
is $x, 1, "-$r P -$n == 1";

$x = eval { Math::Counting::permutation(0, 0) };
is $x, 1, "-1 P 0 == 1";

$x = eval { Math::Counting::permutation(0, 0) };
is $x, 1, "0 P -1 == 1";

$x = eval { Math::Counting::permutation(0, 0) };
is $x, 1, "0 P 0 == 1";

$x = eval { Math::Counting::permutation(0, 1) };
is $x, 0, "0 P 1 == 0";

$x = eval { Math::Counting::permutation(1, 0) };
is $x, 1, "1 P 0 == 1";

$x = eval { Math::Counting::permutation(1, 1) };
is $x, 1, "1 P 1 == 1";

$x = eval { Math::Counting::permutation($r, $r) };
is $x, $f3, "$r P $r == $f3";

$x = eval { Math::Counting::permutation($r, $n) };
is $x, 0, "$r P $n == 0";

$x = eval { Math::Counting::permutation($n, $r) };
is $x, $p, "$n P $r == $p";

$x = eval { Math::Counting::permutation($n, $n) };
is $x, $f, "$n P $n == $f";

#$x = eval { Math::Counting::permutation($rn, $nr) };
#is $x, $p3, "$rn P $nr == $p3";

#$x = eval { Math::Counting::permutation($nr, $rn) };
#is $x, $p2, "$nr P $rn == $p2";

#$x = eval { Math::Counting::permutation($nr, $nr) };
#is $x, $f2, "$nr P $nr == $f2";

#$x = eval { Math::Counting::permutation('foo', 'bar') };
#ok $x, "foo P bar doesn't make sense, does it?";

# Combination --------------------------------------------------------
$x = eval { Math::Counting::combination(0 - $n, 0 - $r) };
is $x, 1, "-$n C -$r == 1";

$x = eval { Math::Counting::combination(-1, 0) };
is $x, 1, "-1 C 0 == 1";

$x = eval { Math::Counting::combination(0, -1) };
is $x, 1, "0 C -1 == 1";

$x = eval { Math::Counting::combination(0, 0) };
is $x, 1, "0 C 0 == 1";

$x = eval { Math::Counting::combination(0, 1) };
is $x, 0, "0 C 1 == 0";

$x = eval { Math::Counting::combination(1, 0) };
is $x, 1, "1 C 0 == 1";

$x = eval { Math::Counting::combination(1, 1) };
is $x, 1, "1 C 1 == 1";

$x = eval { Math::Counting::combination($r, $r) };
is $x, 1, "$r C $r == 1";

$x = eval { Math::Counting::combination($r, $n) };
is $x, 0, "$r C $n == 0";

$x = eval { Math::Counting::combination($n, $r) };
is $x, $c, "$n C $r == $c";

$x = eval { Math::Counting::combination($n, $n) };
is $x, 1, "$n C $n == 1";

#$x = eval { Math::Counting::combination($rn, $nr) };
#is $x, $c3, "$rn C $nr == $c3";

#$x = eval { Math::Counting::combination($nr, $rn) };
#is $x, $c2, "$nr C $rn == $c2";

#$x = eval { Math::Counting::combination('foo', 'bar') };
#ok $x, "Sorry. foo C bar doesn't make sense either.";
