function! s:IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! s:NextNonBlankLine(lnum)
	let numlines = line('$')
	let current = a:lnum + 1

	while current <= numlines
		if getline(current) =~? '\v\S'
			return current
		endif

		let current += 1
	endwhile

	return -1
endfunction

" fold by indent, but include first line
function! folding#IndentFold(lnum)
	if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	endif

	let this_indent = s:IndentLevel(a:lnum)
	let next_indent = s:IndentLevel(s:NextNonBlankLine(a:lnum))

	if next_indent <= this_indent
		return this_indent
	else
		return '>' . next_indent
	endif
endfunction

" display first line with correct indentation
function! folding#IndentFoldText()
	let firstline = getline(v:foldstart)
	if &expandtab
		let space = ''
	else
		let space = repeat(' ', indent(v:foldstart) - indent(v:foldstart) / &tabstop)
	endif
	return space . firstline
endfunction
