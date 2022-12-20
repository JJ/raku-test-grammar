use Test;
use Test::Grammar;

use lib <. t/>;

use Test-Grammar;

class Test-Grammar::Action {
    method num( $/ ) { parses-ok $/, "«num» parses" }
}

subtest {
    constant @parsed = <3 33 d3 dd>;
    plan @parsed.elems / 2;

    for @parsed {
        Test-Grammar.subparse($_, :rule("num"), :actions(Test-Grammar::Action));
    }
}, "Tests parsind - correct and incorrect";

done-testing;
