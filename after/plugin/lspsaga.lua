require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false,
    separator = ' ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
  },
  ui = {
    -- currently only round theme
    colors = GlobalColors.lspsagatheme(),
    -- border type can be single,double,rounded,solid,shadow.
    border = 'single',
    winblend = 0,
    expand = '',
    collapse = '',
    preview = ' ',
    code_action = '',
    -- code_action = '💡',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    kind = {},
  },
})
