return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
    },
}
