use strict;
use warnings;
use Test::More;

use Sub::Data::Recursive;

{
    my $hash = +{
        bar => +{
            baz => 2
        },
        qux => 1,
    };

    Sub::Data::Recursive->invoke(
        sub { $_[0]++ },
        $hash,
    );

    my $expect = +{
        bar => +{
            baz => 3
        },
        qux => 2,
    };

    is_deeply $hash, $expect;
}

done_testing;
