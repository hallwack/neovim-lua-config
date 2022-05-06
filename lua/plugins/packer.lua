local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}
)

-- Install your plugins here
return packer.startup(function(use)

  -- Plugin Management
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Text Syntax
  use "nvim-treesitter/nvim-treesitter"

  -- Tree-like File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require 'nvim-tree'.setup {} end
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Text Editing
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Snippets
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  -- use { "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" }

  -- Colorscheme
  use "Mofiqul/vscode.nvim"
  use { 'mangeshrex/uwu.vim' }
  use "bluz71/vim-moonfly-colors"
  use 'frenzyexists/aquarium-vim'
  use "rebelot/kanagawa.nvim"
  use "projekt0n/github-nvim-theme"
  use 'cpea2506/one_monokai.nvim'
  use 'kvrohit/rasmus.nvim'
  use 'shaunsingh/nord.nvim'
  use 'kvrohit/substrata.nvim'
  use "LunarVim/darkplus.nvim"
  use "LunarVim/onedarker.nvim"

  -- Statusline and Tabline
  use "nvim-lualine/lualine.nvim"
  use { "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }


  -- Indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "andweeb/presence.nvim"

  -- Startup
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
