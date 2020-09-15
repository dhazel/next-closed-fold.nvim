" Version:  1.0
" License:  MIT
" Homepage: none
" Author: David Hazel <dhazel@gmail.com> (via ib.)
"
" NOTES:
"
"   * Provides command :NextClosedFold('j')
"   * Provides command :NextClosedFold('k')
"
" INSPIRED BY:
"
"   * https://stackoverflow.com/a/9407015/564406


":NextClosedFold({direction})
"                   Jump to the next closed fold in the given direction, where
"                   {direction} is a string value of either 'j' (down) or
"                   'k' (up).
function! NextClosedFold(direction)
    exe 'k '''
    let cmd = 'keepjumps norm!z' . a:direction
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

