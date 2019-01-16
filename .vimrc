set number
set mouse=a
set cursorline
set cursorcolumn

" tabbing
set expandtab
set autoindent
set tabstop=4

" searching visually selected code
:vnoremap // y/<C-R>"<CR>
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

:inoremap <Home> <Esc>I
:inoremap DD <C-O>dd
:inoremap UU <C-O>u
:inoremap PP <C-O>p

" Saving
:nmap <C-s> :w<CR>
:imap <C-s> <C-O>:w<CR>

" Saving session
:nmap <C-W> :mksession! ~/vimsess.vim<CR> :xa
:imap <C-W> <Esc>:mksession! ~/vimsess.vim<CR> :xa

" colors
set t_Co=256
syntax enable
colorscheme molokai
set background=dark

" Commenting and Un-Commenting
let s:comment_map = { 
      \   "c": '\/\/',
      \   "cpp": '\/\/',
      \   "go": '\/\/',
      \   "java": '\/\/',
      \   "javascript": '\/\/',
      \   "scala": '\/\/',
      \   "php": '\/\/',
      \   "python": '#',
      \   "ruby": '#',
      \   "sh": '#',
      \   "desktop": '#',
      \   "fstab": '#',
      \   "conf": '#',
      \   "profile": '#',
      \   "bashrc": '#',
      \   "bash_profile": '#',
      \   "mail": '>',
      \   "eml": '>',
      \   "bat": 'REM',
      \   "ahk": ';',
      \   "vim": '"',
      \   "tex": '%',
      \ }
                                     
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
    if getline('.') =~ "^\\s*" . comment_leader . " " 
        " Uncomment the line
        execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
    else 
        if getline('.') =~ "^\\s*" . comment_leader
            "  Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
        else
            " Comment the line
            execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
        end
    end
    else
        echo "No comment leader found for filetype"
    end
endfunction

" :inoremap <C-m> <Esc> :call ToggleComment()<CR>i
:vnoremap <C-Space> :call ToggleComment()<CR>
