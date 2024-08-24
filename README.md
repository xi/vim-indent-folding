Vim has some default fold methods, one of which is indentation based. However,
it folds an indented block into a single line instead of folding it into the
line right before the block.

Consider this markdown list:

    -   Item 1
        -   Item 1.1
        -   Item 1.2

Vim's indent folding turnes this into:

    -   Item 1
    +--  2 lines: -   Item 1.1-------------------------------------------------

The plugin instead turns this into:

    -   Item 1-----------------------------------------------------------------

This approach is inspired by http://learnvimscriptthehardway.stevelosh.com/chapters/49.html

Unfortunately, the performance of this approach is pretty bad. To mitigate
this, the foldmethod is kept at `manual` by default and only switches to `expr`
when the folds are actually used (e.g. when pressing `za`).
