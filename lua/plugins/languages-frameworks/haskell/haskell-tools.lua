return {
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      local handlers = require("plugins.lsp.handlers.handlers")
      vim.g.haskell_tools = {
        hls = {
          on_attach = handlers.on_attach
        }
      }
    end
  },
}
