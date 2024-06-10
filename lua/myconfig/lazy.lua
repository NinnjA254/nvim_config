local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('myconfig.plugins', {
    change_detection = {
	-- automatically check for config file changes and reload the ui
	enabled = true,
	notify = false, -- get a notification when changes are found
    },
})
-- require("lazy").setup({
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
--
--
-- 	--indentation guides
-- 	"lukas-reineke/indent-blankline.nvim",
--
-- 	--gcc to comment
-- 	{
-- 		'numToStr/Comment.nvim',
-- 		opts = {
-- 			-- add any options here
-- 		},
-- 		lazy = false,
-- 	},
-- 	{
-- 		"windwp/nvim-autopairs",
-- 		config = function() require("nvim-autopairs").setup {} end
-- 	},
-- })
