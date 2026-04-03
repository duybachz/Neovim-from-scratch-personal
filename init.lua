if vim.g.vscode then
  -- VSCode extension
  require "user.plugins"
  require "user.keymaps-vscode"
  require "user.options"
  vim.cmd[[source $HOME/.config/nvim/vscode/settings.vim]]

  -- Options
  -- vim.opt.clipboard = "unnamedplus"
else
  -- Neovim
  require "user.options"
  require "user.keymaps"
  require "user.plugins"
end

-- Highlighting and indentation are now managed by the built-in `treesitter`
-- of NeoVim v0.12 and later
local installed_parsers = require('nvim-treesitter').get_installed()
vim.api.nvim_create_autocmd('FileType', {
  pattern = installed_parsers,
  callback = function() 
    -- Highlighting
    pcall(vim.treesitter.start)

    -- indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
