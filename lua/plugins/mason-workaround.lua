-- Due to nvim-java not being compatible with Mason 2.0, this workaround is needed
-- Link to issue: https://github.com/nvim-java/nvim-java/issues/384

return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
