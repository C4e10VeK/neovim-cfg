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

local noerrCmp, cmpNvim = pcall(require, 'cmp_nvim_lsp')

-- local capabilities = cmpNvim.default_capabilities()
local capabilities = {}

if noerrCmp then
	capabilities = cmpNvim.default_capabilities()
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = require'config'.langServers

local function setupServers()
	for _, lsp in ipairs(servers) do
		if lsp == "clangd" then
			nvim_lsp[lsp].setup{
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "clangd", "--background-index", "--header-insertion=never", "--suggest-missing-includes" },
				filetypes = { 'c', 'cpp', 'h', 'hpp' }
			}
		elseif lsp == "rust_analyzer" then
			nvim_lsp[lsp].setup{
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					assist = {
						importGranularity = "module",
						importPrefix = "self",
					},
					cargo = {
						loadOutDirsFromCheck = true
					},
					procMacro = {
						enable = true
					}
				}
			}
		elseif lsp == 'sumneko_lua' then
			nvim_lsp[lsp].setup{
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
      					runtime = {
        					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        					version = 'LuaJIT',
        					-- Setup your lua path
        					path = runtime_path,
      					},
						diagnostics = {
        					-- Get the language server to recognize the `vim` global
        					globals = {'vim'},
      					},
						workspace = {
        					-- Make the server aware of Neovim runtime files
        					library = vim.api.nvim_get_runtime_file("", true),
      					},
						telemetry = {
       						enable = false,
      					}
					}
				}
			}
		else
			nvim_lsp[lsp].setup{
				on_attach = on_attach,
				capabilities = capabilities
			}
		end
	end
end

setupServers()

-- nvim_lsp.ccls.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         highlight = {
--             lsRanges = true;
--         }
--     }
-- }
