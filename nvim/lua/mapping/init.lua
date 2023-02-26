-- keybinds

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local cocopts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
local keyset = vim.keymap.set

vim.g.mapleader = ' ' -- set the leader key to space

map('n', '<leader>fe', ':edit ', opts)

-- map('n', '<leader>/', ':CommentToggle<CR>', opts)

-- CoC
-- make <CR> accept completion
-- keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], cocopts)

-- barbar

-- Move to previous/next
-- map('n', '<A-,>', ':BufferPrevious<CR>', opts)
-- map('n', '<А-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)key
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Close a buffer
-- map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)

-- telescope
-- local builtin = require('telescope.builtin')

-- find a file
-- map('n', '<leader>ff', "<CMD>Telescope find_files hidden=true<CR>", opts)
map('n', '<leader>ff', "<CMD>Telescope file_browser hidden=true<CR>", opts)

-- recent files
map('n', '<leader>fr', "<CMD>Telescope oldfiles<CR>", opts)

-- change the colorscheme
map('n', '<leader>ht', "<CMD>Telescope colorscheme<CR>", opts)

-- browse bookmarks
map('n', '<leader>fb', '<CMD>Telescope vim_bookmarks all<CR>', opts)

-- telescope as a file browser
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup {
    extensions = {
        file_browser ={
            mappings = {
                ["n"] = {
                    ["<C-a>"] = fb_actions.create,
                }
            }
        }
    }
}

-- harpoon
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")

-- keyset('n', '<leader>ha', mark.add_file, {})
-- keyset('n', '<leader>hq', ui.toggle_quick_menu, {})

-- rnvimr
-- map('n', '<leader>rt', '<CMD>RnvimrToggle<CR>', opts)


-- Nvimtrr
map('n', '<leader>nt', '<CMD>NvimTreeToggle<CR>', opts)

-- bufferline
map('n', '<A-.>', '<CMD>BufferLineCycleNext<CR>', opts)
map('n', '<A-,>', '<CMD>BufferLineCyclePrev<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)

map('n', '<A-c>', '<CMD>BufferLinePickClose<CR>', opts)


-- mpv in nvim
local nvmp = require("mpv")

keyset('n', ',mp', nvmp.toggle_player, {})
