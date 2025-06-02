vim.api.nvim_set_keymap('n', '<Leader>ai', ':CodeCompanionChat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>ae', ':CodeCompanion /explain<CR>', { noremap = true})
vim.cmd([[
  augroup qb64bas
    autocmd!
    autocmd FileType qb64 set errorformat=LINE\ %l:%m|set makeprg=./mymake.sh
  augroup END
]])
-- vim.cmd([[set efm=%ESyntax\ %m,%+C%.%#,LINE\ %l:]])
-- captures "error" - vim.cmd([[set efm=%ESyntax\ %m,%+C%.%#,%-ZLINE\ %l:]])
-- vim.cmd([[set efm=%+E%.%#,%CCaused\ by\ (or\ after):%.%#,LINE\ %l:%m]])
-- works vim.cmd([[set efm=%+A%.%#error\n%.%#\n,LINE\ %l:%m]])
-- vim.cmd([[set efm=%A%m,%CCaused\ by\ (or\ after):%m,%ZLINE\ %l:%m]])
-- works vim.cmd([[set efm=%E%*[^:]:,LINE\ %l:%m]])
-- works vim.cmd([[set efm=%ESyntax\ error,%CCaused\ by\ (or\ after):%m,LINE\ %l:%m]])
-- vim.cmd([[set efm=%m\n,%CCaused\ by\ (or\ after):%m,%ZLINE\ %l:]])
-- vim.cmd([[set efm=LINE\ %l:%m]])
-- works vim.cmd([[set errorformat=LINE\ %l:%m]])
-- vim.opt.errorformat={LINE %l:%m}
if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
