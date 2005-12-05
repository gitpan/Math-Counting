# $Id: Counting.pm,v 1.14 2005/12/05 03:35:18 gene Exp $

package Math::Counting;
use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT %EXPORT_TAGS $VERSION );
@EXPORT = qw( factorial permutation combination f P C );
%EXPORT_TAGS = (
      all => [qw( factorial permutation combination f P C )],
);
$VERSION = 0.05;

sub f { factorial(@_) }
sub factorial {
    my( $n ) = @_;
    my $product = 1;
    while( $n > 0 ) {
        $product *= $n--;
    }
    return $product;
}

sub P { permutation(@_) }
sub permutation {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $r--;
    }
    return $product;
}

sub C { combination(@_) }
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

Math::Counting - Combinatorial counting operations

=head1 SYNOPSIS

  use Math::Counting qw( factorial permutation combination );
  # Also:
  #use Math::Counting qw( f P C );
  #use Math::Counting qw( :all );

  my $n = 42;
  my $r = 27;

  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb=%d\n",
    $n, $r, factorial($n), permutation($n, $r), combination($n, $r);

=head1 DESCRIPTION

Compute the numerical factorial, number of permutations and number of
combinations using the technique of "tail call elimination" as detailed
in B<Higher Order Perl> and based on the algorithms in B<Mastering
Algorithms with Perl>.

Note that this code uses floating point, as opposed to "infinite
precision," arithmetic.

=head1 FUNCTIONS

=head2 factorial

  $f = factorial($n);
  $f = f($n);

Return the number of arrangements of B<n>.

=head2 permutation

  $p = permutation($n, $r);
  $p = P($n, $r);

Return the number of arrangements of B<r> elements drawn from a set of
B<n> elements.  B<nPn> is the same as B<n!>.

=head2 combination

  $c = combination($n, $r);
  $c = C($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements.

=head1 TO DO

Provide the gamma function for the factorial of non-integer numbers?

=head1 SEE ALSO

B<Higher Order Perl> by Mark Jason Dominus
(L<http://hop.perl.plover.com/>).

B<Mastering Algorithms with Perl> by Orwant, Hietaniemi & Macdonald
(L<http://www.oreilly.com/catalog/maperl/>).

The B<bfac> function of the C<Math::BigInt> module.

L<Algorithm::Combinatorics>

L<String::OrderedCombination> for B<nPk> list generation.

L<Math::Combinatorics> for B<nPn> and B<nCr> list generation.

And L<http://encyclopedia.laborlawtalk.com/Permutation>, actually.

=head1 AUTHOR

Not me.  I am but a pebble on the beach.

=head1 COPYRIGHT AND LICENSE

Copyright 2005 Gene Boggs All Rights Reserved

You may use this package under the same terms as Perl itself.

=cut
