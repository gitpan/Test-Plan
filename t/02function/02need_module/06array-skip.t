# $Id $

use strict;
use warnings FATAL => qw(all);

use Test::More;
use Test::Plan;

plan tests => 1, [qw(CGI Foo::Zwazzle)];

fail('this test should not run');
