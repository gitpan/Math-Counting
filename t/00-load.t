#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Math::Counting' ) || print "Bail out!
";
}

diag( "Testing Math::Counting $Math::Counting::VERSION, Perl $], $^X" );
