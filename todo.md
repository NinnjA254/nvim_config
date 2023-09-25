* combine codicons with kind_icons to make one set of preferred completion icons

* understand and configure vim.diagnostic 

* configure the telescope UI to appear more based and redpilled.(preview window on the side sometimes makes matched stuff overflow and be hidden. eg. diagnostics and any other really long matches)

* look into live_grep args

* try biome lsp(is it an lsp?)
  
* configure gitsigns

* this snippet that checks if a plugin is installed before configuring it: 
    ```
    local status, bufferline = pcall(require, "bufferline")
    if not status then
        print("ERROR bufferline")
        return
    end
    ```
    Perhaps add it to all plugin configs?

* some icons do not show, figure out why. (nerdfonts??)

* learn the windline api and how to make a custom airline, then make some cool airlines

* properly understand treesitter and what it can do
