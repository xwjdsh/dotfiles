return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- coc
  use {'neoclide/coc.nvim', branch = 'release'}
  -- nvim-tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }
  -- colorscheme
  use 'catppuccin/nvim'

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  -- autopairs
  use 'windwp/nvim-autopairs'
  -- neoscroll
  use 'karb94/neoscroll.nvim'
  -- comment plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
end)
