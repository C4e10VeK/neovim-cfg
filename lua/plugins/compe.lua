local noerr, compe = pcall(require, 'compe')
local fn = vim.fn

if not noerr then
    return
end

compe.setup {
    enabled = true,
    autocomplete = true,
    preselect = 'enebled',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documetation = {
        border = { '', '', '', ' ', '', '', '', ' ' },
        winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    },
    source = {
        path = true,
        nvim_lsp = true,
        luasnip = true,
        buffer = true,
        calc = true,
        nvim_lua = true,
        vsnip = true,
        ultisnips = true,
    },
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col '.' - 1
    if col == 0 or fn.getline('.'):sub(col, col):match '%s' then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-Tab>'
    end
end
