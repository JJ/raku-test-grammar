use Test;
use Test::Grammar;

use lib <. t>;
use Test-Grammar;

for <3 33 3d> {
    parses-ok Test-Grammar,"num", $_, "$_ parses OK";
}

for <foo bar b3> {
    parses-nok Test-Grammar,"num", $_, "$_ not parsed";
}
done-testing;
