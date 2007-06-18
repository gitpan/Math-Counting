# $Id: Counting.pm,v 1.17 2007/06/18 08:24:51 gene Exp $
package Math::Counting;
use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT_OK @EXPORT %EXPORT_TAGS $VERSION );
@EXPORT_OK = ();
@EXPORT = qw(
    f factorial bfact
    P permute permutation bperm
    C choose combination bcomb
);
%EXPORT_TAGS = (
    short => [qw( f P C )],
    long  => [qw( factorial permutation combination )],
    big   => [qw( bfact bperm bcomb )],
);
$VERSION = 0.07;
use Math::BigInt try => 'GMP';

# The student version:
sub f { factorial(@_) }
sub factorial {
    my( $n ) = @_;
    my $product = 1;
    while( $n > 0 ) {
        $product *= $n--;
    }
    return $product;
}
# The right way to do it:
sub bfact {
    my $n = Math::BigInt->new( shift );
    return $n->bfac();
}

sub P { permutation(@_) }
sub permute{ permutation(@_) }
sub permutation {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $r--;
    }
    return $product;
}
sub bperm {
    my( $n, $r ) = @_;
    $n = Math::BigInt->new( $n );
    $r = Math::BigInt->new( $r );
    $r = $n - $r;
    return $n->bfac() / $r->bfac();
}

sub C { combination(@_) }
sub choose { combination(@_) }
sub combination {
    my( $n, $r ) = @_;
    my $product = 1;
    while( $r > 0 ) {
        $product *= $n--;
        $product /= $r--;
    }
    return $product;
}
sub bcomb {
    my( $n, $k ) = @_;
    $n = Math::BigInt->new( $n );
    $k = Math::BigInt->new( $k );
    my $r = $n - $k;
    return $n->bfac() / ($k->bfac() * $r->bfac());
}

1;

__END__

=head1 NAME

Math::Counting - Combinatorial counting operations

=head1 SYNOPSIS

  # The algorithm student version:
  use Math::Counting ':long';
  my( $n, $r ) = ( 42, 27 );
  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb=%d\n",
    $n, $r, factorial($n), permutation($n, $r), combination($n, $r);
  use Math::Counting ':short';
  my( $n, $r ) = ( 42, 27 );
  printf "Given n=%d and r=%d:\nF=%d\nP=%d\nC=%d\n",
    $n, $r, f($n), P($n, $r), C($n, $r);

  # The right way to do it:
  use Math::Counting ':big';
  my( $n, $r ) = ( 42, 27 );
  printf "n=%d, r=%d:\nBig F=%d\n Big P=%d\nBig C=%d\n",
    $n, $r, bfact($n), bperm($n, $r), bcomb($n, $r);

=head1 DESCRIPTION

Compute the numerical factorial, number of n,r permutations and number
of n,r combinations using the technique of "tail call elimination" as
detailed in B<Higher Order Perl> and based on the algorithms in
B<Mastering Algorithms with Perl>.

This code contains functions for both the "student" and "right way to
do it" versions using real arithmetic and infinite precision
arithmetic, respectively.

No functions are exported by default.

=head1 FUNCTIONS

=head2 f, factorial

  $f = f($n);
  $f = factorial($n);

Return the number of arrangements of B<n> according to the "student"
version using real arithmetic.

=head2 bfact

  $f = bfact($n);

Return the value of the L<Math::BigInt/bfact> function, which is the
"Right Way To Do It."

=head2 P, permutation

  $p = P($n, $r);
  $p = permutation($n, $r);

Return the number of arrangements of B<r> elements drawn from a set of
B<n> elements.  B<nPn> is the same as B<n!>.  This function employs
the "student" version using real arithmetic.

=head2 bperm

  $p = bperm($n);

Return the C<Math::BigInt> computation: B<n!/(n-r)!>.

=head2 C, choose, combination

  $c = C($n, $r);
  $c = choose($n, $r);
  $c = combination($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements.  This function employs the "student" version using real
arithmetic.

=head2 bcomb

  $c = bcomb($n);

Return the C<Math::BigInt> computation: B<n!/r!(n-r)!>.

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

L<http://en.wikipedia.org/wiki/Permutation>

L<http://en.wikipedia.org/wiki/Combination>

=head1 AUTHOR

E<lt>gene@cpan.orgE<gt> and others in the L<SEE ALSO> section.

=head1 COPYRIGHT

Copyright 2005 Gene Boggs All Rights Reserved

You may use this package under the same terms as Perl itself.

=cut
