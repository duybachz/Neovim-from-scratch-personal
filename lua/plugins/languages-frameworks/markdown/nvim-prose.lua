return {
  {
    'skwee357/nvim-prose',
    ft = {'markdown', 'txt'},
    config = function ()
      local _, prose = pcall(require, 'nvim-prose')
      if not _ then
        return
      end

      prose.setup{
        wpm = 200.0,
        filetypes = { 'markdown', 'asciidoc' },
        placeholders = {
            words = 'words',
            minutes = 'min'
        }
      }
    end
  }
}
