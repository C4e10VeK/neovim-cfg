local theme = 'dracula'

local opt = vim.opt
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g

-- disable nvim intro
opt.shortmess:append("sI")

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = {eob = " "}

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
bo.expandtab = true

wo.number = true
o.encoding = 'utf-8'
o.hidden = true
o.mouse = 'a'

o.cmdheight = 2
o.updatetime = 300

o.swapfile = false
o.backup = false
o.writebackup = false

o.termguicolors = true
vim.cmd([[colorscheme ]] .. theme)

g.cmake_build_dir_location = 'build'

require'mappings'
