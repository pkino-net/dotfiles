require('mason').setup()

require("mason-lspconfig").setup_handlers ({
  function(server)
    require("lspconfig")[server].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end
})
