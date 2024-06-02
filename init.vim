" Options

"lua require('init')

" Enables the clipboard between Vim/Neovim and other applications.
set clipboard=unnamedplus
" Modifies the auto-complete menu to behave more like an IDE.
set completeopt=noinsert,menuone,noselect

set encoding=utf-8

set cursorline 			" Highlights the current line in the editor
set hidden 			" Hide unused buffers
set autoindent 			" Indent a new line
set inccommand=split 		" Show replacements in a split screen
set mouse=a 			" Allow to use the mouse in the editor
set number 			" Shows the line numbers
set splitbelow splitright 	" Change the split screen behavior
set title 			" Show file title
set wildmenu 			" Show a more advance menu
set cc=80 			" Show at 80 column a border for good code style
filetype plugin indent on   	" Allow auto-indenting depending on file type
syntax on
" set spell			" enable spell check (may need to download language package)
set ttyfast 			" Speed up scrolling in Vim

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


" Plugin section
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utils
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

" Completion / linters / formatters
Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

" JS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Git
Plug 'airblade/vim-gitgutter'

" Always load as the last one 
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Appearance
colorscheme gruvbox
let g:bargreybars_auto=0
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" NERDTree
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1

" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" CoC Autocomplete
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

