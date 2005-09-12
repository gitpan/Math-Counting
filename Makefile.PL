use ExtUtils::MakeMaker;
WriteMakefile(
    NAME          => 'Math::Counting',
    VERSION_FROM  => 'lib/Math/Counting.pm',
    PREREQ_PM => {
        'Test::More' => 0,
        'Carp'       => 0,
    },
    ($] >= 5.005
        ? (ABSTRACT_FROM => 'lib/Math/Counting.pm',
           AUTHOR        => 'Gene Boggs <gene@cpan.org>')
        : ()
    ),
);
