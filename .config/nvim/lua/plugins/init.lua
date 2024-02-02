vim.cmd('packadd packer.nvim')

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'beikome/cosme.vim'
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  use({
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end,
    requires = { 'nvim-tree/nvim-web-devicons' },
  })
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function()
      require('plugins.telescope')
    end,
    requires = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
      },
      {
        'prochri/telescope-all-recent.nvim',
        config = function()
          require('telescope-all-recent').setup {}
        end,
        after = 'telescope.nvim',
        requires = 'kkharji/sqlite.lua',
      },
    }
  })
  use({
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end,
    requires = 'nvim-tree/nvim-web-devicons',
  })
  use({'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end
  })
  use({'williamboman/mason.nvim',
    config = function()
      require('plugins.mason')
    end,
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp'
    }
  })
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      {
        'L3MON4D3/LuaSnip',
	      tag = 'v2.*',
        run = 'make install_jsregexp',
        config = function()
          require('plugins.luasnip')
        end,
        requires = {
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      }
    }
  })
  use({
    'scalameta/nvim-metals',
    requires = {'nvim-lua/plenary.nvim'}
  })
end)

