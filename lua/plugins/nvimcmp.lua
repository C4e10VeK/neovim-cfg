local noerr, cmp = pcall(require, 'cmp')

if not noerr then
	return
end

package.path = package.path .. ';../config.lua'
local keyMap = require'config'.keymaps.cmp

cmp.setup({
	formatting = {
		format = require'lspkind'.cmp_format()
	},
	mapping = {
		[keyMap.docsUp] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    	[keyMap.docsDown] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    	[keyMap.complete] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    	[keyMap.abort] = cmp.mapping({
    		i = cmp.mapping.abort(),
        	c = cmp.mapping.close(),
      	}),
      	[keyMap.confirm] = cmp.mapping.confirm({ select = true }),
		[keyMap.tabComplete] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					local entry = cmp.get_selected_entry()
					if not entry then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					end
					cmp.confirm()
				else
					fallback()
				end
			end, {'i', 's'}
		)
	},
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' }
		},
		{
			{ name = 'buffer' }
		}
	)
})

