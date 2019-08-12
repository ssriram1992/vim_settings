" Option for YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" Compiling and running C++ programs. Choose the required one and comment out
" the rest.
" nnoremap <F9> :!clear && g++ -std=c++11 -O2 % -o %:r && ./%:r<CR>
" nnoremap <F9> :!clear && g++ -m64 -g -L/opt/gurobi/gurobi801/linux64/lib/ -lgurobi_c++ -lgurobi80 -lm -I /opt/gurobi/gurobi801/linux64/include/ % -o %:r && ./%:r<CR>
nnoremap <F9> :!g++ %  -I/opt/gurobi801/linux64/include -L/opt/gurobi801/linux64/lib -lgurobi_c++ -lgurobi80 -lm -I /opt/armadillo-code/include -lblas -llapack -O2 -std=c++11  -o %:r<CR>
nnoremap <C-F9> :!./%:r<CR>
nnoremap <S-F9> :!clear && make<CR>

" Code folding for c++
set foldmethod=syntax



" Other operations
inoremap <C-j> <Esc>/<++><CR>cf>

" Bracket completions
" inoremap {} {}<++><Esc>4hi
" inoremap () ()<++><Esc>4hi
" inoremap [] []<++><Esc>4hi
inoremap {<CR> {<CR>}<Esc>O


" Begin Template
inoremap CPP<Tab> #include<iostream><CR>#include<armadillo><CR><CR>using namespace std;<CR><CR>int main()<CR>{<CR>}<Esc>O

" Comment line
nmap <leader>cc mzI// <Esc>`z
nmap <leader>ee :.g/^\s*\/\/ /normal ^3x<CR>:noh<CR>

vmap <leader>cc :g/^/normal I// <Esc>:noh<CR>
vmap <leader>ee :g/^\s*\/\/ /normal ^3x<CR>:noh<CR>

" For GenDeclaration and GenDefinition to work
so ~/.vim/plugins/a.vim
