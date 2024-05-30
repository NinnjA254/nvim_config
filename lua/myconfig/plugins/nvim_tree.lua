local on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    --custom mappings
    vim.keymap.set('n', '<leader>vs', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<leader>sp', api.node.open.horizontal, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<leader>cd', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
end

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    opts = {	
	on_attach = on_attach,
	sync_root_with_cwd = true,
	view = {
	    width = {}, -- passing a table does adaptive width
	},
	renderer = {
	    root_folder_label = ":t",
	    group_empty = true,
	    icons = {
		modified_placement = "signcolumn",
		git_placement = "before",
		show = {
		    folder_arrow = false,
		},
		glyphs = {
		    modified = "!",
		},
	    },
	    indent_width = 2,
	    indent_markers = {
		enable = true,
		inline_arrows = true,
		icons = {
		    -- 
		    corner = "└",
		    edge = "",
		    item = "",
		    none = " ",
		},
	    },
	},
	update_focused_file = {
	    enable = true,

	},
	modified = {
	    enable = true,
	},
	filters = {
	    git_ignored = false,
	    -- custom = {}, --could use this to ignore node modules and others?
	},
	actions = {
	    change_dir = {
		restrict_above_cwd = true, -- disable if want to navigate outside the project
	    },
	},
    },
    config = function(_, opts)
	require("nvim-tree").setup(opts) 
	vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>')
	vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
    end,
}
