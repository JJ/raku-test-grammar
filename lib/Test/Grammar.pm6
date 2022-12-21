=begin pod

=head1 NAME
Test::Grammar - Test pieces of a grammar

=head1 SYNOPSIS

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

=head1 DESCRIPTION
This module is intended as a white-box test for grammars

=head1 Methods

=head2 sub parses-ok( Grammar $grammar,
               $token-or-rule,
               Str $str,
               $message = "👍" )

Checks that the grammar rule, contained in a strings, parses the string,
returning something, without really worrying about what it actually returns.

=head2 sub parses-nok( Grammar $grammar,
               $token-or-rule,
               Str $str,
               $message = "👎 $str" )

Checks that it does not parse the handled string

=head2 sub has-tokens( Grammar $grammar,
                $token-or-rule,
                @tokens,
                Str $str,
                $message = "👍" ) is export {

After parsing a token/rule/regex in a grammar, the resulting match includes
those
sub-matches (also called, confusingly enough, tokens).

=head2 sub parses-to( Grammar $grammar,
                $token-or-rule,
                Str $str,
                $message = "👍" )

String is parsed to itself by the rule. (I might merge this to the first one
later, maybe)

=head2 sub token-is( Grammar $grammar,
              $token-or-rule,
              $token,
              Str $str,
              Str $token-str,
              $message = "👍" )

Checks if an internal subtoken extracts the value correctly

=end pod

use Test;

unit module Test::Grammar;

sub parses-ok( Grammar $grammar,
               $token-or-rule,
               Str $str,
               $message = "👍" ) is export {

    ok $grammar.subparse($str, :rule($token-or-rule)), $message;

}

sub parses-nok( Grammar $grammar,
               $token-or-rule,
               Str $str,
               $message = "👎 $str" ) is export {

    nok $grammar.subparse($str, :rule($token-or-rule)), $message;

}

sub has-tokens( Grammar $grammar,
                $token-or-rule,
                @tokens,
                Str $str,
                $message = "👍" ) is export {

    my $parsed = $grammar.subparse($str, :rule($token-or-rule));
    cmp-ok [$parsed.keys], "⊇", @tokens, $message;
}

sub token-is( Grammar $grammar,
              $token-or-rule,
              $token,
              Str $str,
              Str $token-str,
              $message = "👍" ) is export {

    my $parsed = $grammar.subparse($str, :rule($token-or-rule));
    is $parsed{$token}, $token-str, $message;
}

sub parses-to( Grammar $grammar,
                $token-or-rule,
                Str $str,
                $message = "👍" ) is export {

    my $match = $grammar.subparse($str, :rule($token-or-rule));
    is ~$match, $str, $message;
}

