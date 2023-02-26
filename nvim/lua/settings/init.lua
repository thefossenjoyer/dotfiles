-- general neovim settings

local g = vim.g
local o = vim.o
local c = vim.cmd
local opt = vim.opt

-- colors
opt.termguicolors = true
o.background = 'dark'
-- c.colorscheme 'oxocarbon'

-- vim.cmd("let g:equinusocio_material_style = 'darker'")
-- vim.cmd("coloscheme equinsocio_material")

-- enable mouse
opt.mouse = 'a'

-- sharing clipboards is caring
vim.cmd('set clipboard+=unnamedplus')

-- tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- line nums
opt.nu = true
opt.relativenumber = true

-- wrap lines
opt.wrap = false

-- swap files = no
opt.swapfile = false
opt.backup = false

-- searching
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes" -- a bit of space on left
opt.isfname:append("@-@")

opt.updatetime = 50

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Neorg
vim.opt.conceallevel=2
