use Test;
use Test::Grammar;

use lib <. t>;
use Test-Grammar;

for <3 33 3d> {
    parses-ok Test-Grammar,"num", $_, "$_ parses OK";
}

done-testing;
