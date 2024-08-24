set foldlevel=99
set foldmethod=manual
set foldexpr=folding#IndentFold(v:lnum)
set foldtext=folding#IndentFoldText()

for cmd in ['zo', 'zO', 'zc', 'zC', 'za', 'zA', 'zm', 'zM', 'zr', 'zR']
	exe 'nnoremap <silent> '.cmd.' :setlocal foldmethod=expr<CR>'.cmd.':setlocal foldmethod=manual<CR>'
endfor
