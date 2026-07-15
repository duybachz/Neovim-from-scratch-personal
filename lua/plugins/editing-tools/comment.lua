return {
  {
    "numToStr/Comment.nvim", -- Easily comment stuff
    event = "VeryLazy",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    setup = function ()
      local status, tsCommentString = pcall(require, 'ts_context_commentstring')
      if not status then
        return
      end

      tsCommentString.setup({
        enable_autocmd = false,
      })

      local status2, comment = pcall(require, 'Comment')
      if not status2 then
        return
      end

      comment.setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  }
}
