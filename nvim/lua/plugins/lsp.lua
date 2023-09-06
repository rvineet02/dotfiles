local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'gopls',
  'rust_analyzer',
  'clangd',
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
        local copilot = require("copilot.suggestion")
        if cmp.visible() then
          cmp.confirm({ select = false })
        elseif copilot.is_visible() then
          copilot.accept()
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

-- Keybindings
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<LEADER>D', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', '<LEADER>r', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<LEADER>a', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<LEADER>f', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<LEADER>w', function()
    vim.lsp.buf.format()
    vim.cmd('w')
  end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
end)

lsp.setup()


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  float = true,
})
