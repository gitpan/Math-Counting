#!/usr/bin/perl -w
use strict;
use Test::More tests => 6;
use_ok 'Math::Counting';

my $obj = eval { Math::Counting->new };
warn $@ if $@;
isa_ok $obj, 'Math::Counting';

my @args = (123, 42);
$obj = eval { Math::Counting->new(@args) };
warn $@ if $@;
isa_ok $obj, 'Math::Counting';

my $x = eval { $obj->factorial };
ok $x, "factorial = $x";

$x = eval { $obj->permutation };
ok $x, "permutation = $x";

$x = eval { $obj->combination };
ok $x, "combination = $x";
