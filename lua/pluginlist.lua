return {
    -- main dependencies
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "kyazdani42/nvim-web-devicons",
    "anuvyklack/middleclass",

    -- luasnip
    "l3mon4d3/luasnip",

    -- cmp
    "hrsh7th/nvim-cmp",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "folke/neodev.nvim",

    -- null-ls
    "jose-elias-alvarez/null-ls.nvim",

    -- autopairs
    "windwp/nvim-autopairs",

    -- peek definition
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup {}
        end
    },

    -- CDs into root folder of the project
    {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup {}
        end
    },

    -- Symbols
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup {}
        end,
        cmd = "SymbolsOutline"
    },

    -- nice git signs
    "lewis6991/gitsigns.nvim",

    -- lua line
    "nvim-lualine/lualine.nvim",

    -- bufferline
    "akinsho/nvim-bufferline.lua",

    -- deletes buffer without closing window
    "ojroques/nvim-bufdel",

    -- Telescope
    "nvim-telescope/telescope.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },

    -- LaTeX
    {
        "lervag/vimtex",
        ft = "tex"
    },

    {
        "xuhdev/vim-latex-live-preview",
        ft = "tex"
    },

    -- pasting images
    "ekickx/clipboard-image.nvim",

    -- Vim viki
    "vimwiki/vimwiki",

    -- more git
    "tpope/vim-fugitive",

    -- comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    -- menu
    "goolord/alpha-nvim",

    -- file manager
    "kyazdani42/nvim-tree.lua",

    -- Toggle terminal
    "akinsho/toggleterm.nvim",

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",

    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle"
    },
    -- "nvim-treesitter/nvim-treesitter-context",

    -- Lsp
    "neovim/nvim-lspconfig",

    -- Lsp additional features
    "glepnir/lspsaga.nvim",

    -- generate documentation
    {
        "danymat/neogen",
        config = function()
            require("neogen").setup {
                enabled = true,
                languages = {
                    cs = {
                        template = {
                            annotation_convention = "xmldoc"
                        }
                    }
                }
            }
        end,
        cmd = "Neogen"
    },

    -- lsp installer
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    -- omnisharp
    "Hoffs/omnisharp-extended-lsp.nvim",

    -- syntax for .yuck files
    {
        "elkowar/yuck.vim",
        ft = "yuck"
    },

    -- lsp signatures
    "ray-x/lsp_signature.nvim",

    -- lsp and debugging
    {
        "mfussenegger/nvim-dap",
        -- cmd = "DapContinue"
    },

    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
        end,
        -- cmd = [[lua require("dapui").open()]]
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        -- cmd = "DapContinue"
    },

    -- rust language server improvements
    {
        "simrat39/rust-tools.nvim",
        -- ft = "rust"
    },

    -- inlay hints that somewhat work sometimes
    "shurizzle/inlay-hints.nvim",

    -- lsp colors
    "folke/lsp-colors.nvim",

    -- vim autoformatter
    "vim-autoformat/vim-autoformat",

    -- transtaion plugin
    {
        "uga-rosa/translate.nvim",
        cmd = "Translate"
    },

    -- git diff
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen"
    },

    -- color stuff
    { "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker").setup()
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require "colorizer".setup {
                "css",
                "javascript",
                "lua",
                html = {
                    mode = "foreground";
                }
            }
        end,
        ft = { "html", "css", "javascript", "typescript", "svelte", "lua", "yaml", "xml" }
    },

    {
        "eandrju/cellular-automaton.nvim",
        cmd = "CellularAutomaton"
    },

    {
        "lukas-reineke/headlines.nvim",
        config = function()
            require("headlines").setup {
                markdown = {
                    fat_headline_upper_string = "▄", -- ▃
                    fat_headline_lower_string = "▀",
                },
            }
        end,
        ft = "markdown"
    },

    "anuvyklack/windows.nvim",

    -- reach
    "toppair/reach.nvim",

    -- undo tree
    "mbbill/undotree"
}
