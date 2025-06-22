# Decalque
Decalque is a toy language inspired from different introductory languages called calc. It is a play on words as decalque in french means copy. It is also slang for being very tired, reflecting my late night coding sessions.
This language is part of the plloo, the Programming Language Loo.

## Features
Decalque has the four operations (+, -, *, /), for both int and float types. Parenthesis and mod available too.
It also has two simple operations on strings, namely concatenation (^) and filter out with (#).

## Examples

40 + 2 <br>
42

44 - 2 <br>
42

21 * 2 <br>
42

42 :mod 2 <br>
0

84.0 / 2 <br>
42.

:is_even (42*2+1) <br>
false

:is_odd (42*2+1) <br>
true

"hello" ^ " worlds" <br>
hello worlds

"foobar" # "bar" <br>
foo
