require('mini.move').setup( -- No need to copy this inside `setup()`. Will be used automatically.
  {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = '<S-h>',
      right = '<S-l>',
      down = '<S-j>',
      up = '<S-k>',

      -- Move current line in Normal mode
      line_left = '<S-h>',
      line_right = '<S-l>',
      line_down = '<S-j>',
      line_up = '<S-k>',
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  })

-- local notify = require('mini.notify')
-- notify.setup()
-- vim.notify = notify.make_notify({
--   ERROR = { duration = 5000 },
--   WARN = { duration = 3000 },
--   INFO = { duration = 2000 },
-- })
