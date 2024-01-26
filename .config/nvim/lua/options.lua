vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('winblend', 0)
vim.api.nvim_set_option('pumblend', 0)
vim.api.nvim_set_option('scrolloff', 5)
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.o.showmode = false

vim.api.nvim_create_augroup('transparent', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'transparent',
  callback = function()
    vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
    vim.cmd('highlight NonText ctermbg=NONE guibg=NONE')
    vim.cmd('highlight Folded ctermbg=NONE guibg=NONE')
    vim.cmd('highlight EndOfBuffer ctermbg=NONE guibg=NONE')
  end
})

vim.cmd('colorscheme cosme')

