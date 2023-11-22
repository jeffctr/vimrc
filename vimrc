"" --------------------------- Vundle configuration ---------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" GIT tools
Plugin 'tpope/vim-fugitive'
" NerdTree
Plugin 'scrooloose/nerdtree'
" vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" vim-bundler
Plugin 'tpope/vim-bundler'
" https://github.com/vim-airline/vim-airline
" => good looking bottom :)
Plugin 'vim-airline/vim-airline'
" https://github.com/tomtom/tcomment_vim
" => create comments or block comments
" => gcc, gc, g>b
Plugin 'tomtom/tcomment_vim'
" https://github.com/tomasr/molokai new theme for the termnal
Plugin 'tomasr/molokai'
" https://github.com/tpope/vim-surround
" => mappings to easily delete change and add such surroundings in pairs.
" cs, ds, yssb, VS
Plugin 'tpope/vim-surround'
" https://github.com/jiangmiao/auto-pairs.
" => Every one should have a pair (Atogenerate pairs for "{[(
Plugin 'jiangmiao/auto-pairs'
" https://github.com/StanAngeloff/php.vim
" => php Highlighting
Plugin 'StanAngeloff/php.vim'
" https://github.com/kien/ctrlp.vim.git
Plugin 'kien/ctrlp.vim'
"vim-twig
Plugin 'lumiliet/vim-twig'
" vim-javascript
Plugin 'vim-syntastic/syntastic'
"=> JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'MaxMEllon/vim-jsx-pretty'
"=> React JSX syntax pretty highlighting for vim.
" Plugin '/home/meteor/.fzf'
Plugin 'junegunn/fzf.vim'
set rtp+=~/.fzf
let g:ackprg = 'ag --nogroup --nocolor --column'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" --------------- PERSONAL CONFIGURATION FOR VIM ---------------
    syntax on
    filetype plugin indent on

  "---------------- NERDTree
    autocmd vimenter * NERDTree
    let g:NERDTreeDirArrows=0
  "---------------- jsConfig ----------------
  " let g:vim_jsx_pretty_enable_jsx_highlight = 0 " default 1
  " let g:javascript_plugin_jsdoc = 1 " default 0
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files
  "---------------- JS ESLINT CONFIG ----------------
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

  "---------------- CTRLP configuration
  "---------------- Change the default mapping and the default command to invoke CtrlP:
    let g:ctrlp_max_files=0
    let g:ctrlp_max_depth=40
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
  "---------------- When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
    let g:ctrlp_working_path_mode = 'ra'
  "---------------- Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
    set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*/vendor/*,*/cache/*,*/tmp/*    " MacOSX/Linux

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
  " Use a custom file listing command:
  " let g:ctrlp_user_command = 'find %s -type f'

  "---------------- Active line numbers ----------------
  set nu
  "---------------- Active Airline ----------------
  set laststatus=2
  ""---------------- remove trailing white spaces ----------------
  if has("autocmd")
    autocmd BufWritePre * :%s/\s\+$//e
  endif

" ----------------theme configuration just for gui mode -----------------
  if has('gui_running')
     let g:airline#extensions#tabline#enabled=1
    "molkai theme configuration
      let g:molokai_original = 1
      colorscheme molokai
    else
    "molkai theme configuration
      let g:rehash256 = 1
  endif

" ----------------Files Tabs configuration -----------------
  set tabstop=4 shiftwidth=4 expandtab
  autocmd Filetype python setlocal ts=4 sts=4 sw=4
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
  autocmd Filetype scss setlocal ts=2 sts=2 sw=2
  autocmd Filetype css  setlocal ts=2 sts=2 sw=2
  autocmd Filetype less  setlocal ts=2 sts=2 sw=2
  autocmd Filetype json  setlocal ts=2 sts=2 sw=2

" ---------------- Shortcuts -----------------
"  With the following mappings (which require gvim), you can press Ctrl-Left or Ctrl-Right to go to the previous or next tabs,
"  and can press Alt-Left or Alt-Right to move the current tab to the left or right.
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" Pressing Tab on the command line will show a menu to complete buffer and file names
set wildchar=<Tab> wildmenu wildmode=full
" The following lines you can press F10 to open the buffer menu
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" ----------------- PHP Config -----------------
" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
