require("myconfig.set")
require("myconfig.lazy")
require("myconfig.remap")
require("myconfig.colorscheme") --put this at the top because other config files and plugins configure appearance, colorscheme shouldn't overwrite those small local changes.(it will run first then the local changes will run)
require("myconfig.plugin_config.treesitter")
require("myconfig.plugin_config.toggleterm")
require("myconfig.plugin_config.nvim-tree")
require("myconfig.plugin_config.windline")
require("myconfig.plugin_config.gitsigns")
require("myconfig.plugin_config.bufferline")
require("myconfig.plugin_config.lspconfig")
require("myconfig.plugin_config.telescope")
