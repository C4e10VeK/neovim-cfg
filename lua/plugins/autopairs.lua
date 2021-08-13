local noerr, autopairs = pcall(require, 'nvim-autopairs')
local noerr2, autopairs_completion = pcall(require, 'nvim-autopairs.completion.compe')

if not (noerr or noerr2) then
    return
end

autopairs.setup{}
autopairs_completion.setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = false,  -- auto select first item
})
