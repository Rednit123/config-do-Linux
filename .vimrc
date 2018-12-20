syntax on
set nu
set softtabstop=4
set shiftwidth=4
highligh LineNr ctermfg=DarkGreen

autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh

map <F8> :!chmod +x % <CR>
map <F7> <CR> :!bash % <CR>
map <F5> :setlocal spell! spelllang=pt<CR>
imap jj <Esc>
