" To have Ctrl+N fill labels with ':' in them
set iskeyword+=:
" let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_CompileRule_format = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex $*'
let g:Tex_ViewRule_pdf = 'okular --unique'

" To identify align environment as a Math environment
call TexNewMathZone("E","align",1)
call TexNewMathZone("F","alignat",1)

" Comment
nmap <leader>cc mzI% <Esc>`z
nmap <leader>ee :.g/^\s*% /normal ^2x<CR>:noh<CR>
vmap <leader>cc :g/^/normal I% <Esc>:noh<CR>
vmap <leader>ee :g/^\s*% /normal ^2x<CR>:noh<CR>

" Operators in between
inoremap <buffer> qe<Tab> \quad&<Esc>mza<++>\quad<++><Esc>`z
inoremap <buffer> qle<Tab> \quad&\leq\quad
inoremap <buffer> qge<Tab> \quad&\geq\quad
inoremap <buffer> qd<Tab> \quad
inoremap <buffer> qqd<Tab> \qquad

" To compile and produce pdf output press, <F9>
" :nnoremap <F9> :w<CR>:silent exec "!pdflatex %"<CR><C-l> :!open %:r.pdf <cr><cr>

function! Dtemp()
!rm %:r.log %:r.bbl %:r.out %:r.*xmk %:r.blg %:r.fls
endfunction	


function! DtempAll()
!rm *.log *.bbl *.out *.*xmk *.blg *.fls
endfunction	

function! Tex()
0r ~/.vim/plugins/textempl.tex
let s:t = input( "Title? " )
execute "normal 49G0f{lct}".s:t."\<Esc>58G"
endfunction

" inoremap <C-j> <Esc>/<++><CR>cf>

"""""""""""""
" Variables "
"""""""""""""
setlocal timeoutlen=300


"""""""""""""
" Typefaces "
"""""""""""""
" Bold
inoremap <buffer> <C-C>b			\textbf{}<Left>
vnoremap <buffer> <C-C>b			v`>a}<Esc>`<i\textbf{<Esc>%
nnoremap <buffer> <C-C>b			wbi\textbf{<Esc>ea}<Esc>

" Italic
inoremap <buffer> <C-C>i			\textit{}<Left>
nnoremap <buffer> <C-C>i			wbi\textit{<Esc>ea}<Esc>

" Emph
inoremap <buffer> <C-C>e			\emph{}<Left>
vnoremap <buffer> <C-C>e			v`>a}<Esc>`<i\emph{<Esc>%
nnoremap <buffer> <C-C>e			wbi\emph{<Esc>ea}<Esc>

" Smallcaps
inoremap <buffer> <C-C>s			\textsc{}<Left>
nnoremap <buffer> <C-C>s			wbi\textsc{<Esc>ea}<Esc>

" Verbatim
inoremap <buffer> <C-C>v			\verb++<Left>
nnoremap <buffer> <C-C>v			wbi\verb+<Esc>ea+<Esc>
inoremap <buffer> V<Tab>			\begin{verbatim}<CR><CR>\end{verbatim}<UP>


" Underline
inoremap <buffer> _<Tab>			\underline{}<Left>
nnoremap <buffer> <C-C>_         		wbi\underline{<Esc>ea}<Esc>

" Mathmodes
inoremap <buffer> bb<Tab>			\mathbb{}<Left>
inoremap <buffer> cal<Tab>			\mathcal{}<Left>

" Brackets
inoremap <buffer> lp<Tab>			\left ( \right )<++><Esc>3bi
vnoremap <buffer> lp<Tab>			v`<i\left (<Esc>`> 5<Right> a\right )<Esc>
vnoremap <buffer> (     			v`<i(<Esc>`>la)<Esc>
inoremap <buffer> lbr<Tab>			\left \lbrace \right \rbrace<++><Esc>5bi
inoremap <buffer> lv<Tab>			\left \Vert \right \Vert<++><Esc>5bi


" Sections and subsections
inoremap <buffer> sec<Tab>          \section{}<Esc>i
inoremap <buffer> sub<Tab>          \subsection{}<Esc>i
inoremap <buffer> par<Tab>          \paragraph{}<Esc>i

" Fraction
inoremap <buffer> frac<Tab>         \frac{<++>}{<++>}<Esc>2?<++><CR>cf>


""""""""""""""""
" Enumerations "
""""""""""""""""
inoremap <buffer> I<Tab>			\begin{itemize}<CR><CR>\end{itemize}<UP><tab>
inoremap <buffer> E<Tab>			\begin{enumerate}<CR><CR>\end{enumerate}<UP><tab>
inoremap <buffer> i<Tab>		    <Esc>$a\item{}<Left>



"""""""""""""
" Math mode "
"""""""""""""
inoremap <buffer> m<Tab>			$$<Left>
inoremap <buffer> $     			$$<Left>
vnoremap <buffer> $$                v`>a$<Esc>`<i$<Esc>
inoremap <buffer> M<Tab>			\begin{align}<CR><CR>\end{align}<UP>
inoremap <buffer> sube<Tab>			\begin{subequations}<CR>\begin{align}<CR><CR>\end{align}<CR>\end{subequations}<UP><UP>


"""""""""""
" Tabular "
"""""""""""
inoremap <buffer> <C-C>T			\begin{tabular}{}<CR>\end{tabular}<UP><Esc>$i
inoremap <buffer> -<Tab>			\hline<CR>

inoremap <buffer> table<Tab>        <Esc>:call InsertTable()<CR>

function! InsertTable()
    let row = input( "Number of rows? ")
    let col = input( "Number of cols? ")
    execute "normal o\\begin{tabular}{|\<Esc>".col."ac|\<Esc>a}\<CR>\\hline\<CR>\<Esc>".col."a<++>\& \<Esc>xxa\\\\ \<Esc>ddk".row."pk".row."jo\\hline\<CR>\\end{tabular}\<Esc>".row."kkk\<Up>a"
endfunction




""""""""""""
" Graphics "
""""""""""""
inoremap <buffer> ffig<Tab>         \includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}\label{fig:<++>}<CR>
" Just add includegraphics, caption and label
imap     <buffer> *<Tab>			jkmziffig<Tab>`z<C-j>
" Add a figure environment
imap     <buffer> fig<Tab>          jkmzi\begin{figure}[t]<CR>\centering<CR>\end{figure}jk`za<C-j>
" Add a subfigure environment with 2 subfigures
imap     <buffer> sfig<Tab>         jkmzi\begin{figure}[t]<CR>\centering<Cr>\begin{subfigure}[b]{0.45\textwidth}<CR>ffig<Tab>\end{subfigure}<CR>\begin{subfigure}[b]{0.45\textwidth}<CR>ffig<Tab>\end{subfigure}<CR>\caption{<++>}\label{fig:<++>}<CR>\end{figure}jk`za<C-j>



"""""""""""""""""
" Double quotes "
"""""""""""""""""
" inoremap <buffer> "				``''<Left><Left>
" inoremap <buffer> \"			"
" nnoremap <buffer> <C-C>"			wbi``<Esc>ea''<Esc>




"""""""""""""""""""
" New environment "
"""""""""""""""""""
inoremap <buffer> N<Tab>			<Esc>:call InsertEnv()<CR>

function! InsertEnv() 
	let s:t = input( "Environment? " )
	execute "normal o\\begin{".s:t."}\<CR>\<CR>\\end{".s:t."}\<UP>"
endfunction



""""""""
" Misc "
""""""""
" vnoremap <buffer> <leader>%			:s/^/% <CR>:noh<CR>
inoremap <buffer> <Del><Tab>		<Esc>F{d%a{}<Left>


""""""""""""
" Movement "
""""""""""""

" In/out of braces
" inoremap <buffer> }<Tab>		<Esc>f}a<space>
" inoremap <buffer> {<Tab>		<Esc>F{bi

" In/out of environments
" inoremap <buffer> ]<Tab>		<Esc>/\\end{.*}<cr>f}:noh<cr>a
" noremap <buffer> ]				/\\end{.*}<cr>f}:noh<cr>

" inoremap <buffer> [<Tab>		<Esc>?\\begin{.*}<cr>:noh<cr>i
" map <buffer> [				?\\begin{.*}<cr>:noh<cr>

