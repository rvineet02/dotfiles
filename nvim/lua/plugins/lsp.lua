-- lua/plugins/lsp.lua  (Neovim 0.11+ native LSP)

-- ============
-- nvim-cmp + LuaSnip + Copilot Tab
-- ============
local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

vim.g.copilot_no_tab_map = true

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<CR>']  = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local ok, copilot = pcall(require, 'copilot.suggestion')
      if cmp.visible() then
        cmp.confirm({ select = false })
      elseif ok and copilot.is_visible() then
        copilot.accept()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- Capabilities for LSP completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ============
-- Mason
-- ============
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',         -- was "tsserver"
    'lua_ls',
    -- 'gopls',
    'rust_analyzer',
    'clangd',
  },
  automatic_installation = true,
})

-- ============
-- on_attach: your keymaps
-- ============
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<LEADER>e', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<LEADER>D', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', '<LEADER>r', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<LEADER>a', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<LEADER>f', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<LEADER>w', function() vim.cmd('w') end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
end

-- ============
-- Server configs (0.11 native)
--   Define with vim.lsp.config(<server>, cfg)
--   Enable with vim.lsp.enable(<server>)
-- ============
local servers = {
  lua_ls = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  ts_ls = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
  -- gopls = { capabilities = capabilities, on_attach = on_attach },
  rust_analyzer = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        cargo = { allFeatures = true },
        check = { command = 'clippy' },
      },
    },
  },
  clangd = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, cfg)
  vim.lsp.enable(name)
end

-- ============
-- Diagnostics UI
-- ============
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  float = true,
})

