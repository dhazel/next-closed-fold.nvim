next-closed-fold.nvim
=====================

Jump to closed folds. (using lua)

Without polluting the jumplist.


Usage
-----

Jump to the next closed fold *down*

    :lua require 'next-closed-fold'.nextClosedFold('j')

Jump to the next closed fold *up*

    :lua require 'next-closed-fold'.nextClosedFold('k')

Replace the default `zk` and `zj` key mappings

    :nnoremap <silent> zj :lua require 'next-closed-fold'.nextClosedFold('j')<cr>
    :nnoremap <silent> zk :lua require 'next-closed-fold'.nextClosedFold('k')<cr>

If it is desirable for the mappings to accept a count for the number of repetitions
of the corresponding movement, one can implement a simple function for repeating
any given command:

    function! RepeatCmd(cmd) range abort
        let n = v:count < 1 ? 1 : v:count
        while n > 0
            exe a:cmd
            let n -= 1
        endwhile
    endfunction

and then redefine the above mappings as follows:

    nnoremap <silent> <leader>zj :<c-u>call RepeatCmd('lua require 'next-closed-fold'.nextClosedFold("j")')<cr>
    nnoremap <silent> <leader>zk :<c-u>call RepeatCmd('lua require 'next-closed-fold'.nextClosedFold("k")')<cr>

Installation
------------

Any package manager or vim's native package management can be used to install
this plugin.

#### Vim-Plug

```vim
Plug 'dhazel/next-closed-fold.nvim'
```

Inspired By
-----------

  * https://stackoverflow.com/a/9407015/564406
