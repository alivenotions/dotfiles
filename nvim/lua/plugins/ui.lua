return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                variant = "auto",
                saturation = 0.8,
                cache = true,
                borderless_pickers = true,
                overrides = function(c)
                    return {
                        CursorLine = { bg = c.bg },
                        CursorLineNr = { fg = c.magenta },
                        Comment = { fg = c.green, italic = true, bg = "NONE" },
                    }
                end,
            })

            vim.cmd("colorscheme cyberdream")
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {},
                lualine_b = { 'branch', 'diagnostics' },
                lualine_x = { 'encoding',
                    {
                        'filetype',
                        colored = true,
                        icon_only = true,
                    }
                },
            },
        },
    },

    -- File explorer
    'kyazdani42/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- ctrl-r on insert, " or @ on normal
    'junegunn/vim-peekaboo',

    -- maximize/minimize splits
    'szw/vim-maximizer',

    -- create ascii diagrams
    'jbyuki/venn.nvim',
}