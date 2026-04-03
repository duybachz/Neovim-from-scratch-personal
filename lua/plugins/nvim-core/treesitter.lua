return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    dependencies = {
      "OXY2DEV/markview.nvim",
    },
    config = function ()
      local status, nvim_treesitter = pcall(require, "nvim-treesitter")
      if not status then
        return
      end

      nvim_treesitter.install({
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "python",
        "latex",
      })
    end
  }
}
