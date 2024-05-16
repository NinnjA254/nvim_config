local config = function(_, opts)
    local tt = require('toggleterm')
    tt.setup(opts)
    local trim_spaces = false
    vim.keymap.set("v", "<leader>s", function()
	tt.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
    end)
end

return {
  'akinsho/toggleterm.nvim',
  version = "v2.*",
  opts = {
      open_mapping = '<F9>',
      shade_terminals = false,
      hide_numbers = false,
      autochdir = true,
      auto_scroll = true,
      -- persist_mode = true,
      on_open = function() --sketchy stuff👇
	  vim.opt_local.statusline = "%17.(Terminal[%{b:toggle_number}]%) ---> %#termcursor#In your Mainframe fr fr no cap%#termcursornc#"
      end,
  },
  config = config,
}
--print(vim.loop.os_uname().sysname)
