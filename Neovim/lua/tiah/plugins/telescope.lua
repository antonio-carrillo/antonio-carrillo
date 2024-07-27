return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', function()
      if not pcall(builtin.git_files) then
        builtin.find_files()
      end
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input('Grep > ') })
    end)
  end,
}
