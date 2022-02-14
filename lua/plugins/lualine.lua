local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
  bg       = '#262626',
  fg       = '#ffffff',
  yellow   = '#ffaf00',
  cyan     = '#008080',
  lightblue= '#5cb6f8',
  green    = '#619955',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#0a7aca',
  red      = '#f44747',
  blue_vsc = '#2188ff',
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = {
      normal = {
        a = {
          fg = colors.blue,
          bg = colors.bg
        },
        b = {
          fg = colors.fg,
          bg = colors.blue
        },
        c = {
          fg = colors.bg,
          bg = colors.blue_vsc
        },
        x = {
          fg = colors.lightblue,
          bg = colors.bg
        },
        y = {
          fg = colors.lightblue,
          bg = colors.bg
        }
      },
      command = {
        a = {
          fg = colors.orange,
          bg = colors.bg
        },
        b = {
          fg = colors.fg,
          bg = colors.orange
        },
        c = {
          fg = colors.bg,
          bg = colors.blue_vsc
        },
        x = {
          fg = colors.lightblue,
          bg = colors.bg
        },
        y = {
          fg = colors.lightblue,
          bg = colors.bg
        }
      },
      insert = {
        a = {
          fg = colors.green,
          bg = colors.bg
        },
        b = {
          fg = colors.fg,
          bg = colors.green
        },
        x = {
          fg = colors.lightblue,
          bg = colors.bg
        },
        y = {
          fg = colors.lightblue,
          bg = colors.bg
        }
      },
      visual = {
        a = {
          fg = colors.magenta,
          bg = colors.bg,
          gui = "bold"
        },
        b = {
          fg = colors.fg,
          bg = colors.magenta
        },
        x = {
          fg = colors.lightblue,
          bg = colors.bg
        },
        y = {
          fg = colors.lightblue,
          bg = colors.bg
        }
      },
      inactive = {
        a = {
          fg = colors.blue,
          bg = colors.bg
        },
        c = {
          fg = colors.lightblue,
          bg = colors.bg
        }
      },
    },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = { "filename" },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
