local opt = vim.opt
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g

local cfg = require'config'.options

-- disable nvim intro
opt.shortmess:append("sI")

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = {eob = " "}

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

g.mapleader = cfg.leaderkey
o.tabstop = cfg.tabstop
o.shiftwidth = cfg.siftwidth
o.smarttab = cfg.smarttab
bo.expandtab = cfg.expandtab

wo.number = cfg.number
o.encoding = cfg.encoding
o.hidden = cfg.hidden
o.mouse = cfg.mouse

o.cmdheight = cfg.cmdheight
o.updatetime = cfg.updatetime

o.swapfile = cfg.swapfile
o.backup = cfg.backup
o.writebackup = cfg.writebackup
o.completeopt = 'menuone,noselect'

o.termguicolors = cfg.termguicolors
vim.cmd([[colorscheme ]] .. cfg.theme)

g.cmake_build_dir_location = 'build'

g.lazygit_floating_window_winblend = 0
g.lazygit_floating_window_scaling_factor = 0.9
g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'}
g.lazygit_floating_window_use_plenary = 1
g.lazygit_use_neovim_remote = 0

