local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  -- You can set mapping if you want.
  mapping = {
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm(
      { behavior = cmp.ConfirmBehavior.Insert, select = true }
    )
  },
  sources = cmp.config.sources(
    {
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'gh_issues' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 2 }

      -- {name = 'luasnip'} -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, { { name = 'buffer' } }
  )
}

