next-closed-fold.nvim
=====================

Jump to closed folds.

Without polluting the jumplist.


Usage
-----

Jump to the next closed fold *down*

    :NextClosedFold('j')

Jump to the next closed fold *up*

    :NextClosedFold('k')

Replace the default `zk` and `zj` key mappings

    :nnoremap <silent> zj :call NextClosedFold('j')<cr>
    :nnoremap <silent> zk :call NextClosedFold('k')<cr>

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

    nnoremap <silent> <leader>zj :<c-u>call RepeatCmd('call NextClosedFold("j")')<cr>
    nnoremap <silent> <leader>zk :<c-u>call RepeatCmd('call NextClosedFold("k")')<cr>

Installation
------------

Any package manager or vim's native package management can be used to install
this plugin.

#### Vim-Plug

```vim
Plug 'dhazel/next-closed-fold.vim'
```

Inspired By
-----------

  * https://stackoverflow.com/a/9407015/564406
