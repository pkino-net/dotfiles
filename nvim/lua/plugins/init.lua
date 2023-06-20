local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')

return require('jetpack.packer').add {
  {'tani/vim-jetpack'},
  {'jonathanfilip/vim-lucius',
    config = function()
      vim.cmd('colorscheme lucius')
    end
  },
  {'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end
  },
  {'williamboman/mason.nvim',
    config = function()
      require('plugins.mason')
    end
  },
  {'scalameta/nvim-metals',
    requires = {'nvim-lua/plenary.nvim'}
  }
}
