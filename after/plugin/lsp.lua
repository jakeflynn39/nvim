local lsp_zero = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_extra_mappings = true,
  }
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'rust_analyzer', 'tsserver', 'lua_ls', 'svelte', 'cssls', 'eslint', 'html', 'jsonls', 'jedi_language_server', 'sqlls', 'tailwindcss', },
  handlers = {
    lsp_zero.default_setup,
  },
})

  local cmp = require'cmp'

  cmp.setup({
      snippet = {
          expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
      },
      window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-w>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
      }, {
          { name = 'buffer' },
      })
  })
