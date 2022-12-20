=begin pod

=head1 NAME
Test::Grammar - Test pieces of a grammar

=head1 SYNOPSIS

    use Test::Grammar;

=head1 DESCRIPTION
This module is intended as a white-box test for grammars

=end pod

use Test;
use MONKEY-SEE-NO-EVAL;

unit module Test::Grammar;

sub parses-ok( Grammar $grammar,
               $token-or-rule,
               Str $str,
               $message = "👍" ) is export {

    ok $grammar.subparse($str, :rule($token-or-rule)), $message;

}
