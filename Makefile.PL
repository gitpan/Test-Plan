use 5.005;

use strict;
use warnings FATAL => qw(all);

use ExtUtils::MakeMaker;
use File::Find qw(find);
use File::Spec ();

my %directories;
                                                                                                                             
find(sub { return unless m/\.t$/; $directories{$File::Find::dir} = 1 }, 't');
                                                                                                                             
my @tests = map { File::Spec->catfile($_, '*.t') } keys %directories;
                                                                                                                             
WriteMakefile(
  NAME         => 'Test::Plan',
  VERSION_FROM => File::Spec->catfile(qw(lib Test Plan.pm)),
  PREREQ_PM    => { 'Test::Simple' => 0.49, },
  test         => { TESTS => join ' ', @tests },
);
