#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 31;
 
use_ok 'Math::Counting', ':long';
print "Used :long names\n" unless $@;
use_ok 'Math::Counting', ':short';
print "Used :short names\n" unless $@;

# This is not what I would call a rigorous test.  However, it works
# and more importantly, 42 is the magic constant of the smallest magic
# cube composed with the numbers 1 to 27.  And 27 is the first odd
# perfect cube, apart from the number, 1. Anyway, the commented tests
# work fine but produce the expected errors.
#
my $x;
my $n  = 42;
my $r  = 27;
my $f  = 1.40500611775288e+51;
my $f2 = 1.08888694504184e+28;
my $p  = 1.07443118266648e+39;
my $c  = 98_672_427_616;
# These variables work for the commented-out tests below.
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

$x = eval { f(0 - $r) };
is $x, 1, "-$r! == 1";

$x = eval { f(-1) };
is $x, 1, "-1! == 1";

$x = eval { f(0) };
is $x, 1, "0! == 1";

$x = eval { f(1) };
is $x, 1, "1! == 1";

$x = eval { f(2) };
is $x, 2, "2! == 2";

$x = eval { f($r) };
is $x, $f2, "$r! == $f2";

$x = eval { f($n) };
is $x, $f, "$n! == $f";

#$x = eval { f($nr) };
#is $x, $f3, "$nr! == $f3";

# Permutation --------------------------------------------------------
$x = eval { P(0 - $r, 0 - $n) };
is $x, 1, "-$r P -$n == 1";

$x = eval { P(0, 0) };
is $x, 1, "-1 P 0 == 1";

$x = eval { P(0, 0) };
is $x, 1, "0 P -1 == 1";

$x = eval { P(0, 0) };
is $x, 1, "0 P 0 == 1";

$x = eval { P(0, 1) };
is $x, 0, "0 P 1 == 0";

$x = eval { P(1, 0) };
is $x, 1, "1 P 0 == 1";

$x = eval { P(1, 1) };
is $x, 1, "1 P 1 == 1";

$x = eval { P($r, $r) };
is $x, $f2, "$r P $r == $f2";

$x = eval { P($r, $n) };
is $x, 0, "$r P $n == 0";

$x = eval { P($n, $r) };
is $x, $p, "$n P $r == $p";

$x = eval { P($n, $n) };
is $x, $f, "$n P $n == $f";

#$x = eval { P($rn, $nr) };
#is $x, $p3, "$rn P $nr == $p3";

#$x = eval { P($nr, $rn) };
#is $x, $p2, "$nr P $rn == $p2";

#$x = eval { P($nr, $nr) };
#is $x, $f3, "$nr P $nr == $f3";

#$x = eval { P('foo', 'bar') };
#ok $x, "foo P bar doesn't make sense, does it?";

# Combination --------------------------------------------------------
$x = eval { C(0 - $n, 0 - $r) };
is $x, 1, "-$n C -$r == 1";

$x = eval { C(-1, 0) };
is $x, 1, "-1 C 0 == 1";

$x = eval { C(0, -1) };
is $x, 1, "0 C -1 == 1";

$x = eval { C(0, 0) };
is $x, 1, "0 C 0 == 1";

$x = eval { C(0, 1) };
is $x, 0, "0 C 1 == 0";

$x = eval { C(1, 0) };
is $x, 1, "1 C 0 == 1";

$x = eval { C(1, 1) };
is $x, 1, "1 C 1 == 1";

$x = eval { C($r, $r) };
is $x, 1, "$r C $r == 1";

$x = eval { C($r, $n) };
is $x, 0, "$r C $n == 0";

$x = eval { C($n, $r) };
is $x, $c, "$n C $r == $c";

$x = eval { C($n, $n) };
is $x, 1, "$n C $n == 1";

#$x = eval { C($rn, $nr) };
#is $x, $c3, "$rn C $nr == $c3";

#$x = eval { C($nr, $rn) };
#is $x, $c2, "$nr C $rn == $c2";

#$x = eval { C('foo', 'bar') };
#ok $x, "Sorry. foo C bar doesn't make sense either.";
