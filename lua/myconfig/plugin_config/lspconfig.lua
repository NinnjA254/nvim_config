-- [[ Configure LSP ]]

local on_attach = function(client, bufnr) --  This function gets run when an LSP connects to a particular buffer.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  nmap('K', vim.lsp.buf.hover)
  -- vim.keymap.set('n', 'P', vim.lsp.buf.format)
  nmap('gd', vim.lsp.buf.definition)
  nmap('gi', vim.lsp.buf.implementation)
  nmap('<leader>dj', vim.diagnostic.goto_next, 'Diagnostic next')
  nmap('<leader>df', vim.diagnostic.open_float, 'Diagnostic Float')
  nmap('<leader>dk', vim.diagnostic.goto_prev, 'Diagnostic prev')
  nmap('<leader>r', vim.lsp.buf.rename)
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition') --terrible keybinding?
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.format()
  --   end
  -- })

  if client.name == "tsserver" then --prettier seems to work without this. odd
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      -- settings = servers[server_name],
    }
  end,
}

-- nvim-cmp
local kind_icons = { --code icons from nvim-cmp docs. They seem kinda cool
  Text = "  ",
  Method = "󰆧  ",
  Function = "󰊕  ",
  Constructor = "  ",
  Field = "󰇽  ",
  Variable = "󰂡  ",
  Class = "󰠱  ",
  Interface = "  ",
  Module = "  ",
  Property = "󰜢  ",
  Unit = "  ",
  Value = "󰎠  ",
  Enum = "  ",
  Keyword = "󰌋  ",
  Snippet = "  ",
  Color = "󰏘  ",
  File = "󰈙  ",
  Reference = "  ",
  Folder = "󰉋  ",
  EnumMember = "  ",
  Constant = "󰏿  ",
  Struct = "  ",
  Event = "  ",
  Operator = "󰆕  ",
  TypeParameter = "󰅲  ",
}
local codicons = { --vs code completion icons, requires codicons.ttf(font with the vs code codicons)?
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true
  },
  formatting = {
    fields = { "abbr", "kind", "menu" }, --change the order of these to change their order in the completion UI
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s  ', vim_item.kind, codicons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "(Buffer)",
        nvim_lsp = "(LSP)",
        luasnip = "(LuaSnip)",
        nvim_lua = "(Lua)",
        latex_symbols = "(LaTeX)",
        Snippet = '(snip)',
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  view = {
    entries = { name = "wildmenu", separator = '|' }
  },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
})

--null-ls
local null_ls = require('null-ls')
-- formatting sources
local formatting = null_ls.builtins.formatting
-- register any number of sources simultaneously
local sources = {
  formatting.prettier.with({ extra_args = { "--single-quote" } }),
}
null_ls.setup({ sources = sources })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
