require("catppuccin").setup({
    flavour = "mocha",

    styles = {
        comments = {"italic"},
        conditionals = {"italic"},
        types = {"italic"},
        strings = {"italic"},
        keywords = {"italic"},
    },

    transparent_background = false,
})

vim.cmd.colorscheme "catppuccin"
