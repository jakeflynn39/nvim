function ColorMyPencils(color) 
	color = color or "everforest"
	vim.cmd.colorscheme(color)
    vim.cmd "let g:everforest_background = 'hard'"
    vim.cmd "set background=dark"
end

ColorMyPencils()
