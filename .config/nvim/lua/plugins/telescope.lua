local telescope = require('telescope')
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
    winblend = 20,
  },
}

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

