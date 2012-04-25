package Math::Counting;
use strict;
use warnings;
use Math::BigInt;
our $VERSION = '0.0903';
use parent qw(Exporter);
our @EXPORT = qw(
    factorial permutation combination
    bfact     bperm       bcomb
);
our %EXPORT_TAGS = (
    student => [qw( factorial permutation combination )],
    big     => [qw( bfact     bperm       bcomb )],
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

  use Math::Counting ':student'; # Logical, Academic
  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb=%d\n",
    $n, $r, factorial($n), permutation($n, $r), combination($n, $r);

  use Math::Counting ':big'; # Engineering, Reality
  printf "n=%d, r=%d:\nBig F=%d\n Big P=%d\nBig C=%d\n",
    $n, $r, bfact($n), bperm($n, $r), bcomb($n, $r);

=head1 DESCRIPTION

Compute the factorial, number of permutations and number of
combinations for engineers and CS students.

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
the "student" version.

=head2 bperm

  $p = bperm($n, $r);

Return the C<Math::BigInt> computation: B<n!/(n-r)!>

=head2 combination

  $c = combination($n, $r);

Return the number of ways to choose B<r> elements from a set of B<n>
elements using the "student" version."

=head2 bcomb

  $c = bcomb($n, $r);

Return the C<Math::BigInt> computation: B<n!/r!(n-r)!>

=head1 TO DO

Figure out how to allow the use of different C<Math::BigInt>
variations, like C<GMP>.

Provide the gamma function for the factorial of non-integer numbers?

=head1 SEE ALSO

L<Math::BigInt/bfac>

B<Higher Order Perl> by Mark Jason Dominus
(L<http://hop.perl.plover.com>).

B<Mastering Algorithms with Perl> by Orwant, Hietaniemi & Macdonald
(L<http://www.oreilly.com/catalog/maperl>).

L<http://en.wikipedia.org/wiki/Factorial>

L<http://en.wikipedia.org/wiki/Permutation>

L<http://en.wikipedia.org/wiki/Combination>

Naturally, there are a plethora of combinatorics packages available,
take your pick:

L<Algorithm::Combinatorics>,
L<Algorithm::Loops>,
L<Algorithm::Permute>,
L<CM::Group::Sym>,
L<CM::Permutation>,
L<Games::Word>,
L<List::Permutor,
L<Math::Combinatorics>,
L<Math::GSL::Permutation>,
L<Math::Permute::List>,
L<String::Glob::Permute>,
L<String::OrderedCombination>

=head1 AUTHOR AND COPYRIGHT

Gene Boggs E<lt>gene@cpan.orgE<gt>

Copyright 2011, Gene Boggs, All Rights Reserved.

=head1 LICENSE

This program is free software; you can redistribute or modify it
under the same terms as Perl itself.

=cut
