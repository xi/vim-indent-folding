function! s:IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! s:NextNonBlankLine(lnum)
	let l:numlines = line('$')
	let l:current = a:lnum + 1

	while l:current <= l:numlines
		if getline(current) =~? '\v\S'
			return l:current
		endif

		let l:current += 1
	endwhile

	return -1
endfunction

" fold by indent, but include first line
function! folding#IndentFold(lnum)
	if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	endif

	let l:this_indent = s:IndentLevel(a:lnum)
	let l:next_indent = s:IndentLevel(s:NextNonBlankLine(a:lnum))

	if l:next_indent <= l:this_indent
		return l:this_indent
	else
		return '>' . l:next_indent
	endif
endfunction

" display first line with correct indentation
function! folding#IndentFoldText()
	let l:firstline = getline(v:foldstart)
	if &expandtab
		let l:space = ''
	else
		let l:space = repeat(' ', indent(v:foldstart) - indent(v:foldstart) / &tabstop)
	endif
	return l:space . l:firstline
endfunction
