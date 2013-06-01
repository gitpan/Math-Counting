
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006000
eval "use Test::Spelling 0.12; use Pod::Wordlist; 1" or die $@;

set_spell_cmd('aspell list');
add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
algorithmically
bcomb
bfact
bperm
combinatorics
Combinatorial
Macdonald
nPn
Pomraning
Petar
Kaleychev
Jacobsen
Gene
Boggs
gene
lib
Math
Counting
