local present, lspconfig = pcall(require,"lspconfig")


lspconfig.hls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
