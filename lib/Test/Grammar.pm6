=begin pod

=head1 NAME
Test::Grammar - Test pieces of a grammar

=head1 SYNOPSIS

    use Test::Grammar;

=head1 DESCRIPTION
This module is intended as a white-box test for grammars

=end pod

use Test;

unit module Test::Grammar;

sub parses-ok( $grammar,
               Str $token-or-regex-name,
               Str $str,
               $message = "👍" ) is export {
    my $token-or-regex = $grammar.^lookup($token-or-regex-name).assuming($grammar);
    say $str ~~ $token-or-regex;
    ok $str ~~ $token-or-regex, $message;
}
