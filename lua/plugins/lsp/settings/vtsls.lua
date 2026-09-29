-- Use the globally installed TypeScript (nvm on macOS, npm prefix on Linux);
-- vtsls falls back to its bundled version when none is found
local tsdk = vim.fn.glob(vim.env.HOME .. "/.nvm/versions/node/*/lib/node_modules/typescript/lib", false, true)
tsdk = tsdk[#tsdk]
if not tsdk then
  for _, path in ipairs({ "/usr/local/lib/node_modules/typescript/lib", "/usr/lib/node_modules/typescript/lib" }) do
    if vim.fn.isdirectory(path) == 1 then
      tsdk = path
      break
    end
  end
end

return {
  settings = {
    vtsls = {
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
      autoUseWorkspaceTsdk = true,
      tsdk = tsdk,
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
