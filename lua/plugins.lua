return {{
    'smoka7/hop.nvim',
    version = "*",
    config = function()
        local hop = require('hop')
        hop.setup({
            keys = 'etovxqpdygfblzhckisuran'
        })

        -- Keymaps moved here
        vim.keymap.set('n', '<leader>hw', function()
            hop.hint_words()
        end, {
            desc = 'Hop to Word'
        })
        vim.keymap.set('n', '<leader>hl', function()
            hop.hint_lines_skip_whitespace()
        end, {
            desc = 'Hop to Line'
        })
        vim.keymap.set('n', '<leader>hc', function()
            hop.hint_char2()
        end, {
            desc = 'Hop to Character'
        })
        vim.keymap.set('n', '<leader>/', function()
            hop.hint_patterns()
        end, {
            desc = 'Hop to Pattern'
        })
    end
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
    branch = 'main', -- Use the rewrite branch
    build = ':TSUpdate',
    config = function()
        -- Note: 'configs' (plural) is gone. Use 'config' (singular)
        require('nvim-treesitter.config').setup({
            ensure_installed = {'go', 'lua', 'python', 'rust', 'html'},
            highlight = {
                enable = true
            }
        })
    end
}, {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main', -- Must also use the main branch for compatibility
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function()
        require('nvim-treesitter-textobjects').setup({
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
        })
    end
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
        -- Keybindings for substitution
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
}}
