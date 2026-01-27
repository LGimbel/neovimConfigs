return {{
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
}, {
    'machakann/vim-highlightedyank',
    config = function()
        vim.g.highlightedyank_enable_highlight = 1
        vim.g.highlightedyank_highlight_duration = 300
    end
}, {
    'kylechui/nvim-surround',
    version = "*",
    event = "VeryLazy",
    config = function()
        require('nvim-surround').setup({})
    end
}, {
    'tpope/vim-commentary',
    event = 'VeryLazy'
}, {
    'nvim-treesitter/nvim-treesitter',
    commit = 'v0.9.2',
    build = ':TSUpdate'
}, {
    'tpope/vim-repeat',
    event = 'VeryLazy'
}, {
    'wellle/targets.vim',
    event = 'VeryLazy',
    config = function()
        vim.g.targets_quotes = ''
    end
}, {
    'gbprod/substitute.nvim',
    event = 'VeryLazy',
    config = function()
        require('substitute').setup()
        vim.keymap.set('n', 's', require('substitute').operator, {
            noremap = true
        })
        vim.keymap.set('n', 'ss', require('substitute').line, {
            noremap = true
        })
        vim.keymap.set('x', 's', require('substitute').visual, {
            noremap = true
        })
    end
}, {
    'nvim-treesitter/nvim-treesitter-textobjects',
    commit = 'v0.0.2',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {'go', 'lua', 'python', 'rust', 'html'},
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner'
                    }
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ['<leader><Down>'] = '@function.outer',
                        [']]'] = '@class.outer'
                    },
                    goto_previous_start = {
                        ['<leader><Up>'] = '@function.outer',
                        ['[['] = '@class.outer'
                    }
                }
            }
        })
    end
}}
