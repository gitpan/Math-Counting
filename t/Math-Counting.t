#!/usr/bin/perl -w
use strict;
use Test::More tests => 4;
use_ok 'Math::Counting';

# XXX This is hardly what I would call a test, much less a rigorous one.

my $n = 42;
my $r = 27;
my $f = 1.40500611775288e+51;
my $p = 1.07443118266648e+39;
my $c = 98_672_427_616;

my $x = eval { Math::Counting::factorial($n) };
diag($@) if $@;
is $x, $f, "$n factorial = $x";

$x = eval { Math::Counting::permutation($n, $r) };
diag($@) if $@;
is $x, $p, "$n permutation $r = $x";

$x = eval { Math::Counting::combination($n, $r) };
diag($@) if $@;
is $x, $c, "$n combination $r = $x";
