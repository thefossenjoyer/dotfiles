require("material").setup({
    
    plugins = {
        "telescope",
        "nvim-cmp",
        "nvim-tree",
        "which-key",
    },

    lualine_style = "stealth" -- default || stealth

})

-- setting the style: darker, lighter, oceanic, palenight, deep ocean
vim.g.material_style = "deep ocean"

-- load the theme after configruation
-- vim.cmd 'colorscheme material'
