local noerr, nvim_lsp = pcall(require, 'lspconfig')
local setBufKeyMap = vim.api.nvim_buf_set_keymap
local keys = require'config'.keymaps.lspconfig

if not noerr then
    return
end

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local opts = { noremap = true, silent = true }
  	setBufKeyMap(bufnr, 'n', keys.declaration, '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.definition, '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
 	setBufKeyMap(bufnr, 'n', keys.hover, '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
 	setBufKeyMap(bufnr, 'n', keys.signatureHelp, '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.addWorkspaceFolder, '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.removeWorkspaceFolder, '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.printFolders, '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.typeDefinition, '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.rename, '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.references, '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.codeAction, '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.showLineDiagnostics, '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
 	setBufKeyMap(bufnr, 'n', keys.gotoPrev, '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.gotoNext, '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.setLoclist, '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  	setBufKeyMap(bufnr, 'n', keys.lspDocumentSymbols, [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = require'config'.langServers

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup{
		on_attach = on_attach,
		capabilities = capabilities
	}
end

-- nvim_lsp.ccls.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         highlight = {
--             lsRanges = true;
--         }
--     }
-- }
