# $Id: Counting.pm 920 2008-08-07 23:02:04Z gene $
package Math::Counting;
our $VERSION = '0.0801';

use strict;
use warnings;
use Carp;
use base 'Exporter';
use vars qw( @EXPORT %EXPORT_TAGS );
use Math::BigInt;

@EXPORT = qw(
    factorial   bfact
    permutation bperm
    combination bcomb
);
%EXPORT_TAGS = (
    student => [qw( factorial permutation combination )],
    big =>     [qw( bfact     bperm       bcomb )],
);

# The algorithmically elegant way:
sub factorial {
    my( $n ) = @_;
    return unless defined $n && $n =~ /^\d+$/;
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

sub permutation {
    my( $n, $r ) = @_;
    return unless defined $n && $n =~ /^\d+$/ && defined $r && $r =~ /^\d+$/;
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

sub combination {
    my( $n, $r ) = @_;
    return unless defined $n && $n =~ /^\d+$/ && defined $r && $r =~ /^\d+$/;
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

  use Math::Counting ':student';
  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb=%d\n",
    $n, $r, factorial($n), permutation($n, $r), combination($n, $r);

  use Math::Counting ':big';
  printf "n=%d, r=%d:\nBig F=%d\n Big P=%d\nBig C=%d\n",
    $n, $r, bfact($n), bperm($n, $r), bcomb($n, $r);

=head1 DESCRIPTION

Compute the numerical factorial, number of n,r permutations and number
of n,r combinations using C<Math::BigInt> and also the technique of
"tail call elimination" as described in B<Higher Order Perl> and 
B<Mastering Algorithms with Perl>.

=head1 FUNCTIONS

=head2 factorial

  $f = factorial($n);

Return the number of arrangements of B<n> according to the "student"
version using real arithmetic.

=head2 bfact

  $f = bfact($n);

Return the value of the L<Math::BigInt/bfac> function, which is the
"Right Way To Do It."

=head2 permutation

  $p = permutation($n, $r);

Return the number of arrangements of B<r> elements drawn from a set of
B<n> elements.  B<nPn> is the same as B<n!>.  This function employs
the "student" version using real arithmetic.

=head2 bperm

  $p = bperm($n, $r);

Return the C<Math::BigInt> computation: B<n!/(n-r)!>.

=head2 combination

  $c = combination($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements.  This function employs the "student" version using real
arithmetic.

=head2 bcomb

  $c = bcomb($n, $r);

Return the C<Math::BigInt> computation: B<n!/r!(n-r)!>.

=head1 TO DO

Figure out how to allow the use of different C<Math::BigInt>
variations, like C<GMP>.

Provide the gamma function for the factorial of non-integer numbers?

=head1 SEE ALSO

L<Math::BigInt/bfac>

B<Higher Order Perl> by Mark Jason Dominus
(L<http://hop.perl.plover.com/>).

B<Mastering Algorithms with Perl> by Orwant, Hietaniemi & Macdonald
(L<http://www.oreilly.com/catalog/maperl/>).

L<Algorithm::Combinatorics>

L<String::OrderedCombination> for B<nPk> list generation.

L<Math::Combinatorics> for B<nPn> and B<nCr> list generation.

L<http://en.wikipedia.org/wiki/Factorial>

L<http://en.wikipedia.org/wiki/Permutation>

L<http://en.wikipedia.org/wiki/Combination>

=head1 AUTHOR

Gene Boggs E<lt>gene@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2005-2008 Gene Boggs All Rights Reserved

You may use this package under the same terms as Perl itself.

=cut
