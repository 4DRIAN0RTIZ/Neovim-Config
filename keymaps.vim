"CONFIGURATION KEYMAPS
nmap <C-s> :w<CR>
nmap <C-w> :q<CR>
nmap <C-p> :bnext<CR>
nmap <C-o> :bprevious<CR>

"Telescope live grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


"Copilot.vim next and previous
imap <C-k> <Plug>(copilot-next)
imap <C-j> <Plug>(copilot-previous)
"Markdown Preview 
nmap <leader>mp <Plug>MarkdownPreviewToggle
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
