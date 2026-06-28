local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  -- gruvbox color scheme
  use 'ellisonleao/gruvbox.nvim'
  -- kanagawa color scheme
  use 'rebelot/kanagawa.nvim'

  -- nvim-tree
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
  }

  -- plenary for luahelper functions
  use 'nvim-lua/plenary.nvim'

  -- telescope for finding files
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  -- Treesitter for laguage highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Mason for LSPs
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }

  -- install required lsps
  use "WhoIsSethDaniel/mason-tool-installer.nvim"

  -- lspconfig
  use "neovim/nvim-lspconfig"

  -- For nvim to use rust-analyzer
  use "mrcjkb/rustaceanvim"

  -- The completion engine that displays the autocomplete popups
  use "hrsh7th/nvim-cmp"

  -- Connects nvim-cmp to the Neovim LSP,
  -- so suggestions come from language servers like rust-analyzer and clangd
  use "hrsh7th/cmp-nvim-lsp"

  -- A snippet engine that expands templates
  use "L3MON4D3/LuaSnip"

  -- Helps nvim-cmp extend snippets
  use "saadparwaiz1/cmp_luasnip"






  if packer_bootstrap then
    require('packer').sync()
  end
end)

