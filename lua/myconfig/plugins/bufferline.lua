return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
	options = {
	    -- diagnostics = false | "nvim_lsp" | "coc",
	    -- diagnostics_update_in_insert = false,
	    -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
	    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
	    --     return "("..count..")"
	    -- end,
	    themable = true,
	    separator_style = "slope",
	    numbers = 'buffer_id',
	    show_buffer_close_icons = false,
	    show_close_icon = false,
	    offsets = {
		{
		    filetype = "NvimTree",
		    text = "File Explorer",
		    text_align = "left",
		    -- highlight = "Directory",
		    separator = "│  ",
		    -- separator = true --default separator
		}
	    },
	},
    },
    config = function(_, opts)
	require('bufferline').setup(opts)
	vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")
	vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>")
    end,
}
