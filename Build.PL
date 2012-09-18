use strict;
use warnings;
use Module::Build;

my $class = Module::Build->subclass
  (
   class => 'My::Builder',
   code => q{
       sub harness_switches { # turn off -w in Test::Harness
         shift->{properties}{debugger} ? qw(-d) : qw(-X);
       }
     },
  );

my $builder = $class->new
  (module_name         => 'Hash::AutoHash::AVPairsSingle',
   license             => 'perl',
   dist_author         => q{Nat Goodman <natg@shore.net>},
   configure_requires=>{'Module::Build' => 0.4,
		       },
   build_requires =>   {'Test::More' => 0.88,
			'Test::Deep' => 0,
			'Exporter' => 0,
		       },
   requires =>         {'Carp' => 0,
			'Tie::Hash' => 1.00,
			'Hash::AutoHash' => 1.15,
		       },
   add_to_cleanup      => [ 'Hash-AutoHash-AVPairsSingle-*' ],
   create_makefile_pl => 'small',
  );

$builder->create_build_script();
