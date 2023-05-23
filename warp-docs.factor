! Copyright (C) 2023 0xFC963F18DC21.
! See https://factorcode.org/license.txt for BSD license.
USING: help help.syntax help.markup ;
IN: warp

HELP: ~(
    { $description "Starts warping the notation of the previous word until " { $link \ ) } "." }
    { $syntax "W ~( elements... )" } ;

HELP: )
    { $description "Ends warping the notation of the word before the matching " { $link \ ~( } "." }
    { $syntax "W ~( elements... )" } ;

HELP: ~[
    { $description "Shorthand for " { $snippet "~( [" } ", but warps until " { $link \ ] } " instead." }
    { $syntax "W ~[ elements... ]" } ;

ARTICLE: { "warp" } "Warp Notation"
    { $heading "Overview" } $nl
    "The " { $vocab-link "warp" } " vocabulary emulates the effect of "
    "Warp Notation found in all of the concatenative scripting languages "
    "that have appeared in the Creeper World series for custom content "
    "within levels:"
    { $list
        { "CRPL (" { $url "https://knucklecracker.com/wiki/doku.php?id=crpl:overview#warp_notation" } ")" }
        { "4RPL (" { $url "https://knucklecracker.com/wiki/doku.php?id=4rpl:overview#warp_notation" } ")" }
        "PRPL"
    }
    $nl
    "Warp notation is a compile-time syntax rewrite, usually "
    "delimited with single parentheses pairs. However, since "
    "that is already taken by stack effect declarations, "
    "a tilde next to a parenthesis "
    { $link \ ~( }
    " will be used instead. For shorthand usage with quotations, "
    { $link \ ~[ }
    " is also provided."
    $nl
    "Its effect is effectively an inductive rewrite:" $nl
    { $code
        "   W ~( w1 w2 ... wn )"
        "=> w1 W ~( w2 ... wn )"
        "=> w1 w2 W ~( ... wn )"
        "..."
        "=> w1 w2 ... wn W"
    }
    "This allows for some shuffling of syntax to provide "
    "a 'less-concatenative' interface for writing and "
    "reading code, as a way to ease the transition into "
    "writing fully RP-like code." $nl
    "It should also be obvious that this can be used to write "
    "ridiculous, obfuscated code with this, so like with all "
    "syntax-rewrite parse words, use warp responsibly."
    { $heading "Examples" } $nl
    { $list
        {
            "Binary operators can be made 'infix' using warp notation: "
            { $snippet "2 - ~( 1 )" }
            " is equivalent to "
            { $snippet "2 1 -" } "."
        }
        {
            "Rearranging conditionals into a more common order:"
            { $code
                "when ~( x > ~( y ) ) ~["
                "    \"X is greater than Y\" print"
                "]"
            }
        }
    } ;

ABOUT: { "warp" }
