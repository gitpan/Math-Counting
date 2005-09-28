#!/usr/bin/perl -w
use strict;
use Test::More tests => 16;
use_ok 'Math::Counting';

# This is not what I would call a rigorous test.  However, 42 is the
# magic constant of the smallest magic cube composed with the numbers
# 1 to 27.  And 27 is the first odd perfect cube, apart from 1.
# Fwiw, the commented tests work but produce errors which looks "bad."
#
my $n  = 42;
my $r  = 27;
my $nr = $n .'.'. $r;
my $rn = $r .'.'. $n;
my $f  = 1.40500611775288e+51;
my $f2 = 1.15779768813762e+51;
my $p  = 1.07443118266648e+39;
my $p2 = 2.1509587366946e+40;
my $c  = 98_672_427_616;
my $c2 = 1032981615959.22;
my $x;

# Factorial  ---------------------------------------------------------
#$x = eval { Math::Counting::factorial() };
#is $x, 1, "undef! == 1 and produces that error.";

#$x = eval { Math::Counting::factorial('foo') };
#is $x, 1, "foo! == 1 and produces that error.";

$x = eval { Math::Counting::factorial(-1) };
is $x, 1, "-1! == 1";

$x = eval { Math::Counting::factorial(0 - $n) };
is $x, 1, "-$n! == 1";

$x = eval { Math::Counting::factorial(0) };
is $x, 1, "0! == 1";

$x = eval { Math::Counting::factorial($n) };
is $x, $f, "$n! == $f";

$x = eval { Math::Counting::factorial($nr) };
is $x, $f2, "$nr! == $f2";

# Permutation --------------------------------------------------------
$x = eval { Math::Counting::permutation($n, $r) };
is $x, $p, "$n P $r == $p";

$x = eval { Math::Counting::permutation(0, 0) };
is $x, 1, "0 P 0 == 1";

$x = eval { Math::Counting::permutation($r, $n) };
is $x, 0, "$r P $n == 0 (there are no arrangements)";

$x = eval { Math::Counting::permutation(0 - $r, 0 - $n) };
is $x, 1, "-$r P -$n == 1";

$x = eval { Math::Counting::permutation($nr, $rn) };
is $x, $p2, "$nr P $rn == $p2";

#$x = eval { Math::Counting::permutation('foo', 'bar') };
#ok $x, "foo P bar doesn't make sense, does it?";

# Combination --------------------------------------------------------
$x = eval { Math::Counting::combination($n, $r) };
is $x, $c, "$n C $r == $c";

$x = eval { Math::Counting::combination(0, 0) };
is $x, 1, "0 C 0 == 1";

$x = eval { Math::Counting::combination($r, $n) };
is $x, 0, "$r C $n == 0 (there are no choices)";

$x = eval { Math::Counting::combination(0 - $r, 0 - $n) };
is $x, 1, "-$r C -$n == 1";

$x = eval { Math::Counting::combination($nr, $rn) };
is $x, $c2, "$nr C $rn == $c2";

#$x = eval { Math::Counting::combination('foo', 'bar') };
#ok $x, "Sorry. foo C bar doesn't make sense either.";
