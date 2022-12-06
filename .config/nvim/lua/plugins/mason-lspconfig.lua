local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" , "texlab", "hls"},
    automatic_installation = true
})

local lspconfig = require "lspconfig"

mason_lspconfig.setup_handlers {

    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end,
}
