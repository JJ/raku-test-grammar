use Test;
use Test::Grammar;

use lib <. t>;
use Test-Grammar;

has-tokens Test-Grammar,"bailout", ["explanation"],
        "Bail out! FOOBAR",
        "version parses OK";

done-testing;
