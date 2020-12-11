
call plug#begin("~/.vim/plugged")
  " Theming
  Plug 'gruvbox-community/gruvbox'
  " Plug 'sainnhe/gruvbox-material'
  " Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'

  " vim airline 
  Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'

  " Search files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'airblade/vim-rooter'

  " Conquer Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'ycm-core/YouCompleteMe'

  Plug 'airblade/vim-gitgutter'
  " markdown install
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

  " Files Explorer
  " Plug 'scrooloose/nerdtree'
  " Plug 'ryanoasis/vim-devicons'

  " show tree
  Plug 'mbbill/undotree'

  " javascript and typescript
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  " tope 
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  " comments
  Plug 'preservim/nerdcommenter'

  " emmet
  Plug 'mattn/emmet-vim'  

  " git
  Plug 'jreybert/vimagit'
  
  " handleba
  Plug 'mustache/vim-mustache-handlebars'
call plug#end()
