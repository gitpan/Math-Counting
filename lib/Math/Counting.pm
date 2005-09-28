# $Id: Counting.pm,v 1.3 2005/09/12 20:03:38 gene Exp $

package Math::Counting;
use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT $VERSION );
@EXPORT = qw( factorial permutation combination );
$VERSION = '0.01';

sub factorial {
    my $n = shift;
    my $product = 1;
    while( $n > 0 ) {
        $product *= $n--;
    }
    return $product;
}

sub permutation {
    my( $n, $k ) = @_;
    my $product = 1;
    while( $k > 0 ) {
        $product *= $n--;
        $k--;
    }
    return $product;
}

sub combination {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $product /= $r--;
    }
    return $product;
}

1;

__END__

=head1 NAME

Math::Counting - Efficient combinatorial counting operations

=head1 SYNOPSIS

  use Math::Counting qw( factorial permutation combination );

  my $n = 42;
  my $r = 27;

  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb=%d\n",
    $n, $r, factorial($n), permutation($n, $r), combination($n, $r);

=head1 DESCRIPTION

Compute the numerical factorial, number of permutations and number of
combinations using the efficient technique of "tail call elimination"
as detailed in B<Higher Order Perl> and based on the algorithms in
B<Mastering Algorithms with Perl>.

=head1 FUNCTIONS

=head2 factorial

  $f = factorial($n);

Return the number of arrangements of B<n>.

=head2 permutation

  $p = permutation($n, $k);

Return the number of arrangements of B<n> elements drawn from a set of
B<n> elements.

=head2 combination

  $c = combination($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements.

=head1 TO DO

Provide the gamma function for the factorial of non-integer numbers.

=head1 COPYRIGHT AND LICENSE

Copyright 2005, Gene Boggs, All Rights Reserved

You may use this package under the same terms as Perl itself.

=head1 AUTHOR

Not me.  I am but a pebble on the beach.

=head1 SEE ALSO

B<Higher Order Perl> by Mark Jason Dominus
(L<http://hop.perl.plover.com/>).

B<Mastering Algorithms with Perl> by Orwant, Hietaniemi & Macdonald
(L<http://www.oreilly.com/catalog/maperl/>).

=cut
