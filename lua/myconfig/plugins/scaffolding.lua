return {
    --file explorer
    {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
	    "nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	version = "nightly",           -- optional, updated every week. (see issue #1193)
	config = function (_, opts)

	    require("nvim-tree").setup({
		sync_root_with_cwd = true,
		view = {
		    number = true,
		    relativenumber = true,
		    -- side = "right",
		    side = "left",
		    adaptive_size = true
		},
	    })
	    -- keymaps
	    vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>')
	    vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
	    -- vim.keymap.set('n', '(i dont have a key yet)', ':NvimTreeRefresh<CR>')
	end
    },
    --gcc to comment
    {
	'numToStr/Comment.nvim',
	opts = {
	    -- add any options here
	},
	lazy = false,
    },
    "windwp/nvim-autopairs",
}
-- require("lazy").setup({
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		dependencies = {
-- 			-- Automatically install LSPs to stdpath for neovim
-- 			{
-- 				'williamboman/mason.nvim',
-- 				config = true,
-- 			},
-- 			'williamboman/mason-lspconfig.nvim',
--
-- 			-- Useful status updates for LSP
-- 			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
-- 			{
-- 				'j-hui/fidget.nvim',
-- 				tag = "legacy",
-- 				event = "LspAttach",
-- 				opts = {}
-- 			},
--
-- 			-- Additional lua configuration, makes nvim stuff amazing!
-- 			-- 'folke/neodev.nvim', --doesn't work? check now!
-- 			{ "folke/neodev.nvim", opts = {} }
-- 		},
--
-- 	},
-- 	{
-- 		-- Autocompletion
-- 		'hrsh7th/nvim-cmp',
-- 		dependencies = {
-- 			-- Snippet Engine & its associated nvim-cmp source
-- 			'L3MON4D3/LuaSnip',
-- 			'saadparwaiz1/cmp_luasnip',
--
-- 			-- Adds LSP completion capabilities
-- 			'hrsh7th/cmp-nvim-lsp',
--
-- 			-- Adds a number of user-friendly snippets
-- 			'rafamadriz/friendly-snippets', -- is this really a dependency? what do dependencies mean in lazy?
--
-- 			'hrsh7th/cmp-cmdline',       --command line completion
-- 			'hrsh7th/cmp-path',          --filename completion
-- 		},
-- 	},
-- 	{ 'jose-elias-alvarez/null-ls.nvim' }, --formatting and linting
--
-- 	--fuzzy finder
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		branch = "0.1.x",
-- 		dependencies = { "nvim-lua/plenary.nvim" }
-- 	},
-- 	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
--
--
-- 	-- css colors
-- 	{
-- 		'brenoprata10/nvim-highlight-colors',
-- 		config = function()
-- 			require('nvim-highlight-colors').setup {}
-- 		end
-- 	},
--
-- 	--treesitter
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		dependencies = {
-- 			"nvim-treesitter/nvim-treesitter-textobjects",
-- 		},
-- 		build = ":TSUpdate",
-- 	},
-- 	"nvim-treesitter/playground",
--
--
-- 	--airline
-- 	"windwp/windline.nvim",
--
-- 	-- bufferline
-- 	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
--
-- 	--git integration
-- 	{
-- 		'lewis6991/gitsigns.nvim',
-- 		config = function()
-- 			require('gitsigns').setup()
-- 		end
-- 	},
--
-- 	--indentation guides
-- 	"lukas-reineke/indent-blankline.nvim",
--
--
-- 	"akinsho/toggleterm.nvim",
-- 	{
-- 		"windwp/nvim-autopairs",
-- 		config = function() require("nvim-autopairs").setup {} end
-- 	},
-- })
