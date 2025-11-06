-- Feline status line configuration
local feline = require('feline')
local catppuccin = require('catppuccin.palettes').get_palette()

local ctp_feline = require('catppuccin.special.feline')

ctp_feline.setup()

require("feline").setup({
    components = ctp_feline.get_statusline(),
})

-- Custom providers
local vi_mode_utils = require('feline.providers.vi_mode')

-- Custom components
local function file_info()
  local filename = vim.fn.expand('%:t')
  if filename == '' then
    filename = '[No Name]'
  end
  local readonly = vim.bo.readonly and ' [RO]' or ''
  local modified = vim.bo.modified and ' [+]' or ''
  return filename .. readonly .. modified
end

local function git_branch()
  local branch = vim.fn.system('git branch --show-current 2>/dev/null | tr -d "\n"')
  if branch == '' then
    return ''
  end
  return ' ' .. branch
end

local function diagnostics()
  local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local errors = #diagnostics
  if errors > 0 then
    return ' ' .. errors
  end
  return ''
end

-- Theme colors
local colors = {
  bg = catppuccin.base,
  fg = catppuccin.text,
  black = catppuccin.surface0,
  skyblue = catppuccin.sky,
  cyan = catppuccin.teal,
  green = catppuccin.green,
  oceanblue = catppuccin.blue,
  magenta = catppuccin.mauve,
  orange = catppuccin.peach,
  red = catppuccin.red,
  violet = catppuccin.lavender,
  white = catppuccin.text,
  yellow = catppuccin.yellow,
}

-- Status line components
local components = {
  active = {},
  inactive = {},
}

-- Left side components
components.active[1] = {
  {
    provider = '▊ ',
    hl = {
      fg = colors.skyblue,
    },
  },
  {
    provider = vi_mode_utils.get_vim_mode,
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = colors.bg,
        bg = vi_mode_utils.get_mode_color(),
        style = 'bold',
      }
    end,
    right_sep = ' ',
  },
  {
    provider = git_branch,
    hl = {
      fg = colors.violet,
      bg = colors.black,
    },
    right_sep = {
      str = ' ',
      hl = {
        fg = colors.violet,
        bg = colors.black,
      },
    },
  },
  {
    provider = file_info,
    hl = {
      fg = colors.white,
      bg = colors.black,
    },
    right_sep = {
      str = ' ',
      hl = {
        fg = colors.white,
        bg = colors.black,
      },
    },
  },
}

-- Middle component
components.active[2] = {
  {
    provider = ' ',
    hl = {
      fg = colors.bg,
      bg = colors.bg,
    },
  },
}

-- Right side components
components.active[3] = {
  {
    provider = diagnostics,
    hl = {
      fg = colors.red,
      bg = colors.black,
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = colors.red,
        bg = colors.black,
      },
    },
  },
  {
    provider = ' ',
    hl = {
      fg = colors.magenta,
      bg = colors.black,
    },
  },
  {
    provider = ' ',
    hl = {
      fg = colors.green,
      bg = colors.black,
    },
  },
  {
    provider = ' ',
    hl = {
      fg = colors.orange,
      bg = colors.black,
    },
  },
  {
    provider = ' ',
    hl = {
      fg = colors.cyan,
      bg = colors.black,
    },
    right_sep = {
      str = ' ',
      hl = {
        fg = colors.cyan,
        bg = colors.black,
      },
    },
  },
  {
    provider = '▊',
    hl = {
      fg = colors.skyblue,
    },
  },
}

-- Inactive status line
components.inactive[1] = {
  {
    provider = file_info,
    hl = {
      fg = colors.white,
      bg = colors.black,
      style = 'bold',
    },
  },
}

-- Setup feline
feline.setup({
  components = components,
  theme = {
    bg = colors.bg,
    fg = colors.fg,
  },
  vi_mode_colors = {
    NORMAL = colors.green,
    OP = colors.green,
    INSERT = colors.cyan,
    VISUAL = colors.magenta,
    BLOCK = colors.orange,
    REPLACE = colors.red,
    COMMAND = colors.yellow,
  },
})
