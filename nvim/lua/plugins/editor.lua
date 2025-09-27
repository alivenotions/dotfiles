return {
    -- general
    'tpope/vim-sensible',
    'folke/todo-comments.nvim',
    'tpope/vim-surround',

    -- jump anywhere with leader j
    'pechorin/any-jump.vim',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'folke/flash.nvim',
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    -- Find all the errors and warning in the project
    {
        'folke/trouble.nvim',
        opts = {
            focus = true,   -- Focus trouble window when opened
            follow = true,  -- Follow the current cursor position
            restore = true, -- Restore window position when closing
            preview = {
                type = "split",
                relative = "win",
                position = "right",
                size = 0.3,
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xr",
                "<cmd>Trouble lsp_references toggle<cr>",
                desc = "LSP References (Trouble)",
            },
            {
                "<leader>xd",
                "<cmd>Trouble lsp_definitions toggle<cr>",
                desc = "LSP Definitions (Trouble)",
            },
        },
    },

    'justinmk/vim-sneak',

    -- better quick fix opening
    'yssl/QFEnter',

    'ntpeters/vim-better-whitespace',

    'chaoren/vim-wordmotion',

    'dmmulroy/ts-error-translator.nvim',

    'wakatime/vim-wakatime',
    'github/copilot.vim',

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require("telescope").load_extension("smart_open")
        end,
        dependencies = {
            "kkharji/sqlite.lua",
            -- Only required if using match_algorithm fzf
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },

    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            {
                "<leader>ut",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            }
        },
        opts = {
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    {
        "greggh/claude-code.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for git operations
        },
        config = function()
            require("claude-code").setup()
        end
    },

    -- Test runner with inline results
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- Test adapters
            "nvim-neotest/neotest-jest",
            "lawrence-laz/neotest-zig",
            "rcasia/neotest-java",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-jest"),
                    require("neotest-zig"),
                    require("neotest-java"),
                },
            })
        end,
        keys = {
            { "<leader>tn", function() require("neotest").run.run() end,                     desc = "Run nearest test" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Run file tests" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,              desc = "Toggle test summary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
        },
    }
}

