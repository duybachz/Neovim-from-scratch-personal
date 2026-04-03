return {
  {
    "benlubas/molten-nvim",
    -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 12
        vim.g.molten_cover_empty_lines = true
        vim.g.molten_virt_text_output = true
        vim.g.molten_auto_open_output = false
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_image_location = "virt"
        -- vim.g.molten_show_mimetype_debug = true

        -- Molten keymaps
        vim.keymap.set("n", "<leader>re", ":noautocmd MoltenEnterOutput<CR>", { desc="Enter output window", silent=true })
        vim.keymap.set("n", "<leader>rs", ":MoltenShowOutput<CR>", { desc="Show output window", silent=true })
        vim.keymap.set("n", "<leader>rI", ":MoltenInit<CR>", { desc = 'Initiate kernel', silent = true })
    end,
  },
}
