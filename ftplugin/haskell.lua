-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

local function with_desc(desc)
  return vim.tbl_extend('force', opts, { desc = desc })
end

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>zl', vim.lsp.codelens.run, with_desc("Haskell: Codelens"))

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<space>zs', ht.hoogle.hoogle_signature, with_desc('Haskell: Type signature'))

-- Evaluate all code snippets
vim.keymap.set('n', '<space>za', ht.lsp.buf_eval_all, with_desc('Haskell: Evaluate all code snippets'))

-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>zr', ht.repl.toggle, with_desc('Haskell: Toggle GHCi repl for package'))

-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>zf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, with_desc('Haskell: Toggle GHCi repl for buffer'))

vim.keymap.set('n', '<leader>zq', ht.repl.quit, with_desc('Haskell: Quit GHCi repl'))
vim.keymap.set('n', '<space>zd', '<Plug>HaskellHoverAction')
