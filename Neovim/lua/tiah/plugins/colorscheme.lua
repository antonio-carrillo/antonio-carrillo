return {
  'christophermca/meta5',
  name = 'meta5',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('meta5')
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
  end,
}
