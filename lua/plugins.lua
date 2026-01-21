return {
    {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
},
    {
        'machakann/vim-highlightedyank',
        config = function()
            vim.g.highlightedyank_enable_highlight = 1
            vim.g.highlightedyank_highlight_duration = 300
        end
    }, 
    {
        'kylechui/nvim-surround',
        version = "*",
        event = "VeryLazy",
        config = function()
            require('nvim-surround').setup({})
        end
    },
    {
    'tpope/vim-commentary',
    event = 'VeryLazy',
    },
     {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "go", "lua", "python", "rust", "html"},
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["<leader>n"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_previous_start = {
              ["<leader>b"] = "@function.outer",
              ["[["] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
