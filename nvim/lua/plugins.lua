-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'christoomey/vim-tmux-navigator',

  -- Useful plugin to show you pending keybinds.
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
  },

  -- Github dark themes: https://github.com/projekt0n/github-nvim-theme
  -- {
  --   -- Theme inspired by Atom
  --   'chriskempson/base16-vim',
  --   -- "RRethy/nvim-base16",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'base16-gruvbox-dark-hard'
  --   end,
  -- },
  -- {
  --   'kepano/flexoki-neovim',
  --   name = 'flexoki',
  --   config = function()
  --     vim.cmd('colorscheme flexoki-dark')
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    -- Code Snippet Images
    'narutoxy/silicon.lua',
    config = function() require('plugins.silicon') end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'base16',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function()
      require("plugins.treesitter")
    end,
  },

  {
    -- Copilot
    "zbirenbaum/copilot.lua",
    config = function()
      require("plugins.copilot")
    end,
    event = "InsertEnter",
  },

  {
    -- Nvim-tree
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    config = function() require('plugins.nvim-tree') end,
  },

  {
    -- Nvim dev icons
    'nvim-tree/nvim-web-devicons',
  },

  -- LSP + Autocomplete
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    config = function() require('plugins.lsp') end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional

      { 'simrat39/rust-tools.nvim' }
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- TODO: Add this back in when it's fixed
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    event = "BufEnter",
  },
  "farmergreg/vim-lastplace",
  {
    "windwp/nvim-autopairs",
    config = true,
    event = "InsertEnter",
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("plugins.aerial")
    end,
  },
  {
    "echasnovski/mini.ai",
    version = false,
    config = true,
  },
  {
    "echasnovski/mini.splitjoin",
    version = false,
    config = true,
  },
  {
    "echasnovski/mini.bracketed",
    version = false,
    config = true,
  },
  -- Harpoon
  -- {
  --   "ThePrimeagen/harpoon",
  --   config = function()
  --     require("plugins.harpoon")
  --   end,
  --   event = "BufEnter",
  -- },
  -- FZF Lua
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("plugins.fzf-lua")
    end,
  },
  -- Null-ls for formatting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("plugins.null-ls")
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = "BufEnter"
  },
  -- Illuminate words like the one you are hovering
  {
    'RRethy/vim-illuminate',
    config = function() require('plugins.illuminate') end,
    event = "BufEnter"
  },
}, {})

-- vim: ts=2 sts=2 sw=2 et
