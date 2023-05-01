-- This file can be loaded by calling `lua require("plugins")` from your init.vim

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  --fuzzy finder
  use {
	  "nvim-telescope/telescope.nvim", tag = "0.1.1",
	  -- or                            , branch = "0.1.x",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  --colorscheme
  -- Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
  use({
	  "rafi/awesome-vim-colorschemes",
	  -- config = function()
		  -- vim.cmd("colorscheme jellybeans")
	  -- end

  })
  -- use({
	  -- "rose-pine/neovim",
	  -- as = "rose-pine",
	  -- config = function()
		  -- require("rose-pine").setup()
		  -- vim.cmd("colorscheme rose-pine")
	  -- end
  -- })

--  Plug "nvim-treesitter/nvim-treesitter", {"do": ":TSUpdate"}
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
  use("nvim-treesitter/playground")


  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},             -- Required
      {"williamboman/mason.nvim"},           -- Optional
      {"williamboman/mason-lspconfig.nvim"}, -- Optional

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},         -- Required
      {"hrsh7th/cmp-nvim-lsp"},     -- Required
      {"hrsh7th/cmp-buffer"},       -- Optional
      {"hrsh7th/cmp-path"},         -- Optional
      {"saadparwaiz1/cmp_luasnip"}, -- Optional
      {"hrsh7th/cmp-nvim-lua"},     -- Optional

      -- Snippets
      {"L3MON4D3/LuaSnip"},             -- Required
      {"rafamadriz/friendly-snippets"}, -- Optional
    }
  }

  --file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  --airline
  use("windwp/windline.nvim")
  -- use("vim-airline/vim-airline")

  -- bufferline
  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

  --git integration
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use("tpope/vim-commentary")
  use("ap/vim-css-color")
  use("akinsho/toggleterm.nvim")
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

end)
