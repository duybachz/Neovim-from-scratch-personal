return {
    {
    'iamcco/markdown-preview.nvim',
    event = "VeryLazy",
    build = 'cd app && yarn install',
    init = function ()
      vim.g.mkdp_theme = 'light'
    end
  },
}
