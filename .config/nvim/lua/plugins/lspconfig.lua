local present, lspconfig = pcall(require,"lspconfig")

on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

end

capabilities = vim.lsp.protocol.make_client_capabilities()


lspconfig.hls.setup{}

lspconfig.rust_analyzer.setup{}
