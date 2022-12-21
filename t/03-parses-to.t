use Test;
use Test::Grammar;

use lib <. t>;
use Test-Grammar;

my @tests = [ ["bailout", "Bail out! FOOBAR"],
["version", "TAP version 33"],
["description", "described" ]];

for @tests -> ($token,$str ) {
    parses-to Test-Grammar, $token, $str,
            "«$str» → $token parses OK";
}

done-testing;
