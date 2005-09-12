#!/usr/bin/perl -w
use strict;
use Test::More 'no_plan'; #tests => 31;
use_ok 'Math::Counting';

my $n = 42;
my $r = 6;

my $x = eval { Math::Counting::factorial($n) };
diag($@) if $@;
ok $x, "$n factorial = $x";

$n = 10;
$x = eval { Math::Counting::permutation($n, $r) };
diag($@) if $@;
ok $x, "$n permutation $r = $x";

$x = eval { Math::Counting::combination($n, $r) };
diag($@) if $@;
ok $x, "$n combination $r = $x";
