return {
  settings = {
    vtsls = {
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
      autoUseWorkspaceTsdk = true,
      tsdk = "/Users/bachvu7723/.nvm/versions/node/v24.13.1/lib/node_modules/typescript/lib",
    },
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
      preferences = { includeCompletionsForModuleExports = true },
      suggest = { autoImports = true },
    },
    javascript = {
      preferences = { includeCompletionsForModuleExports = true },
      suggest = { autoImports = true },
    },
  },
}
