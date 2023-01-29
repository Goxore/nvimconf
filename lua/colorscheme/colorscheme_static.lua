local fg = require("core").fg
local bg = require("core").bg
local hi = require("core").hi
local link = require("core").link
local getFg = require("core").getFg
local getBg = require("core").getBg
local darker = require("core").darker
local lerp = require("core").lerp
local syscolors = require("systemcolors")
local style = require("core").style

GlobalColors = {}
local M = {}

function M.setup(colors)

    local function tableHasKey(ifHas, ifHasNo, isBg)
        if colors[ifHas] == nil then
            if isBg == true then
                return require("core").getBg(ifHasNo)
            else
                return require("core").getFg(ifHasNo)
            end
        else
            return colors[ifHas]
        end
    end

    local bgcolor = tableHasKey("bgcolor", "Normal", true)
    local fgcolor = tableHasKey("fgcolor", "Normal")
    local orange = tableHasKey("orange", "Special")
    local red = tableHasKey("red", "Keyword")
    local green = tableHasKey("green", "Function")
    local blue = tableHasKey("blue", "Conceal")
    local cyan = tableHasKey("cyan", "Identifier")
    local yellow = tableHasKey("yellow", "Type")
    local magenta = tableHasKey("magenta", "Boolean")

    GlobalColors.bgcolor = bgcolor
    GlobalColors.fgcolor = fgcolor
    GlobalColors.orange  = orange
    GlobalColors.red     = red
    GlobalColors.green   = green
    GlobalColors.blue    = blue
    GlobalColors.cyan    = cyan
    GlobalColors.yellow  = yellow
    GlobalColors.magenta = magenta

    vim.g.terminal_color_0 = bgcolor
    vim.g.terminal_color_1 = red
    vim.g.terminal_color_2 = green
    vim.g.terminal_color_3 = yellow
    vim.g.terminal_color_4 = blue
    vim.g.terminal_color_5 = magenta
    vim.g.terminal_color_6 = cyan
    vim.g.terminal_color_7 = fg
    vim.g.terminal_color_8 = darker(fgcolor, 10)
    vim.g.terminal_color_9 = red
    vim.g.terminal_color_10 = green
    vim.g.terminal_color_11 = yellow
    vim.g.terminal_color_12 = blue
    vim.g.terminal_color_13 = magenta
    vim.g.terminal_color_14 = cyan
    vim.g.terminal_color_15 = fg

    vim.cmd [[
        set laststatus=3
        set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾,diff:╱
        " set fillchars=fold:\ ,vert:\▎,eob:\ ,msgsep:‾
        " set fillchars=fold:\ ,vert:\ ,eob:\ ,msgsep:\ 
    ]]

    bg("SignColumn", "transparent")
    bg("WinSeparator", "transparent")
    fg("WinSeparator", darker(bgcolor, -10))


    -- fg("CmpItemAbbrDefault", fgcolor)
    -- fg("CmpItemMenuDefault", fgcolor)
    --
    -- fg("CmpItemAbbrMatch", blue)
    -- fg("CmpItemAbbrMatchFuzzy", magenta)
    --
    -- fg("CmpItemKindVariable", green)
    -- fg("CmpItemKindInterface", yellow)
    -- fg("CmpItemKindText", blue)
    --
    -- fg("CmpItemKindFunction", red)
    -- fg("CmpItemKindMethod", yellow)
    --
    -- fg("CmpItemKindKeyword", orange)
    -- fg("CmpItemKindProperty", magenta)
    -- fg("CmpItemKindUnit", magenta)

    fg("CmpItemAbbrMatchFuzzy", magenta)
    fg("CmpItemAbbrMatch", blue)

    link("CmpItemKindMethod", "Function")
    link("CmpItemKindFunction", "Function")
    link("CmpItemKindVariable", "Variable")
    link("CmpItemKindInterface", "Type")
    link("CmpItemKindEnum", "Type")
    link("CmpItemKindModule", "Include")
    link("CmpItemKindKeyword", "Keyword")
    link("CmpItemKindStruct", "Structure")
    link("CmpItemKindClass", "String")
    link("CmpItemKindField", "Variable")
    link("CmpItemKindUnit", "String")
    link("CmpItemKindProperty", "String")
    fg("CmpItemKindText", fgcolor)
    fg("CmpItemKindText", fgcolor)


    bg("SignColumn", "transparent")
    bg("WinSeparator", "transparent")

    fg("WinSeparator", darker(bgcolor, -10))

    -- nvimTree
    bg("NvimTreeNormal", darker(bgcolor, -5))
    hi("NvimTreeWinSeparator", darker(bgcolor, -5), darker(bgcolor, -5))

    fg("NvimTreeSpecialFile", red)
    fg("NvimTreeImageFile", yellow)

    fg("AlphaHeader", yellow)
    fg("AlphaButtons", green)
    fg("AlphaButtonsShortcut", bgcolor)
    bg("AlphaButtonsShortcut", blue)

    -- bufferline
    bg("BufferLineFill", darker(bgcolor, 20))

    fg("Search", fgcolor)
    bg("Search", darker(bgcolor, -20))

    hi("DiagnosticWarn", darker(orange, 5), "transparent")
    hi("DiagnosticHint", darker(bgcolor, -35), "transparent")
    hi("DiagnosticError", darker(red, -5), "transparent")
    hi("DiagnosticInfo", darker(blue, -5), "transparent")


    hi('GitSignsAdd   ', green, "transparent")
    hi('GitSignsChange', blue, "transparent")
    hi('GitSignsDelete', red, "transparent")
    hi('GitSignsDelete', red, "transparent")

    hi('DiffAdd', green ,lerp(bgcolor, green, 0.15))
    hi('DiffChange', blue ,lerp(bgcolor, blue, 0.15))
    hi('DiffDelete', red ,lerp(bgcolor, red, 0.15))

    -- fg('lualine_b_diff_added_normal', green)
    -- fg('lualine_b_diff_modified_normal', blue)
    -- fg('lualine_b_diff_removed_normal', red)

    style("String", "italic")
    style("Comment", "italic")
    style("Function", "bold")

    -- Treesitter
    fg('@variable', getFg('@field'))
    fg('@tag', red)
    fg('@tag.delimiter', red)
    fg('@type.qualifier', red)
    fg('@text', fgcolor)
    fg('@none', fgcolor)

    -- Treesitter legacy (needed for some plugins)
    fg('TSBoolean', getFg('@boolean'))
    fg('TSCharacter', getFg('@character'))
    fg('TSComment', getFg('@comment'))
    fg('TSConditional', getFg('@conditional'))
    fg('TSConstant', getFg('@constant'))
    fg('TSType', getFg('@type'))
    fg('TSField', getFg('@field'))
    fg('TSFunction', getFg('@function'))
    fg('TSString', getFg('@string'))
    fg('TSKeyword', getFg('@keyword'))
    fg('TSInclude', getFg('@include'))

    -- Lsp
    bg('LspReferenceRead', darker(bgcolor, -15))
    bg('LspReferenceWrite', darker(bgcolor, -15))
    bg('LspReferenceText', darker(bgcolor, -15))

    -- LspSaga
    fg('LspSagaHoverBorder', yellow)
    fg('LspSagaRenameBorder', magenta)
    hi('LspSagaLightBulb', fgcolor, "transparent")
    fg('LspSagaCodeActionBorder', magenta)
    fg('LspSagaCodeActionContent', blue)
    fg('LspSagaSignatureHelpBorder', yellow)

    -- General borders
    hi("FloatBorder", blue, bgcolor)
    bg("NormalFloat", bgcolor)

    -- Telescope
    fg("TelescopeBorder", red)
    fg("TelescopePromptBorder", cyan)
    fg("TelescopeResultsBorder", cyan)
    fg("TelescopePreviewBorder", cyan)
    fg("TelescopeMatching", orange)
    style("TelescopeMatching", "bold")
    fg("TelescopePromptPrefix", green)
    -- bg("TelescopeSelection",  })
    fg("TelescopeSelectionCaret", yellow)

    -- Vimwiki
    fg("VimwikiMarkers", blue)
    fg("VimwikiHeader1", yellow)
    fg("VimwikiHeader2", magenta)
    fg("VimwikiHeader3", red)
    fg("VimwikiLink", green)

    -- nicer icons
    fg("DevIconCs", "#854cc7")

    fg("Directory", blue)

    -- fg("BufferLineNumbersSelected", blue)
    -- fg("BufferLineBackground", blue)

    -- require("lualine").setup{options={theme=M.lualinetheme()}}
    -- require("lspsaga").setup{ui={colors=M.lspsagatheme()}}
end

GlobalColors.lualinetheme = function()

    GlobalColors.gray = darker(GlobalColors.bgcolor, -5)
    GlobalColors.lightgray = darker(GlobalColors.bgcolor, -15)
    GlobalColors.darkgray = darker(GlobalColors.bgcolor, 10)
    GlobalColors.inactivegray = darker(GlobalColors.bgcolor, 15)

    return {
        normal = {
            a = { bg = GlobalColors.blue, fg = GlobalColors.bgcolor, gui = 'bold' },
            b = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
            c = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
        },
        insert = {
            a = { bg = GlobalColors.green, fg = GlobalColors.bgcolor, gui = 'bold' },
            b = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
            c = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
        },
        visual = {
            a = { bg = GlobalColors.yellow, fg = GlobalColors.bgcolor, gui = 'bold' },
            b = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
            c = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
        },
        replace = {
            a = { bg = GlobalColors.red, fg = GlobalColors.bgcolor, gui = 'bold' },
            b = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
            c = { bg = GlobalColors.bgcolor, fg = GlobalColors.fgcolor },
        },
        command = {
            a = { bg = GlobalColors.magenta, fg = GlobalColors.bgcolor, gui = 'bold' },
            b = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
            c = { bg = GlobalColors.lightgray, fg = GlobalColors.fgcolor },
        },
        inactive = {
            a = { bg = GlobalColors.darkgray, fg = GlobalColors.gray, gui = 'bold' },
            b = { bg = GlobalColors.darkgray, fg = GlobalColors.gray },
            c = { bg = GlobalColors.darkgray, fg = GlobalColors.gray },
        },
    }
end

GlobalColors.lspsagatheme = function ()
    return {
      normal_bg = GlobalColors.bgcolor,
      title_bg = GlobalColors.fgcolor,
      red = GlobalColors.red,
      magenta = GlobalColors.magenta,
      orange = GlobalColors.orange,
      yellow = GlobalColors.yellow,
      green = GlobalColors.green,
      cyan = GlobalColors.cyan,
      blue = GlobalColors.blue,
      purple = GlobalColors.magenta,
      white = GlobalColors.fgcolor,
      black = GlobalColors.fgcolor,
    }
end

return M
