local noerr, gl = pcall(require, 'galaxyline')
local noerr2, condition = pcall(require, 'galaxyline.condition')
local colors = require'colorscheme'.dracula

if not (noerr or noerr2) then
    return
end

local fileinfo = require('galaxyline.provider_fileinfo')
gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}
local gls = gl.section

local mode_map = {
	['n']  = {'NORMAL ',   colors.purple},
	['i']  = {'INSERT ',   colors.green},
	['R']  = {'REPLACE ',  colors.red},
	['v']  = {'VISUAL ',   colors.pink},
	['V']  = {'V-LINE ',   colors.pink},
	[''] = {'V-BLOCK ',  colors.pink},
	['s']  = {'SELECT ',   colors.yellow},
	['S']  = {'S-LINE ',   colors.orange},
	[''] = {'S-BLOCK ',  colors.pink},
	['c']  = {'COMMAND ',  colors.orange},
	['t']  = {'TERMINAL ', colors.bglight},
	['Rv'] = {'VIRTUAL ',  colors.red},
	['rm'] = {'--MORE ',   colors.cyan},
	-- Fallback mode.
	['fallback'] = {'UNKNOWN', colors.purple}
}

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
    file = {
      read_only = '',
      modified = '',
    }
}

local mode_color = function()
    return mode_map[vim.fn.mode()][2]
  end

local white_space = function() return ' ' end

local function file_name(is_active, highlight_group)
  normal_fg = is_active and colors.fg or colors.purple
  modified_fg = is_active and colors.red or colors.green
  if vim.bo.modifiable then
    if vim.bo.modified then
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. modified_fg)
    else
      vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. normal_fg)
    end
  end
  return fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)
end

-- --------------------------------------Left side-----------------------------------------------------------
local i = 1
gls.left[i] = {
    FirstElement = {
        provider = function() 
        vim.api.nvim_command('hi GalaxyFirstElement guifg='..mode_color())
            return icons.sep.right
        end,
    },
}

i = i + 1
gls.left[i] = {
  ViMode = {
    provider = function()
            -- vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color()..' gui=bold')
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color()..' gui=bold')
            return '' .. mode_map[vim.fn.mode()][1]
        end,
        highlight = { colors.fg, colors.bglighter }, 
    },
}

i= i + 1
gls.left[i] = {
    ViModeSep = {
        provider = function()
            --vim.api.nvim_command('hi GalaxyViModeSep guifg='..mode_color()..' guibg='..colors.bglight)
            return icons.sep.left .. ' '
        end,
        highlight = { colors.bglighter, colors.bglight }, 
    },
}

i = i + 1
gls.left[i] ={
    FileIcon = {
        provider = { white_space, 'FileIcon' },
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bglight },
    },
}

i = i + 1
gls.left[i] = {
    MyFileName = {
        provider = function() return file_name(true, 'GalaxyMyFileName') end,
        highlight = { colors.fg, colors.bglight },
        separator = icons.sep.left .. ' ',
        separator_highlight = {colors.bglight, colors.bgdarker}
    }
}

i = i + 1
gls.left[i] = {
    GitIcon = {
        provider = function()
            return icons.git
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.orange, colors.bgdarker},
        separator = ' ',
        separator_highlight = {colors.orange, colors.bgdarker},
    }
}

i = i + 1
gls.left[i] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.fg, colors.bgdarker, 'bold'},
        separator = ' ',
        separator_highlight = {colors.orange, colors.bgdarker},
    }
}

i = i + 1
gls.left[i] = {
    Space = {
        provider = white_space,
        highlight = {colors.bgdark, colors.bgdarker},
    }
}

i = i + 1
gls.left[i] = {
    Space = {
        provider = white_space,
        highlight = {colors.bgdark, colors.bgdarker},
    }
}

-- ------------------------------------Right side-----------------------------------------------------
local j = 1
gls.right[j] = {
    FirstSeparator = {
        provider = function() return icons.sep.right end,
        highlight = { colors.bglight, colors.bgdarker },
    }
}

j = j + 1
gls.right[j] = {
    LineInfo = {
        provider = 'LineColumn',
        highlight = { colors.fg, colors.bglight },
        separator = ' ',
        separator_highlight = { colors.cyan, colors.bglight },
    },
}

j = j + 1
gls.right[j] = {
    LastElement = {
        provider = function()
        vim.api.nvim_command('hi GalaxyLastElement guifg='..mode_color())
            return icons.sep.left
        end,
    },
}

-- -------------------------Short status line---------------------------------------
local k = 1
gls.short_line_left[k] = {
  SFirstElement = {
        provider = function() return icons.sep.right end,
        highlight = { colors.bglighter, 'NONE' },
        separator = icons.sep.left,
        separator_highlight = {colors.bgdarker, colors.bgdarker},
    },
}

k = k + 1
gls.short_line_left[k] ={
    SFileIcon = {
        provider = 'FileIcon',
        highlight = { colors.fg, colors.bgdarker },
    },
}

k = k + 1
gls.short_line_left[k] = {
    SMyFileName = {
        provider = function() return file_name(false, 'GalaxySMyFileName') end,
        highlight = {colors.bglight, colors.bgdarker},
        separator = icons.sep.left,
        separator_highlight = {colors.bgdarker, colors.bgdarker }
    }
}

k = k + 1
gls.short_line_right[k] = {
    SLastElement = {
        provider = function() return icons.sep.left end,
        highlight = { colors.bglight, 'NONE' }
    },
}
