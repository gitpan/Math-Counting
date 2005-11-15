# $Id: Counting.pm,v 1.12 2005/11/15 19:05:14 gene Exp $

package Math::Counting;
use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT $VERSION );
@EXPORT = qw( factorial permutation combination );
$VERSION = 0.04;

sub factorial {
    my( $n ) = @_;
    my $product = 1;
    while( $n > 0 ) {
        $product *= $n--;
    }
    return $product;
}

sub permutation {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $r--;
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

Math::Counting - Combinatorial counting operations

=head1 SYNOPSIS

  use Math::Counting qw( factorial permutation combination );

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

Return the number of arrangements of B<n>.

=head2 permutation

  $p = permutation($n, $r);

Return the number of arrangements of B<r> elements drawn from a set of
B<n> elements.  B<nPn> is the same as B<n!>

The term "permutation" has a wide variety of definitions, like this
confusing gem: "The number of permutations of a set of n elements is
denoted n!  and pronounced 'n factorial.'"  However, here is an
enlightening quote from a reference below:

"In combinatorics, the term permutation has a traditional meaning,
which is used to include ordered lists without repetition, but not
exhaustive (so of less than maximum length)..."

This package uses the combinatorial sense of the term.

=head2 combination

  $c = combination($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements.

=head1 TO DO

Provide the gamma function for the factorial of non-integer numbers?

Provide a way to use infinite precision arithmetic?

=head1 SEE ALSO

The C<bfac> function of the C<Math::BigInt> module.

B<Higher Order Perl> by Mark Jason Dominus
(L<http://hop.perl.plover.com/>).

B<Mastering Algorithms with Perl> by Orwant, Hietaniemi & Macdonald
(L<http://www.oreilly.com/catalog/maperl/>).

And L<http://encyclopedia.laborlawtalk.com/Permutation> actually.

=head1 AUTHOR

Not me.  I am but a pebble on the beach.

=head1 COPYRIGHT AND LICENSE

Copyright 2005 Gene Boggs All Rights Reserved

You may use this package under the same terms as Perl itself.

=cut
