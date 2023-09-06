local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'gopls',
  'jdtls',
  'rust_analyzer'
})

-- Preferences
lsp.set_preferences({
  suggest_lsp_servers = false
})


-- Autocompletion
local cmp = require('cmp')
local luasnip = require('luasnip')
vim.g.copilot_no_tab_map = true
lsp.setup_nvim_cmp({
  sources = {
    { name = 'nvim_lsp' },
    { name = "luasnip" },
    { name = "path" },
    { name = 'buffer' }
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Tab>'] = cmp.mapping(function(fallback)
        local copilot_keys = vim.fn['copilot#Accept']()
        if cmp.visible() then
          cmp.confirm({ select = false })
        elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
          vim.api.nvim_feedkeys(copilot_keys, 'i', true)
        else
          fallback()
        end
      end,
      {
        "i",
        "s"
      }),
  }
})


lsp.setup()


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  float = true,
})
