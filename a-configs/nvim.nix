{ config, lib, pkgs, ... }: 
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
      " Горячие клавиши
      nnoremap <leader>n :NERDTreeFocus<CR>
      nnoremap <C-n> :NERDTree<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>
      nnoremap <C-f> :NERDTreeFind<CR>

	
    '';
	
   plugins = with pkgs.vimPlugins; [
    vim-airline
	vim-nerdtree-tabs
	vim-nerdtree-syntax-highlight
	nerdtree
	nerdtree-git-plugin
	noice-nvim
	which-key-nvim
  ];
  extraLuaConfig = '' 
	require("noice").setup()
	require("which-key").setup()
  '';	
  };
}
