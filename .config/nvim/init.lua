-- Use system clipboard for all operations
vim.opt.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Tabs & indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Split windows behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable true colors (for modern themes)
vim.opt.termguicolors = true

-- Some basic UI improvements
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- ==========
-- Mappings
-- ==========
-- Set leader key
vim.g.mapleader = " "

-- Helper for mapping keys
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Detect if running in VSCode
local is_vscode = vim.g.vscode == 1

local comment_cmd = is_vscode and '<Cmd>call VSCodeNotify("editor.action.commentLine")<CR>' or ':Commentary<CR>'

-- ======================
-- Visual Mode Mappings
-- ======================
map('v', '<Leader>c', comment_cmd, opts)

-- Indent / Outdent lines
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- ======================
-- Insert Mode Mappings
-- ======================
map('i', 'jj', '<ESC>', opts)
map('i', 'jk', '<ESC>:w<CR>', opts)

-- ======================
-- Normal Mode Mappings
-- ======================
-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- VSCode-specific commands
if is_vscode then
    map('n', '<Leader>p', '<Cmd>call VSCodeNotify("workbench.action.showCommands")<CR>', opts)
    map('n', '<Leader>s', '<Cmd>call VSCodeNotify("workbench.action.gotoSymbol")<CR>', opts)
    map('n', '<Leader>f', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', opts)
    map('n', '<Leader>q', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)
    map('n', '<Leader>Q', '<Cmd>call VSCodeNotify("workbench.action.closeAllEditors")<CR>', opts)
    map('n', '<Leader>w', '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>', opts)
    map('n', '<Leader>W', '<Cmd>call VSCodeNotify("workbench.action.files.saveAll")<CR>', opts)
    map('n', '<Leader>zc', '<Cmd>call VSCodeNotify("editor.foldLevel2")<CR>', opts)
    map('n', '<Leader>zo', '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', opts)
else
    -- Native Neovim equivalents
    map('n', '<Leader>p', ':Telescope commands<CR>', opts)
    map('n', '<Leader>s', ':Telescope lsp_document_symbols<CR>', opts)
    map('n', '<Leader>f', ':Telescope find_files<CR>', opts)
    map('n', '<Leader>q', ':bd<CR>', opts)
    map('n', '<Leader>Q', ':bufdo bd<CR>', opts)
    map('n', '<Leader>w', ':w<CR>', opts)
    map('n', '<Leader>W', ':wa<CR>', opts)
    map('n', '<Leader>zc', ':foldclose<CR>', opts)
    map('n', '<Leader>zo', ':foldopen<CR>', opts)
end

-- Comment
map('n', '<Leader>c', comment_cmd, opts)

-- Cursor movement
map('n', 'J', '10j', opts)
map('n', 'K', '10k', opts)
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)

-- Other
map('n', '<Leader>j', 'J', opts)
map('n', '<Leader>r', '*cgN', opts)
map('n', '<Leader>a', 'ggVG', opts)
