vim.api.nvim_set_keymap('n', '<Leader>ai', ':CodeCompanionChat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>ae', ':CodeCompanion /explain<CR>', { noremap = true})
if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
