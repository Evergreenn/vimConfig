execute pathogen#infect()
syntax on
filetype plugin indent on
set autoindent
set laststatus=2
set noshowmode

colorscheme nord
set termguicolors

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:lightline = {'colorscheme': 'nord'}

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd VimEnter * NERDTree | wincmd p

set relativenumber

highlight CursorLineNr ctermfg=yellow
" highlight LineNr ctermfg=

nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
inoremap <C-k> <Esc>:m-2<CR>
inoremap <C-j> <Esc>:m+<CR>

set ts=4 sw=4

" CocVim
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nnoremap <silent> K :call ShowDocumentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" CTRLP 
let g:ctrlp_map = '<c-e>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|target\|vendor'
let g:ctrlp_tabpage_position = 'ac'
" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" ALE
let b:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['eslint']}

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" let g:prettier#quickfix_enabled = 0
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
