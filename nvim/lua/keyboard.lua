local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

map('<SPACE>', '<Nop>')

-- Git
map('<LEADER>gb', '<Cmd>Gitsigns blame_line<CR>', '[G]it [B]lame current line')

-- Tmux
map("<C-f>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>", "Open tmux session")

-- For practice
map('<UP>', '<Nop>')
map('<LEFT>', '<Nop>')
map('<RIGHT>', '<Nop>')
map('<DOWN>', '<Nop>')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Search files with GFiles fallback
map('<LEADER>fb', '<Cmd>Telescope git_branches<CR>', '[F]ind [B]ranches')
map('<LEADER>fh', '<Cmd>Telescope oldfiles only_cwd=true<CR>', '[F]ind [H]istory')
map('<LEADER>fe', '<Cmd>Telescope diagnostics<CR>', '[F]ind [E]rrors')
map('<LEADER>km', '<Cmd>Telescope keymaps<CR>', '[K]ey[M]aps')
map('<LEADER>fc', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', '[F]ind words in [C]urrent buffer')
map('<LEADER>fn', '<Cmd>:enew<CR>', '[F]ile [N]ew')

vim.keymap.set("n", "<leader>fs", function()
  require("telescope").load_extension("aerial")
  vim.cmd("Telescope aerial")
end, { desc = "[F]ind Document [S]ymbol" })
