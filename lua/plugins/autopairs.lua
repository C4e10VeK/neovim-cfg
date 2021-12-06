local noerr, autopairs = pcall(require, 'nvim-autopairs')
local noerr2, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')

if not (noerr or noerr2) then
    return
end

require'cmp'.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { text = '' } }))

autopairs.setup{}

