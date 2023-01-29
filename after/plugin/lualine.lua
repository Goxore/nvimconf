local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end

lualine.setup({
    options = {
        theme = GlobalColors.lualinetheme(),
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
            "NvimTree",
            "packer",
            "toggleterm",
            "lsp-installer",
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch", icon = "" },
            { "diff" },
            {
                "diagnostics",
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
