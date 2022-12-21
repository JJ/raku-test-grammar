use Test;
use Test::Grammar;

use lib <. t>;
use Test-Grammar;

has-tokens Test-Grammar,"bailout", ["explanation"],
        "Bail out! FOOBAR",
        "bailout parses OK";

token-is Test-Grammar,"bailout", "explanation",
        "Bail out! FOOBAR",
        "FOOBAR",
        "«bailout» extracts token";

my $test-output = q:to/EOC/;
ok 1 - bailout parses OK
ok 2 - «bailout» extracts token
1..2
EOC

has-tokens Test-Grammar, "test", <nok num description>, $test-output,
        "Complete tests";

done-testing;
