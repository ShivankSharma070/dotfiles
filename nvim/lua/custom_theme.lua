local M = {}
function M.setup()
	vim.cmd([[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
]])
	-- these are the comments

    -- Make notifications truly transparent
    vim.api.nvim_set_hl(0, 'NotifyBackground', { 
        bg = '#d77a8a'
    })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
	vim.api.nvim_set_hl(0, "String", { fg = "#89B4FA" })


	vim.api.nvim_set_hl(0, "Comment", { fg = "#A8D5A8", italic = true })
	vim.api.nvim_set_hl(0, "Keyword", { italic = true })
	vim.api.nvim_set_hl(0, "Function", { fg= "#C792EA",italic = true })
	vim.api.nvim_set_hl(0, "CursorLine", { bold = false, bg = "black" })
	vim.api.nvim_set_hl(0, "Visual", { bold = true, bg = "#3B2F35" })
    vim.api.nvim_set_hl(0, 'nCursor', { bg = '#89B4FA', fg = '#000000' })
    vim.api.nvim_set_hl(0, 'rCursor', { bg = '#9999ff', fg = '#000000' })
   vim.api.nvim_set_hl(0, 'iCursor', { bg = 'white', fg = '#000000' })

end
return M
