"CONFIGURATION KEYMAPS
nmap <C-s> :w<CR>
nmap <C-w> :q<CR>
nmap <C-p> :bnext<CR>
nmap <C-o> :bprevious<CR>

"Telescope live grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fc <cmd>lua require('flask_curl').detect_flask_route()<cr>

"Toggle NvimTree
nnoremap <silent> <F2> :NvimTreeToggle<CR>
nnoremap <silent> <C-r> :NvimTreeRefresh<CR>
nnoremap <silent> <F3> :NvimTreeFindFile<CR>

"Copilot.vim next and previous
imap <C-k> <Plug>(copilot-next)
imap <C-j> <Plug>(copilot-previous)
"""Prettier Conf
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nnoremap <leader>pr :Prettier<CR>
"Telescope Conf
nnoremap <leader>ff <cmd>Telescope find_files<cr>
"""Commentary Conf
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"Emmet Conf
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={
      \ 'javascript' : {
    \ 'extends' : 'jsx'
    \ }
  \ }

"Window split and navigation Conf"
"Split window vertically
nnoremap <C-v> :vsplit<CR>
"Split window horizontally
nnoremap <C-s> :split<CR>
"Move to the left Window
nnoremap <C-l> <C-w>l
"Move to the right Window
nnoremap <C-h> <C-w>h
"Move to the upper Window
nnoremap <C-j> <C-w>j
"Move to the lower Window
nnoremap <C-k> <C-w>k
"Resize Window
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
"Close Window
nnoremap <C-q> :close<CR>
