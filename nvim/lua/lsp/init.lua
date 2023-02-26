require('lspconfig').pyright.setup{}

-- Configuration

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

-- Enable some servers
local servers = {
    'clangd',
    'rust_analyzer',
    'gopls'
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities -- enable those capabilities
    }
end

-- luasnip setup
local luasnip = require("luasnip")


-- nvim-cmp setup
local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'conjure'},
  },
}

require'lspconfig'.clangd.setup{
    cmd = { "clangd15", },
}

require("lspconfig").rust_analyzer.setup {
    -- cmd = {"~/.cargo/bin/rust-analyzer",},
}

require("lspconfig").gopls.setup{}

--require("lspconfig").metals.setup{}
require'lspconfig'.ocamllsp.setup{}

require'lspconfig'.julials.setup{
    filetypes = {
        "jl"
    }
}
