return {
  {
    -- https://github.com/nvim-java/nvim-java
    'nvim-java/nvim-java',
    ft = 'java',
    config = false,
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        opts = {
          servers = {
            jdtls = {
              -- Your custom jdtls settings go here
            },
          },
          setup = {
            jdtls = function ()
              require('java').setup({
                -- Your custom nvim-java configuration goes here
              })
            end,
          }
        }
      }
    }
  }
}
