function! Gams()
0r ~/.vim/plugins/gamstempl.gams
endfunction

""""""""""""
" Keywords "
""""""""""""
imap <buffer> P<Tab>		Positive
imap <buffer> N<Tab>		Negative

imap <buffer> V<Tab>		Variables
imap <buffer> Pa<Tab>		Parameters
imap <buffer> E<Tab>		Equations

""""""""""""""""""""""""
" Relational operators "
""""""""""""""""""""""""
imap <buffer> ><Tab>		=g=<Esc>a<Space>
imap <buffer> <<Tab>		=l=<Esc>a<Space>
imap <buffer> =<Tab>		=e=<Esc>a<Space>

""""""""""""""
" Commenting "
""""""""""""""
vmap <buffer> *			:s/^/*<CR>:noh<cr>
vmap <buffer> <C-C>		<Esc><Esc>`<O$ontext<Esc>`>o$offtext<Esc>

"""""""""""""
" Executing "
"""""""""""""
nmap <F9> :w<CR> :!gams %<CR>
