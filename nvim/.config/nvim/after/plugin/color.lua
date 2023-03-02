-- set colorscheme to nightfly with protected call
-- in case it isn't installed
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
-- if not status then
-- 	print("Colorscheme not found!") -- print error if colorscheme not installed
-- 	return
-- end
--
-- function ColorMyPencils(color)
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- end
--
-- ColorMyPencils()

vim.cmd([[
  highlight link LspSagaFinderSelection Search
]])
require("github-theme").setup({
	theme_style = "dark",
	function_style = "italic",
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	hide_inactive_statusline = false,
	-- transparent = true,

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = { hint = "orange", error = "#ff0000" },

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
			-- this will remove the highlight groups
			TSField = {},
		}
	end,
})
