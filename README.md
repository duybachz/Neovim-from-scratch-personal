# Bich's Neovim Config
## Introduction
This Neovim config is forked from [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) with a few changes made, namely:
* Config is now based on [lazy.nvim](https://github.com/folke/lazy.nvim)  instead of [packer.nvim](https://github.com/wbthomason/packer.nvim), which has been unmaintained since late 2023
* Added language-specific features via plugins for `Typescript`, `Java`, `HTML`, etc.
* Added support for running & managing various test suites via [neotest](https://github.com/nvim-neotest/neotest)
* Various quality-of-life improvements (E.g. [harpoon](https://github.com/ThePrimeagen/harpoon), [barbecue](https://github.com/utilyre/barbecue.nvim), [trouble.nvim](https://github.com/folke/trouble.nvim))

Big thanks to the GOATs [tpope](https://github.com/tpope) and [folke](https://github.com/folke), along with countless other contributors in the Neovim community.

## Plugins structuring
* `cmp` for auto-completion plugins
* `lsp` for language servers and related configuration
* `dap` for debuggers and `neotest` configuration
* `nvim-aesthetics` for colorschemes and aesthetics-related plugins
* `nvim-core` for essential plugins that other plugins depend on (E.g. [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)) or provide essential functionality (E.g. [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua))
* `nvim-interface` for plugins that extend the interface and provide additional functionality of Neovim

## LSP
* Default client configurations provided for various LSP servers provided through [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [mason.nvim](https://github.com/mason-org/mason.nvim) provides easier management of LSP servers, linters, formatters and DAPs
* To add new LSP server:
    + **Through Mason:** Install your plugin through Mason
    + **Additionally**, to ensure the server is installed, add LSP server name to `servers` table within `lsp.lua`
* LSP server for `Java` is not set up through `lsp.lua` but through [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
* Hence, the loop to attach handlers to each LSP server and set them up omits `jdtls`

## DAP
* [nvim-dap](https://github.com/mfussenegger/nvim-dap) provides a Debug Adapter Protocol client implementation for Neovim; while [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) provides an UI for [nvim-dap](https://github.com/mfussenegger/nvim-dap)
* [neotest](https://github.com/nvim-neotest/neotest) provides support for various test suites, including `JUnit 5`, `Jest` and `Pytest`
* To add a new DAP:
    + **Install through Mason:** Install the DAP through Mason
    + **Add the debug configuration in `debug.lua`**
* To add support for a new test suite:
    + **Find the required Neotest adapter on GitHub**
    + **Install in `neotest.lua` as normal lua plugin**
 
## Uninstallation
In the event that a clean re-installation is needed; remove `neovim` using `brew` or whichever package manager you are using, along with these following directories:
* `~/.config/nvim` (Make sure your desired config is backed up)
* `~/.local/share/nvim`
* `~/.local/state/nvim`

> [!info]
> To add settings, filetypes or other attributes to the setup of each LSP server, add a `.lua` file with the same name as the LSP server to `lsp/settings`. This file should return the desired attributes in a table. 
> Furthermore, add the LSP server to the exclude list in the `automatic_enable` attribute of `nvim-lspconfig` to prevent override.

## Notes
* There is an additional directory of plugins `plugins-vscode` specifically for plugins to be used in VSCode via [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim)
