return {
  -- Import core plugins
  {import = "plugins.nvim-core"},
  {import = "plugins.nvim-interface"},
  {import = "plugins.nvim-aesthetics"},

  -- Import LSP & DAP plugins
  {import = "plugins.cmp"},
  {import = "plugins.dap"},
  {import = "plugins.lsp"},
  {import = "plugins.null-ls"},

  -- Import general editing plugins
  {import = "plugins.editing-tools"},

  -- Import language specific plugins
  {import = "plugins.languages-frameworks.html-css"},
  {import = "plugins.languages-frameworks.typescript"},
  {import = "plugins.languages-frameworks.tailwind"},
  {import = "plugins.languages-frameworks.java"},
  {import = "plugins.languages-frameworks.sql"},
  {import = "plugins.languages-frameworks.latex"},
  {import = "plugins.languages-frameworks.markdown"},
}
