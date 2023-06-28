local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')

require('jetpack.packer').add {
  {'tani/vim-jetpack'},
  {'jonathanfilip/vim-lucius',
    config = function()
      vim.cmd('colorscheme lucius')
    end
  },
  {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end
  },
  {'williamboman/mason.nvim',
    config = function()
      require('plugins.mason')
    end,
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp'
    }
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp'
    }
  },
  {'scalameta/nvim-metals',
    requires = {'nvim-lua/plenary.nvim'}
  }
}
