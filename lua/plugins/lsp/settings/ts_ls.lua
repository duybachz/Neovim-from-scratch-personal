return {
  init_options = {
    maxTsServerMemory = 8192,
    preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsWithInsertText = true,
    },
  },
  before_init = function(initialize_params, _)
    local root_uri = initialize_params.rootUri
      or (initialize_params.workspaceFolders
        and initialize_params.workspaceFolders[1]
        and initialize_params.workspaceFolders[1].uri)
    if not root_uri then return end

    local root = vim.uri_to_fname(root_uri)
    local local_lib = root .. "/node_modules/typescript/lib"
    if vim.fn.isdirectory(local_lib) == 1 then
      initialize_params.initializationOptions = initialize_params.initializationOptions or {}
      initialize_params.initializationOptions.tsserver = {
        path = local_lib .. "/tsserver.js",
      }
    end
  end,
  settings = {
    typescript = {
      preferences = { includeCompletionsForModuleExports = true },
      suggest = { autoImports = true },
    },
    javascript = {
      preferences = { includeCompletionsForModuleExports = true },
      suggest = { autoImports = true },
    },
  },
}
