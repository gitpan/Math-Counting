# $Id: Counting.pm,v 1.3 2005/09/12 20:03:38 gene Exp $

package Math::Counting;
use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT $VERSION );
@EXPORT = qw( factorial permutation combination );
$VERSION = '0.00_02';

sub factorial {
    my $n = shift;
    my $product = 1;
    until( $n == 0 ) {
        $product *= $n--;
    }
    return $product;
}

sub permutation {
    my( $n, $r ) = @_;
    return 'not yet implemented';
}

sub combination {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r ) {
        $product *= $n--;
        $product /= $r--;
    }
    return $product;
}

1;

__END__

=head1 NAME

Math::Counting - Counting operations for probability and combinatorics

=head1 SYNOPSIS

  use Math::Counting qw( factorial permutation combination );

  my $n = 123;
  my $r = 42;

  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb = %d\n",
    $n, $r,
    factorial($n), permutation($n, $r), $x->combination($n, $r);

=head1 DESCRIPTION

Compute the numerical factorial, number of permutations or
combinations with the technique of "tail call elimination."

=head1 FUNCTIONS

=head2 factorial

  $f = factorial($n);

Return the factorial of B<n>.

=head2 permutation

  $p = permutation($n, $r);

Return the number of permutations.

=head2 combination

  $c = combination($n, $r);

Return the number of combinations.

=head1 THANK YOU

Mark Jason Dominus E<lt>mjd@cpan.orgE<gt> for writing
C<Higher Order Perl>.

=head1 SEE ALSO

C<http://www.plover.com/~mjd/misc/perl/pc.pl>

=head1 COPYRIGHT

Copyright 2005, Gene Boggs, All Rights Reserved

=head1 LICENSE

You may use this module under the terms of the BSD, Artistic, or GPL 
licenses, any version.

=head1 AUTHOR

Gene Boggs E<lt>gene@cpan.orgE<gt>

=cut
