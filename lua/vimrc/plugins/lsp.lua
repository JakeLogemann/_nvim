local lsp        = require('nvim_lsp')
local default_lsp_settings = {
  on_attach = function(client)
    require('completion').on_attach(client)
    require('diagnostic').on_attach(client)
  end
}

vim.g.vista_sidebar_position = 'left'
vim.g.vista_sidebar_width = 30
vim.g.vista_sidebar_keepalt = 1
vim.g.vista_stay_on_open = 1 -- 1=switch-to, 0=stay. very confusing.
vim.g.vista_close_on_jump = 1 -- 1=enabled


lsp.rust_analyzer.setup(default_lsp_settings)
-- lsp.rls.setup({})
lsp.bashls.setup(default_lsp_settings)
lsp.vimls.setup(default_lsp_settings)
lsp.rnix.setup(default_lsp_settings)
lsp.html.setup(default_lsp_settings)
lsp.cssls.setup(default_lsp_settings)
lsp.jsonls.setup(default_lsp_settings)
lsp.clangd.setup(default_lsp_settings)
lsp.solargraph.setup(default_lsp_settings)
lsp.sumneko_lua.setup(default_lsp_settings)
lsp.bashls.setup(default_lsp_settings)

