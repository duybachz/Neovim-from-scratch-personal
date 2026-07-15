return {
  {
    "neovim/nvim-lspconfig", -- enable LSP
    -- event = "VeryLazy",
    config = function ()
      require("plugins.lsp.handlers.handlers").setup()
    end
  },
  {
    "williamboman/mason.nvim", -- simple to  language server installer
    -- event = "VeryLazy",
    dependencies = {
      -- Auto-install LSPs, linters, formatters, debuggers (For Java)
      "WhoIsSethDaniel/mason-tool-installer.nvim",
       -- closes some gaps that exist between mason.nvim and null-ls
      "jay-babu/mason-null-ls.nvim",
       -- simple to use language server installer
      "williamboman/mason-lspconfig.nvim",
    },
    opts = function ()
      local servers = {
        -- Java
        -- "jdtls",
        "gradle_ls",
        "groovyls",

        -- Lua
        "lua_ls",

        -- CSS
        "cssls",

        -- HTML
        "html",

        -- Javascript
        "vtsls",

        -- Python
        "pyright",

        -- Bash
        "bashls",

        -- JSON
        "jsonls",

        -- C
        "clangd",

        -- C#
        "csharp_ls",

        -- YAML
        "yamlls",

        -- CMake
        "cmake",

        -- Tailwind CSS
        "tailwindcss",

        -- latex
        "texlab@v5.23.1",

        -- sql
        "sqlls",

        -- swiftf
        -- "sourcekit",

        --ltex-ls
        "ltex",
      }

      local settings = {
        ui = {
          border = "none",
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
        registries = {
          'github:nvim-java/mason-registry',
          'github:mason-org/mason-registry',
        },
      }

      require("mason").setup(settings)
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = true,
      })
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
      })

      -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
      vim.api.nvim_command('MasonToolsInstall')

      for _, server in pairs(servers) do
        local opts = {
          on_attach = require("plugins.lsp.handlers.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers.handlers").capabilities,
        }

        server = vim.split(server, "@")[1]

        if server ~= 'jdtls' then
          local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
          if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
          end

          vim.lsp.config(server, opts)
        end
      end
    end
  },
}
