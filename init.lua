-- Set leader key to 'h'
vim.g.mapleader = 'h'

-- Enable line numbers and relative line numbers (vim.smartRelativeLine: true)
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable showing commands on the status bar (vim.otherSettings: { "showcmd": true })
vim.opt.showcmd = true


local function set_keymaps()

      vim.opt.signcolumn = "yes"
  -- arrow keys no suck
      vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Up>', { noremap = true, silent = true })
      vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Down>', { noremap = true, silent = true })
      vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Left>', { noremap = true, silent = true })
      vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Right>', { noremap = true, silent = true })
    -- index end and home
      vim.keymap.set('o', 'U', '^', { remap = true, desc = 'Move to start of line' })
      vim.keymap.set('o', 'H', '$', { remap = true, desc = 'Move to end of line' })

    -- P past last yank not last delete
    vim.keymap.set('n', 'P', '"0p', { noremap = true, desc = 'Paste from clipboard register' })

    -- Leader m to :marks (List Marks)
    vim.keymap.set('n', '<leader>m', ':marks<CR>', { noremap = true, desc = 'List Marks' })

    -- Mark/Jump Mappings
    vim.keymap.set('n', 'l', "'", { noremap = true, desc = 'Jump to last cursor position' })
    vim.keymap.set('n', 'le', "'.", { noremap = true, desc = 'Jump to last change' })
    vim.keymap.set('n', 'lr', "''", { noremap = true, desc = 'Jump to beginning of line of last position' })
    vim.keymap.set('n', 'lj', ':ju<CR>', { noremap = true, desc = 'Jump to latest location' })
    vim.keymap.set('n', 'lda', ':delm!<CR>', { noremap = true, desc = 'Delete All Marks' })

    -- 'b' to '%' (Match parenthesis/brace)
    vim.keymap.set('n', 'b', '%', { remap = true, desc = 'Match parenthesis' })
    vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, noremap = true, desc = "Clear Search Highlight" })

    -- Insert newline below without entering insert mode
    vim.keymap.set('n', 'O', 'o<Esc>', { noremap = true, desc = 'Insert newline below without entering insert mode' })


    -- Load the VSCode API if running inside the extension
    local is_vscode = vim.g.vscode
    if is_vscode then
        local vscode = require('vscode')

        -- Leader key mappings for VS Code commands
        vim.keymap.set('n', '<leader>p', function() vscode.action('workbench.action.quickOpen') end, { silent = true, desc = 'Quick Open' })
        vim.keymap.set('n', '<leader>t', function() vscode.action('workbench.action.terminal.toggleTerminal') end, { silent = true, desc = 'Toggle Terminal' })
        vim.keymap.set('n', '<leader>e', function() vscode.action('editor.action.marker.next') end, { silent = true, desc = 'Next Error/Marker' })
        vim.keymap.set('n', '<leader>g', function() vscode.action('editor.action.revealDefinition') end, { desc = 'Go to Definition' })
        vim.keymap.set('n', '<leader>f', function() vscode.action('editor.action.formatDocument') end, { desc = 'Format Document' })
        vim.keymap.set('n', '<leader>l', function() vscode.action('workbench.action.toggleSidebarVisibility') end, { desc = 'Toggle Sidebar' })
        vim.keymap.set('n', '<leader>d', function() vscode.action('workbench.action.nextEditor') end, { desc = 'Next Tab' })
        vim.keymap.set('n', '<leader>D', function() vscode.action('workbench.action.previousEditor') end, { desc = 'Previous Tab' })
        vim.keymap.set('n', '<leader>i', function() vscode.action('editor.action.showHover') end, { desc = 'Show Hover' })
        vim.keymap.set('n', '<leader>w', function() vscode.action('workbench.action.closeActiveEditor') end, { desc = 'Close Active Editor' })
        vim.keymap.set('n', '<leader>s', function() vscode.action('workbench.action.findInFiles') end, { desc = 'Search in Files' })
        vim.keymap.set('n', '<leader>R', function() vscode.action('references-view.findReferences') end, { desc = 'Find References' })
        vim.keymap.set('n', '<leader>r', function() vscode.action('editor.action.referenceSearch.trigger') end, { desc = 'peek References' })
        vim.keymap.set('n', '<leader>b', function() vscode.action('workbench.action.navigateBack') end, { desc = 'LSP unjump' })
        vim.keymap.set('n', '<leader>m', function() vscode.action('workbench.action.navigateForward') end, { desc = 'LSP rejump' })
        vim.keymap.set('n', '<leader>zz', function() vscode.action('workbench.action.toggleZenMode') end, { desc = 'Toggle Zen Mode' })
        vim.keymap.set('n', '<leader>c', function() vscode.action('editor.showCallHierarchy') end, { desc = 'Peek Call Hierarchy' })
      -- clear window
        vim.keymap.set('n', '<space>c', function()
           vscode.action('workbench.action.closeAuxiliaryBar')
           vscode.action('workbench.action.closeSidebar')
         end, { desc = 'Close all extra windows' })
    end
end
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim and load the plugins
require("lazy").setup("plugins", {
    -- Automatically install missing plugins on startup
    checker = { enabled = true, notify = false },
    -- Automatically check for plugin updates
    change_detection = {
        enabled = true,
        notify = false,
    },
})
set_keymaps()