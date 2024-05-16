
# Interesting stuff to explore
Status Variables				*terminal-status*

    Terminal buffers maintain some buffer-local variables and options. The values
    are initialized before TermOpen, so you can use them in a local 'statusline'.
    Example: >vim
        :autocmd TermOpen * setlocal statusline=%{b:term_title}

:Termdebug plugin				*terminal-debug*

    The Terminal debugging plugin can be used to debug a program with gdb and view
    the source code in a Vim window.  Since this is completely contained inside
    Vim this also works remotely over an ssh connection.

