vim.opt.termguicolors = true --redundant? already set in set.
-- require("bufferline").setup({})
local status, bufferline = pcall(require, "bufferline")
if not status then
	print("ERROR bufferline")
	return
end

bufferline.setup({
	highlights = {
		fill = {},
		background = {},
		tab_selected = {},
		buffer_selected = { italic = false, },
		diagnostic_selected = { italic = false },
		hint_selected = { italic = false },
		pick_selected = { italic = false },
		pick_visible = { italic = false },
		pick = { italic = false },
	},

	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true
			}
		},
		indicator = {
			icon = "▎",
			style = "icon",
		},
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- numbers = "ordinal",
		max_name_length = 15,
		max_prefix_length = 6,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = nil, --no diagnostics icons
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		persist_buffer_sort = true,
		enforce_regular_tabs = true,
	},
})
