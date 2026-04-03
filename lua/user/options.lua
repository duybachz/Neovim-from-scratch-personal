local opt = vim.opt

opt.number = true                           -- Set numbered lines
opt.relativenumber = true                   -- Set relative numbered lines
opt.cursorline = true                       -- Highlight the current line
opt.wrap = true                             -- Display lines as one long line, or true to wrap within screen
opt.scrolloff = 8                           -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8                       -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 2                             -- Insert 2 spaces for a tab
opt.shiftwidth = 2                          -- The number of spaces inserted for each indentation
opt.expandtab = true                        -- Convert tabs to spaces
opt.smartindent = true                      -- Make indenting smarter again
opt.autoindent = true                       -- Copy indent from current line

-- Search settings
opt.ignorecase = true                       -- Ignore case in search patterns
opt.smartcase = true                        -- Smart case
opt.hlsearch = true                         -- Highlight all matches on previous search pattern
opt.incsearch = true

-- Visual settings
opt.termguicolors = true                    -- Set term gui colors (most terminals support this)
opt.signcolumn = "yes"                      -- Always show the sign column, otherwise it would shift the text each time
opt.cmdheight = 1                           -- More space in the neovim command line for displaying messages
opt.showmode = false                        -- We don't need to see things like -- INSERT -- Anymore
opt.pumheight = 10                          -- Pop up menu height
opt.completeopt = { "menuone", "noselect" } -- Mostly just for cmp
opt.conceallevel = 0                        -- So that `` is visible in markdown files

-- File handling
opt.backup = false                          -- Creates a backup file
opt.writebackup = false                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.fileencoding = "utf-8"                  -- The encoding written to a file
opt.swapfile = false                        -- Creates a swapfile
opt.undofile = true                         -- Enable persistent undo
opt.updatetime = 300                        -- Faster completion (4000ms default)
opt.timeoutlen = 1000                       -- Time to wait for a mapped sequence to complete (in milliseconds)

-- Behavior settings
opt.clipboard = "unnamedplus"               -- Allows neovim to access the system clipboard
opt.mouse = "a"                             -- Allow the mouse to be used in neovim

-- Split bahaviors
opt.splitbelow = true                       -- Force all horizontal splits to go below current window
opt.splitright = true                       -- Force all vertical splits to go to the right of current window
opt.equalalways = true                      -- Make all windows the same size after splitting


-- Folding settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99                          -- Start with all folds open
opt.formatoptions = "jcroqlnt"              -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.showtabline = 2                         -- Always show tabs
opt.numberwidth = 4                         -- Set number column width to 2 {default 4}
opt.linebreak = true                        -- Companion to wrap, don't split words
opt.guifont = "monospace:h17"               -- The font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
