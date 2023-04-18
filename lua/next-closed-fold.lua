-- Version:  1.0
-- License:  MIT
-- Homepage: none
-- Author: David Hazel <dhazel@gmail.com> (via ib.)
--
-- NOTES:
--
--   * Provides function nextClosedFold('j')
--   * Provides function nextClosedFold('k')
--
-- INSPIRED BY:
--
--   * https://stackoverflow.com/a/9407015/564406


local M = {}


--- Jump cursor to the next closed fold in the given direction.
-- @param direction A string value of either 'j' (down) or 'k' (up).
function M.nextClosedFold(direction)
    vim.cmd('k \'')
    local cmd = 'keepjumps norm!z' .. direction
    local viewState = vim.fn.winsaveview()
    local lineNumber = viewState.lnum
    local previousLineNumber = 0
    local foldIsOpen = true
    while foldIsOpen and (lineNumber ~= previousLineNumber) do
        vim.cmd(cmd)
        previousLineNumber = lineNumber
        lineNumber = vim.fn.line('.')
        foldIsOpen = vim.fn.foldclosed(lineNumber) < 0
    end
    if foldIsOpen then
        vim.fn.winrestview(viewState)
    end
end

return M
