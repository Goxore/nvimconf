require 'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = "all",
    -- ensure_installed = "all",
    ensure_installed = { "c", "rust", "lua", "json", "python", "css", "vim", "bash", "c_sharp", "cpp", "javascript" },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    custom_captures = {
        -- ["arraytypename"] = "@ArrayTypeName"
        ["@return"] = "@testt",
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'V',
                ['@function.outer'] = 'V',
                ['@block.outer'] = 'V',
                ['@block.inner'] = 'V',
                ['@class.inner'] = 'V',
                ['@class.outer'] = 'V',
                -- '<c-v>', -- blockwise
                -- 'V', -- linewise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
        },
    },

    -- List of parsers to ignore installing
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        disable = { "help" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,

    },
}
      if require("nvim-treesitter.parsers").has_parser "c_sharp" then
        local folds_query = [[
(array_type
  type: (identifier) @arraytypename)
  ]]
        require("vim.treesitter.query").set_query("c_sharp", "arraytypename", folds_query)
      end
