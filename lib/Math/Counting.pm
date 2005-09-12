# $Id: Counting.pm,v 1.1.1.1 2005/09/12 03:36:24 gene Exp $

package Math::Counting;
use strict;
use warnings;
use Carp;
use vars qw( $VERSION );
$VERSION = '0.00_01';

sub new {
    my $class = shift;
    my $proto = ref $class || $class;
    my $self  = {};
    bless $self, $class;
    $self->_init( @_ );
    return $self;
}

sub _init {
    my $self = shift;
    ( $self->{n}, $self->{r} ) = @_;
}

sub factorial {
    my $self = shift;
}

sub permutation {
    my $self = shift;
}

sub combination {
    my $self = shift;
}

1;

__END__

=head1 NAME

Math::Counting - Counting operations for probability and combinatorics

=head1 SYNOPSIS

  use integer;  # optional
  use Memoize;  # optional

  use Math::Counting;

  my $n = 123;
  my $r = 42;

  my $x = Math::Counting->new( $n, $r );

  printf "Given n=%d and r=%d:\nFact=%d\nPerm=%d\nComb = %d\n",
    $n, $r, $x->factorial, $x->permutation, $x->combination;

=head1 DESCRIPTION

Compute the numerical factorial, number of permutations or combinations.

=head1 PUBLIC METHODS

=head2 new

  $x = Math::Counting->new( $n, $r );

Return a new C<Math::Counting> object.

=head2 factorial

  $f = $x->factorial();     # Uses the settings from construction
  $f = $x->factorial( $n );

Return the factorial of B<n> (B<n!>).

=head2 permutation

  $p = $x->permutation();   # Uses the settings from construction
  $p = $x->permutation( $n, $r );

Return the number of permutations of B<n> items given B<r>.

=head2 combination

  $c = $x->combination();   # Uses the settings from construction
  $c = $x->combination( $n, $r );

Return the number of combinations of B<n> items given B<r>.

=head1 TO DO

Export small functions instead of object methods as an option.

=head1 THANK YOU

Mark Jason Dominus for writing C<Memoize> and C<Higher Order Perl> and
for mentioning this URL to me:

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
