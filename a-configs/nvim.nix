{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraConfig = ''
      set number
      set relativenumber
      set tabstop=4
      set shiftwidth=4
      set smarttab
      set softtabstop=4
      set scrolloff=5
      set clipboard=unnamedplus

      let NERDTreeShowHidden=1

      " Инициализация vim-plug
      call plug#begin('~/.local/share/nvim/plugged')

      Plug 'vim-airline/vim-airline'
      Plug 'preservim/nerdtree'
      Plug 'https://github.com/ap/vim-css/color'

      call plug#end()

      " Горячие клавиши
      nnoremap <leader>n :NERDTreeFocus<CR>
      nnoremap <C-n> :NERDTree<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>
      nnoremap <C-f> :NERDTreeFind<CR>
    '';
  };
}
