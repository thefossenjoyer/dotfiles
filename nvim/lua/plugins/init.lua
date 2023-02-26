-- installing plugins

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- lush required for some themes
    use 'rktjmp/lush.nvim'

    -- oxocarbon theme
    use 'nyoom-engineering/oxocarbon.nvim'

    -- jellybeans theme
    use 'metalelf0/jellybeans-nvim'

    -- auto-complete braces and quotes
    use 'windwp/nvim-autopairs'
    
    -- lualine - a status line
    use 'nvim-lualine/lualine.nvim'

    -- auto highlight hex colours
    use 'ap/vim-css-color'

    -- comment lines with a keybind
    -- use 'terrortylor/nvim-comment'

    use {
        'numToStr/Comment.nvim',
    }

    -- CoC
    -- use {'neoclide/coc.nvim', branch = 'release'}

    -- tabs
    use 'nvim-tree/nvim-web-devicons'
    -- use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        --run = ':TSUpdate'
    }

    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- which key
    use 'folke/which-key.nvim'

    -- toggle a terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    -- nvim-tree - a file explorer
    use 'nvim-tree/nvim-tree.lua'

    -- bookmarks
    use 'MattesGroeger/vim-bookmarks'

    -- search bookmarks with telescope
    use 'tom-anders/telescope-vim-bookmarks.nvim'

    -- telescope as a file browser
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- switch files blazingly fast
    use 'ThePrimeagen/harpoon'

    -- dashboard
    use 'glepnir/dashboard-nvim'

    -- ranger in nvim
    use 'kevinhwang91/rnvimr'
    
    -- decay colourscheme
    use {'decaycs/decay.nvim', as = 'decay'}

    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- matching parens
    use 'vim-scripts/ShowPairs'
    
    -- tokyonight
    use 'folke/tokyonight.nvim'

    -- lisp plugins
    use 'Olical/conjure'
    use 'radenling/vim-dispatch-neovim'
    use 'tpope/vim-surround'

    -- everblush colourscheme
    use { 'Everblush/nvim', as = 'everblush' }

    -- onedark
    use 'navarasu/onedark.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'PaterJason/cmp-conjure' -- conjure && nvim-cmp

    -- catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    -- who said you couldn't use Org in vim?
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim",
    }


    -- vimwiki
    use 'vimwiki/vimwiki'

    -- rose pine
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }


    -- another theme
    use "rebelot/kanagawa.nvim"

    -- use 'Mofiqul/dracula.nvim'

    -- use 'Mofiqul/vscode.nvim'

    use 'lunarvim/darkplus.nvim'

    -- use 'lunarvim/Onedarker.nvim'

    -- The most popular theme, gruvbox
    use "ellisonleao/gruvbox.nvim"
    -- use 'sainnhe/gruvbox-material'

    -- Discord RPC
    -- use 'andweeb/presence.nvim'
    -- use 'ObserverOfTime/nvimcord'
    use 'Usuim/presence.nvim'

    -- Lua
    use {
          "folke/zen-mode.nvim",
          config = function()
            require("zen-mode").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
        }

    -- mpv in nvim
    use 'tamton-aquib/mpv.nvim'

    -- get me some startuptime
    use 'dstein64/vim-startuptime'

    -- use 'dunstontc/vim-vscode-theme'
    -- use 'shaunsingh/nord.nvim'
    
    -- use "EdenEast/nightfox.nvim"

    use 'tanvirtin/monokai.nvim'
    use 'marko-cerovac/material.nvim'

    -- edit the fs like a buffer
    use {
      'stevearc/oil.nvim',
      config = function() require('oil').setup() end
    }

    -- auto-saving
    -- use 'Pocco81/auto-save.nvim'

    use 'ishan9299/modus-theme-vim'
end)
