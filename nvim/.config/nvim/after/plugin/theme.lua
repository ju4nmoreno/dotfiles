vim.cmd([[
  colorscheme onedark
  highlight ColorColumn ctermbg=0 guibg=grey
	hi SignColumn guibg=none
	hi CursorLineNR guibg=None
	highlight Normal guibg=none
	highlight clear LineNr
	" highlight LineNr guifg=#aed75f
	" highlight LineNr guifg=#5eacd3
	highlight netrwDir guifg=#5eacd3
	highlight qfFileName guifg=#aed75f
	hi TelescopeBorder guifg=#5eacd
]])

require("onedarkpro").setup({
  colors = {
    red = "#FF0000"
  }
})
