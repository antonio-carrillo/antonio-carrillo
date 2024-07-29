return {
  'lewis6991/gitsigns.nvim',
  config = function ()
      local gitsigns = require('gitsigns')

      -- Navigate
      vim.keymap.set('n', '<leader>gn', function()
        gitsigns.nav_hunk('next')
      end)
      vim.keymap.set('n', '<leader>gp', function()
        gitsigns.nav_hunk('prev')
      end)

      -- Manage hunks
      vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk)
      vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk)

      -- Toggles
      vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
      vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
      vim.keymap.set('n', '<leader>gt', gitsigns.toggle_signs)

      gitsigns.setup()
  end,
}
