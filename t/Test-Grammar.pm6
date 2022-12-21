unit grammar Test-Grammar;

regex TOP {
    ^ [ <test> | <bailout> | <version> ] $
}

token test {
    $<nok>=['not '?] 'ok' [ <.sp> <num> ]? ' -'?
    [ <.sp>* <description> ]?
    [
    <.sp>* '#' <.sp>* $<directive>=[:i [ 'SKIP' \S* | 'TODO'] ]
    [ <.sp>+ $<explanation>=[\N*] ]?
    ]?
    <.sp>*
}

token sp { <[\s] - [\n]> }

token num { <[0..9]>+ }

regex description {
    [ '\\\\' || '\#' || <-[\n#]> ]+ <!after <sp>+>
}

token bailout {
    'Bail out!' [ <.sp> $<explanation>=[\N*] ]?
}
token version {
    :i 'TAP version ' <version=.num>
}
