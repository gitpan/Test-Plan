# $Id $

# Test::Plan::need_threads() tests

use strict;
use warnings FATAL => qw(all);

# don't inherit Test::More::plan()
use Test::More tests  => 5,
               import => ['!plan'];


#---------------------------------------------------------------------
# compilation
#---------------------------------------------------------------------

our $class = qw(Test::Plan);

use_ok ($class);


#---------------------------------------------------------------------
# Test::Plan::need_threads()
#---------------------------------------------------------------------

use Config;

{
  no warnings qw(redefine);
  local *Config::STORE = sub { $_[0]->{$_[1]} = $_[2]; };
  local $Config{useithreads};

  my $found = need_perl('ithreads');

  ok (!$found,
      'threads property not found');
}

{
  no warnings qw(redefine);
  local *Config::STORE = sub { $_[0]->{$_[1]} = $_[2]; };
  local $Config{useithreads} = 'define';

  my $found = need_perl('ithreads');

  ok ($found,
      'threads property found');
}

{
  no warnings qw(redefine);
  local *Config::STORE = sub { $_[0]->{$_[1]} = $_[2]; };
  local $Config{extensions};

  my $found = need_perl('iolayers');

  ok (!$found,
      'property not found');
}

{
  no warnings qw(redefine);
  local *Config::STORE = sub { $_[0]->{$_[1]} = $_[2]; };
  local $Config{extensions} = 'PerlIO/scalar';

  my $found = need_perl('iolayers');

  ok ($found,
      'property found');
}
