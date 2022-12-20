use Test;
use Test::Grammar;

use lib <. t/>;

use Test-Grammar;

subtest {
    constant @parsed = <3 33 3d>;

    for @parsed {
        parses-ok Test-Grammar,"num", $_, "$_ parses OK";
    }
}, "Tests parses - correct and incorrect";

done-testing;
