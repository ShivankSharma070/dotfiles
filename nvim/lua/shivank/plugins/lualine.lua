return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

  -- -- Function to get the number of open buffers using the :ls command
  -- local function get_buffer_count()
  --   local buffers = vim.fn.execute("ls")
  --   local count = 0
  --   -- Match only lines that represent buffers, typically starting with a number followed by a space
  --   for line in string.gmatch(buffers, "[^\r\n]+") do
  --     if string.match(line, "^%s*%d+") then
  --       count = count + 1
  --     end
  --   end
  --   return count
  -- end

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}
    local customTheme = require'lualine.themes.auto'
    customTheme.normal.c.bg='blend'
    customTheme.insert.c.bg='blend'
    customTheme.visual.c.bg='blend'
    customTheme.command.c.bg='blend'
    customTheme.replace.c.bg='blend'

    -- local bufferCount = get_buffer_count()
    lualine.setup({
			options = {
			-- theme = my_lualine_theme,
        theme = customTheme,
			},

			refresh = {
				statusline = 100,
				-- winbar = 100,
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = false, -- Display new file status (new file means no write after created)
						path = 3, -- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory

						shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						-- for other components. (terrible name, any suggestions?)
						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "Empty", -- Text to show for unnamed buffers.
							newfile = "New", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates, -- show only when a update is available
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
-- winbar = {
--   lualine_a = {},
--   lualine_b = {},
--   lualine_c = {},
--   lualine_x = {},
--   lualine_y = {get_buffer_count},
--   lualine_z = {'filesize'}
-- }
		})
	end,
}
