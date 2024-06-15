return {
  {
    "nvimtools/none-ls.nvim", -- for formatters and linters
    dependencies = {
      "nvimtools/none-ls-extras.nvim", -- Extra sources for nvimtools/none-ls.nvim
    },
    event = "VeryLazy",
    config = function ()
      local null_ls_status_ok, null_ls = pcall(require, "null-ls")
      if not null_ls_status_ok then
        return
      end

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        debug = false,
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
        sources = {
          formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
          formatting.black.with({ extra_args = { "--fast" } }),
          formatting.stylua,
          diagnostics.cppcheck.with({ extra_args = { "--enable=warning,style,performance,portability", "--template=gcc", "$FILENAME" } }),
          require("none-ls.diagnostics.flake8"),
          -- formatting.yapf,
          -- diagnostics.flake8,
        },
      })
    end
  }
}
