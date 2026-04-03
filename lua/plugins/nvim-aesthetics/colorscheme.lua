return {
  -- Colorschemes & Aesthetics
  {
    "folke/tokyonight.nvim",
    lazy = false,
  },
  {
    "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
    lazy = false,
  },
  {
    "lunarvim/darkplus.nvim", -- Colorscheme
    lazy = false,
  },
  {
    "xiyaowong/transparent.nvim"
  },
  {
    "rebelot/kanagawa.nvim", -- Colorscheme
    lazy = false,
    config = function ()
      local status, kanagawa = pcall(require, "kanagawa")
      if not status then
        return
      end

      kanagawa.setup({
        transparent = true,
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              }
            }
          }
        }
      })

      local colorscheme = "kanagawa-dragon"

      -- Settting local variable status_ok; do protected call with vim.cmd
      -- .. for concatenate
      -- If you don't need the return value; use underscore
      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        return
      end
      vim.cmd 'highlight TelescopeBorder guibg=none'
      vim.cmd 'highlight TelescopeTitle guibg=none'
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "NONE" })
    end,
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        TabLine = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      }
    end,
  },
}
