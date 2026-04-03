return {
  {
    "GCBallesteros/jupytext.nvim",
    -- ft = { "ipynb" },
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
  },
  { "jmbuhr/otter.nvim", ft = { "markdown", "quarto", "norg" } },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "nvim-lspconfig",
      "nvimtools/hydra.nvim",
      "otter.nvim",
    },
    ft = { "quarto", "markdown", "norg" },
    config = function()
      local quarto = require("quarto")
      quarto.setup({
        lspFeatures = {
          languages = { "python", "rust", "lua" },
          chunks = "all", -- 'curly' or 'all'
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = "K",
          definition = "gd",
          rename = "<leader>rn",
          references = "gr",
          format = "<leader>gf",
        },
        codeRunner = {
          enabled = true,
          ft_runners = {
            bash = "slime",
          },
          default_method = "molten",
        },
      })

      -- Keymaps
      -- Quarto integration with molten.nvim
      local runner = require("quarto.runner")
      vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "Run cell", silent = true })
      vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "Run cell and above", silent = true })
      vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "Run all cells", silent = true })
      vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "Run line", silent = true })
      vim.keymap.set("v", "<localleader>rv",  runner.run_range, { desc = "Run visual range", silent = true })
      vim.keymap.set("n", "<localleader>rA", function()
        runner.run_all(true)
      end, { desc = "Run all cells of all languages", silent = true })

      vim.keymap.set("n", "<localleader>rp", quarto.quartoPreview,
        { desc = "Preview the Quarto document", silent = true, noremap = true })

      -- to create a cell in insert mode, I have the ` snippet
      vim.keymap.set(
        "n",
        "<localleader>ri",
        "i```python<c-j>```<esc>ko",
        { desc = "Create a new code cell", silent = true }
      )
      vim.keymap.set(
        "n",
        "<localleader>rs",
        "i```\r\r```{}<left>",
        { desc = "Split code cell", silent = true, noremap = true }
      )

      vim.keymap.set(
        "n",
        "<localleader>rq",
        ":QuartoActivate<CR>",
        { desc = 'Activate Quarto', silent = true, noremap = true }
      )

      -- Open Molten image output
      vim.keymap.set(
        "n",
        "<localleader>rP",
        ":MoltenImagePopup<CR>",
        { desc = 'Image popout', silent = true, noremap = true }
      )

      -- for more keybinds that I would use in a quarto document, see the configuration for molten
      -- require("benlubas.hydra.notebook")
    end,
  },
}
