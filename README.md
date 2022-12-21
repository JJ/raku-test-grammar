# Test::Grammar for Raku [![Test in a Raku container - template](https://github.com/JJ/raku-test-grammar/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-test-grammar/actions/workflows/test.yaml)

Unit testing for grammars. Because testing is important.

## Installing

No dependencies, except `Test` which is a Rakudo core library, so the usual
 `zef install Test::Grammar`.

## Running

> Copied from [the source](lib/Test/Grammar.pm6), version there is the single
 source of truth:
 
```raku
use Test::Grammar;

parses-ok Test-Grammar,"num", 3, "33 parses OK";

my $test-output = q:to/EOC/;
ok 1 - bailout parses OK
ok 2 - «bailout» extracts token
1..2
EOC

has-tokens Test-Grammar, "test", <nok num description>, $test-output,
    "Complete tests";

token-is Test-Grammar,"bailout", "explanation",
    "Bail out! FOOBAR",
    "FOOBAR",
    "«bailout» extracts token";

for <foo bar b3> {
    parses-nok Test-Grammar,"num", $_, "$_ not parsed";
}
```

## See also

There are very nice testing libraries out there:

* [T](https://raku.land/zef:CIAvash/T) emphasizes output and messages
* [Testo](https://raku.land/zef:raku-community-modules/Testo) is another
 opinionated test library.

## License
 
(c) JJ Merelo, <jj@raku.org>, 2022

Licensed under the Artistic 2.0 License (the same as Raku itself).
