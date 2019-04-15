nnoremap <F9> :!clear && gcc % -o %:r -m64 -g -I /opt/gurobi/gurobi801/linux64/include/ -L /opt/gurobi/gurobi801/linux64/lib/ -lgurobi80 -lm <CR>
nnoremap <C-F9> :!./%:r
