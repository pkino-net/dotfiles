require('mason').setup()

local mason_lspconfig = require("mason-lspconfig")
local servers = {
  ruby_lsp = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers ({
  function(server)
    require("lspconfig")[server].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = on_attach,
      settings = servers[server],
      filetypes = (servers[server] or {}).filetypes,
    })
  end
})
