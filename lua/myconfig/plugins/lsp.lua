-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		-- vim.keymap.set('n', 'P', vim.lsp.buf.format)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	end
})

local function default_handler(server_name)
	require("lspconfig")[server_name].setup {}
end

local function luals_handler()
	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup {
		settings = {
			Lua = {
				runtime = { version = "Lua 5.1" },
				diagnostics = {
					globals = { "vim", "it", "describe", "before_each", "after_each" },
				}
			}
		}
	}
end

--diagnostics
vim.diagnostic.config({
	float = {
		border = 'rounded',
		severity_sort = true,
		header = "deez diagnostics"
	},
})
local function sign_define(args)
	vim.fn.sign_define(args.name, {
		texthl = args.name,
		text = args.text,
		numhl = ''
	})
end

sign_define({ name = 'DiagnosticSignError', text = '✘' })
sign_define({ name = 'DiagnosticSignError', text = '' })
sign_define({ name = 'DiagnosticSignWarn', text = '' })
sign_define({ name = 'DiagnosticSignHint', text = '' })
sign_define({ name = 'DiagnosticSignInfo', text = '' })

--documentation window
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)

--signature help
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)


return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			handlers = {
				default_handler,
				["lua_ls"] = luals_handler,
			}
		})

		--completion
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		require('luasnip.loaders.from_vscode').lazy_load()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true,
			},
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				-- ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item(cmp_select)
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(cmp_select)
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
				-- ['<C-d>'] = cmp.mapping.scroll_docs(-4), --do I really need these? investigate
				-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
			})
		})

		--commandline autocomplete
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			view = {
				entries = { name = "custom" }
			},
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			}),
		})
		local search_cmp = {
			mapping = cmp.mapping.preset.cmdline(),
			view = {
				entries = { name = "custom" }
			},
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'buffer' }
			}),
		}
		cmp.setup.cmdline('/', search_cmp)
		cmp.setup.cmdline('?', search_cmp)
	end
}
