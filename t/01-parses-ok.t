use Test;
use Test::Grammar;

use lib <. t/>;

use Test-Grammar;

parses-ok( Test-Grammar.new(), "num", "3", "«num» parses, «parses-ok» seems to work");

done-testing;
