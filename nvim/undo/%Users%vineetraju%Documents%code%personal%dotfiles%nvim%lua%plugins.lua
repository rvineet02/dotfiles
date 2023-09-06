Vim�UnDo� �h[�^�t�[,�
`�=O�lĒ���$�   �                 $       $   $   $    d��O    _�                           ����                                                                                                                                                                                                                                                                                                                                    =          V       d���     �           *   -- [[ Setting options ]]   -- See `:help vim.o`   2-- NOTE: You can change these options as you wish!       -- Set highlight on search   vim.o.hlsearch = false       -- Make line numbers default   vim.wo.number = true       -- Enable mouse mode   vim.o.mouse = 'a'       (-- Sync clipboard between OS and Neovim.   K--  Remove this option if you want your OS clipboard to remain independent.   --  See `:help 'clipboard'`   vim.o.clipboard = 'unnamedplus'       -- Enable break indent   vim.o.breakindent = true       -- Save undo history   vim.o.undofile = true       <-- Case-insensitive searching UNLESS \C or capital in search   vim.o.ignorecase = true   vim.o.smartcase = true        -- Keep signcolumn on by default   vim.wo.signcolumn = 'yes'       -- Decrease update time   vim.o.updatetime = 250   vim.o.timeoutlen = 300       9-- Set completeopt to have a better completion experience   &vim.o.completeopt = 'menuone,noselect'       9-- NOTE: You should make sure your terminal supports this   vim.o.termguicolors = true       -- [[ Basic Keymaps ]]5��          *               i!      �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                              V       d���     �               5��                         i!                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V        d���    �              (-- Keymaps for better default experience   -- See `:help vim.keymap.set()`   Cvim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })       #-- Remap for dealing with word wrap   Uvim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })   Uvim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })5��                         i!      ^              5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                V        d��C    �    
          '  -- require 'kickstart.plugins.debug',�    	          ,  -- require 'kickstart.plugins.autoformat',�   �   �          =    config = function() require('kickstart.plugins.lsp') end,�   �   �          C    config = function() require('kickstart.plugins.nvim-tree') end,�   �   �        *      require("kickstart.plugins.copilot")5��    �                    {                    �    �   !                 1                    �    �   !                                     �                       �                    �                                           5�_�                            ����                                                                                                                                                                                                                                                                                                                                     @          V       d��Y    �            !   -- [[ Configure Telescope ]]   6-- See `:help telescope` and `:help telescope.setup()`   require('telescope').setup {     defaults = {       mappings = {         i = {           ['<C-u>'] = false,           ['<C-d>'] = false,         },       },     },   }       ,-- Enable telescope fzf native, if installed   1pcall(require('telescope').load_extension, 'fzf')        -- See `:help telescope.builtin`   tvim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })   tvim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })   +vim.keymap.set('n', '<leader>/', function()   U  -- You can pass additional configuration to telescope to change theme, layout, etc.   c  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {       winblend = 10,       previewer = false,     })   7end, { desc = '[/] Fuzzily search in current buffer' })       lvim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })   ivim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })   gvim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })   qvim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })   jvim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })   pvim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })5��          !               j"      1              5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                V       d��t     �   �   �  �          branch = '0.1.x',5��    �                                         �    �                                          �    �                     ,                     �    �                     +                     �    �                     *                     �    �                     )                     �    �                     (                     �    �                     '                     �    �                 )   &             )       5�_�      
           	   �       ����                                                                                                                                                                                                                                                                                                                           !         !          V       d��}     �   �   �  �      6    config = _nvim_treesitter_textobject_last_function5��    �          )          &      )              5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                           !         !          V       d��    �   �   �  �            require�   �   �  �          config = teles5��    �                    &                    �    �                     &                     �    �                    %                    �    �                    0                     �    �                     5                     �    �                     8                     �    �                    7                    �    �                     9                     �    �                     8                     �    �                    7                    �    �                    7                    �    �                    7                    �    �                     K                     �    �                     J                     �    �                     I                     �    �                     H                     �    �                     G                     �    �                     F                     �    �                     E                     �    �                     D                     �    �                     C                     �    �                     B                     �    �                     A                     �    �                    @                    �    �                    @                    �    �                    @                    �    �   "                 S                     �    �                     T                    5�_�   
                f        ����                                                                                                                                                                                                                                                                                                                           f         �           V       d��8     �  e  f       K   -- Diagnostic keymaps   cvim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })   _vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })   jvim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })   _vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })       -- [[ Configure LSP ]]   G--  This function gets run when an LSP connects to a particular buffer.   $local on_attach = function(_, bufnr)   W  -- NOTE: Remember that lua is a real programming language, and as such it is possible   V  -- to define small helper and utility functions so you don't have to repeat yourself     -- many times.     --   Y  -- In this case, we create a function that lets us more easily define mappings specific   V  -- for LSP related items. It sets the mode, buffer and description for us each time.   )  local nmap = function(keys, func, desc)       if desc then         desc = 'LSP: ' .. desc       end       D    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })     end       6  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')   @  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')       ;  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')   P  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')   C  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')   E  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')   _  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')   i  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')       &  -- See `:help K` for why this keymap   5  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')   F  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')       "  -- Lesser used LSP functionality   =  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')   R  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')   X  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')     nmap('<leader>wl', function()   <    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))   $  end, '[W]orkspace [L]ist Folders')       7  -- Create a command `:Format` local to the LSP buffer   C  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)       vim.lsp.buf.format()   3  end, { desc = 'Format current buffer with LSP' })   end       (-- Enable the following language servers   ^--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.   --   ]--  Add any additional override configuration in the following tables. They will be passed to   \--  the `settings` field of the server config. You must look up that documentation yourself.   --   b--  If you want to override the default filetypes that your language server will attach to you can   ;--  define the property 'filetypes' to the map in question.   local servers = {     -- clangd = {},     -- gopls = {},     -- pyright = {},     -- rust_analyzer = {},     -- tsserver = {},   5  -- html = { filetypes = { 'html', 'twig', 'hbs'} },         lua_ls = {       Lua = {   .      workspace = { checkThirdParty = false },   %      telemetry = { enable = false },       },     },   }    5��    e      K               *      �              5�_�                   i        ����                                                                                                                                                                                                                                                                                                                           i         ~           V       d��@     �  h  i          U-- nvim-cmp supports additional completion capabilities, so broadcast that to servers   @local capabilities = vim.lsp.protocol.make_client_capabilities()   Icapabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)       )-- Ensure the servers above are installed   1local mason_lspconfig = require 'mason-lspconfig'       mason_lspconfig.setup {   +  ensure_installed = vim.tbl_keys(servers),   }        mason_lspconfig.setup_handlers {     function(server_name)   -    require('lspconfig')[server_name].setup {   "      capabilities = capabilities,         on_attach = on_attach,   &      settings = servers[server_name],   9      filetypes = (servers[server_name] or {}).filetypes,       }     end   }    5��    h                     J*      �              5�_�                   i        ����                                                                                                                                                                                                                                                                                                                           i         �           V       d��F    �  h  i       0   -- [[ Configure nvim-cmp ]]   -- See `:help cmp`   local cmp = require 'cmp'   !local luasnip = require 'luasnip'   2require('luasnip.loaders.from_vscode').lazy_load()   luasnip.config.setup {}       cmp.setup {     snippet = {       expand = function(args)   #      luasnip.lsp_expand(args.body)       end,     },   '  mapping = cmp.mapping.preset.insert {   /    ['<C-n>'] = cmp.mapping.select_next_item(),   /    ['<C-p>'] = cmp.mapping.select_prev_item(),   ,    ['<C-d>'] = cmp.mapping.scroll_docs(-4),   +    ['<C-f>'] = cmp.mapping.scroll_docs(4),   ,    ['<C-Space>'] = cmp.mapping.complete {},   $    ['<CR>'] = cmp.mapping.confirm {   -      behavior = cmp.ConfirmBehavior.Replace,         select = true,       },   .    ['<Tab>'] = cmp.mapping(function(fallback)         if cmp.visible() then           cmp.select_next_item()   6      elseif luasnip.expand_or_locally_jumpable() then            luasnip.expand_or_jump()   
      else           fallback()   	      end       end, { 'i', 's' }),   0    ['<S-Tab>'] = cmp.mapping(function(fallback)         if cmp.visible() then           cmp.select_prev_item()   .      elseif luasnip.locally_jumpable(-1) then           luasnip.jump(-1)   
      else           fallback()   	      end       end, { 'i', 's' }),     },     sources = {       { name = 'nvim_lsp' },       { name = 'luasnip' },     },   }    5��    h      0               J*      �              5�_�                   $        ����                                                                                                                                                                                                                                                                                                                           $         d          V       d��T    �  #  $       A   -- [[ Configure Treesitter ]]   -- See `:help nvim-treesitter`   *require('nvim-treesitter.configs').setup {   N  -- Add languages to be installed here that you want installed for treesitter   i  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },       g  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)     auto_install = false,          highlight = { enable = true },     indent = { enable = true },     incremental_selection = {       enable = true,       keymaps = {   #      init_selection = '<c-space>',   %      node_incremental = '<c-space>',   "      scope_incremental = '<c-s>',   %      node_decremental = '<M-space>',       },     },     textobjects = {       select = {         enable = true,   X      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim         keymaps = {   D        -- You can use the capture groups defined in textobjects.scm   $        ['aa'] = '@parameter.outer',   $        ['ia'] = '@parameter.inner',   #        ['af'] = '@function.outer',   #        ['if'] = '@function.inner',            ['ac'] = '@class.outer',            ['ic'] = '@class.inner',         },       },       move = {         enable = true,   ?      set_jumps = true, -- whether to set jumps in the jumplist         goto_next_start = {   #        [']m'] = '@function.outer',            [']]'] = '@class.outer',         },         goto_next_end = {   #        [']M'] = '@function.outer',            [']['] = '@class.outer',         },         goto_previous_start = {   #        ['[m'] = '@function.outer',            ['[['] = '@class.outer',         },         goto_previous_end = {   #        ['[M'] = '@function.outer',            ['[]'] = '@class.outer',         },       },       swap = {         enable = true,         swap_next = {   +        ['<leader>a'] = '@parameter.inner',         },         swap_previous = {   +        ['<leader>A'] = '@parameter.inner',         },       },     },   }5��    #      A               �"      ]              5�_�                    �       ����                                                                                                                                                                                                                                                                                                                           $         $          V       d��a     �   �   �  *      
    config�   �   �  )          build = ':TSUpdate',5��    �                    `                     �    �                     e                     �    �                     i                     �    �                     h                     �    �                     g                     �    �                     f                     �    �                    e                    �    �                    e                    �    �                     l                     �    �   
                 k                    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                           %         %          V       d��i    �   �   �  *          config = 5��    �                     n                     �    �                     n                     �    �                    m                    �    �                     o                     �    �                     n                     �    �                    m                    �    �                     t                     �    �                     s                     �    �                     r                     �    �                    q                    �    �                    x                     �    �                     }                     �    �   #                 �                     �    �                     �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                            *                    V       d��     �              *   --[[       E=====================================================================   E==================== READ THIS BEFORE CONTINUING ====================   E=====================================================================       'Kickstart.nvim is *not* a distribution.       8Kickstart.nvim is a template for your own configuration.   M  The goal is that you can read every line of code, top-to-bottom, understand   E  what your configuration is doing, and modify it to suit your needs.       Q  Once you've done that, you should start exploring, configuring and tinkering to     explore Neovim!       T  If you don't know anything about Lua, I recommend taking some time to read through      a guide. One possible example:   *  - https://learnxinyminutes.com/docs/lua/           >  And then you can explore or search through `:help lua-guide`   -  - https://neovim.io/doc/user/lua-guide.html           Kickstart Guide:       >I have left several `:help X` comments throughout the init.lua   LYou should run that command and read that help section for more information.       ;In addition, I have some `NOTE:` items throughout the file.   WThese are for you, the reader to help understand what is happening. Feel free to delete   Sthem once you know what you're doing, but they should serve as a guide for when you   Fare first encountering a few different constructs in your nvim config.       %I hope you enjoy your Neovim journey,   - TJ       FP.S. You can delete this when you're done too. It's your config now :)   --]]    -- Set <space> as the leader key   -- See `:help mapleader`   W--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)5��            *                                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       d��   	 �                 vim.g.mapleader = ' '   vim.g.maplocalleader = ' '    5��                                   2               5�_�                    q        ����                                                                                                                                                                                                                                                                                                                            q           {          V       d��8     �   p   q                {   1    -- Add indentation guides even on blank lines   *    'lukas-reineke/indent-blankline.nvim',   3    -- Enable `lukas-reineke/indent-blankline.nvim`   '    -- See `:help indent_blankline.txt`       opts = {         char = '┊',   -      show_trailing_blankline_indent = false,       },     },5��    p                      �                    5�_�                    3        ����                                                                                                                                                                                                                                                                                                                            B          3           V       d��F   
 �   2   3                {       -- Autocompletion       'hrsh7th/nvim-cmp',       dependencies = {   8      -- Snippet Engine & its associated nvim-cmp source         'L3MON4D3/LuaSnip',   !      'saadparwaiz1/cmp_luasnip',       )      -- Adds LSP completion capabilities         'hrsh7th/cmp-nvim-lsp',       0      -- Adds a number of user-friendly snippets   %      'rafamadriz/friendly-snippets',       },     },5��    2                      =      j              5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       d��U     �   �   �          ]  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart   Y  --       These are some example plugins that I've included in the kickstart repository.   ;  --       Uncomment any of the lines below to enable them.   "  -- require 'plugins.autoformat',     -- require 'plugins.debug',       v  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`   k  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping   :  --    up-to-date with whatever is in the kickstart repo.   e  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.     --   d  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins   #  -- { import = 'custom.plugins' },5��    �                      �      H              5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       d��X     �   �   �           5��    �                      �                     5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       d��Y     �   �   �           5��    �                      �                     5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d��[     �   �   �          !-- Setup neovim lua configuration   require('neodev').setup()    5��    �                      �      =               5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d��]    �   �   �          C-- The line beneath this is called `modeline`. See `:help modeline`5��    �                      �      D               5�_�                    !        ����                                                                                                                                                                                                                                                                                                                            !   $       2          V   $    d���     �       !          F  -- NOTE: This is where your plugins related to LSP can be installed.   M  --  The configuration is done below. Search for lspconfig to find it below.     {   "    -- LSP Configuration & Plugins       'neovim/nvim-lspconfig',       dependencies = {   9      -- Automatically install LSPs to stdpath for neovim   3      { 'williamboman/mason.nvim', config = true },   *      'williamboman/mason-lspconfig.nvim',       &      -- Useful status updates for LSP   O      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`   ?      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },       @      -- Additional lua configuration, makes nvim stuff amazing!         'folke/neodev.nvim',       },     },5��                           �      �              5�_�                    !        ����                                                                                                                                                                                                                                                                                                                            !   $       !          V   $    d���    �       !           5��                           �                     5�_�                    &        ����                                                                                                                                                                                                                                                                                                                            &          5          V       d���     �   %   &              opts = {   !      -- See `:help gitsigns.txt`         signs = {           add = { text = '+' },            change = { text = '~' },            delete = { text = '_' },   %        topdelete = { text = '‾' },   &        changedelete = { text = '~' },         },   !      on_attach = function(bufnr)   H        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,   ?          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })   z        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })   z        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })   
      end,       },5��    %                      j      �              5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            &          &          V       d���     �   &   )   �            �   %   (   �          config = function�   $   '   �          'lewis6991/gitsigns.nvim',5��    $                    i                     �    %                     n                     �    %                     z                     �    %                     y                     �    %                     x                     �    %                    w                    �    %                    w                    �    %                 
   w             
       �    %                    �                     �    &                      �                      �    &                    �                     5�_�                    '       ����                                                                                                                                                                                                                                                                                                                            )          )          V       d���     �   '   )   �          end,�   &   )   �            5��    &                    �             *       �    '                     �                     �    '                     �                     5�_�                     )       ����                                                                                                                                                                                                                                                                                                                            *          *          V       d���    �   (   )              end5��    (                      �                     5�_�      !               &       ����                                                                                                                                                                                                                                                                                                                            (          &          V       d��     �   %   &              config = function ()   !      require('gitsigns').setup()       end,5��    %                      j      D               5�_�       "           !   8       ����                                                                                                                                                                                                                                                                                                                            &          &          V       d��     �   7   9   �              theme = 'onedark',5��    7                    �                    �    7                    �                    5�_�   !   #           "   8       ����                                                                                                                                                                                                                                                                                                                            &          &          V       d��    �   7   9   �              theme = 'base17',5��    7                    �                    5�_�   "   $           #   �       ����                                                                                                                                                                                                                                                                                                                            �          �          V   7    d��I    �   �   �              opts = {   &      -- your configuration comes here   6      -- or leave it empty to use the default settings   1      -- refer to the configuration section below       },5��    �                      �      �               5�_�   #               $   �        ����                                                                                                                                                                                                                                                                                                                            �          �           V       d��N    �   �   �                  -- [[ Highlight on yank ]]   &-- See `:help vim.highlight.on_yank()`   Vlocal highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })   -vim.api.nvim_create_autocmd('TextYankPost', {     callback = function()       vim.highlight.on_yank()     end,     group = highlight_group,     pattern = '*',   })5��    �                      �      3              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d��}    �       +        5��            *                                      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       d��v     �       +        5��            *                                      5��