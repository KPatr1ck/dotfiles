vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    -- 在输入模式下也更新提示，设置为 true 也许会影响性能
    update_in_insert = true,
})
-- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
-- local signs = { Error = '🔴', Warn = '🟠', Hint = '🔵', Info = '🟢' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspkind
local lspkind = require('lspkind')
lspkind.init({
    -- default: true
    -- with_text = true,
    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',
    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = '',
    },
})

-- nordfox color
local nord_colors = {
    normal_bg = '#2e3440',
    title_bg = '#afd700',
    red = '#e95678',
    magenta = '#b33076',
    orange = '#FF8700',
    yellow = '#f7bb3b',
    green = '#afd700',
    cyan = '#36d0e0',
    blue = '#61afef',
    purple = '#CBA6F7',
    white = '#d1d4cf',
    black = '#1c1c19',
}
local lspsaga = require('lspsaga')
-- New setup 23/01/19
-- lspsaga.init_lsp_saga({ -- defaults ...
lspsaga.setup({ -- defaults ...
    ui = {
        -- theme = 'round',
        title = false, -- Nvim 0.8 doesn't support window titles
        winblend = 5,
        border = 'rounded',
        colors = nord_colors,
    },
    -- diagnostic_header = { '', '', '', '' },
    -- diagnostic_header = { '🔴', '🟠', '🔵', '🟢' },
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    max_preview_lines = 10,
    code_action_icon = '',
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    finder_request_timeout = 1500,
    -- finder_preview_hl_ns = 0,
    finder_action_keys = {
        open = 'o',
        -- open = "<CR>",
        vsplit = 's',
        split = 'i',
        tabe = 't',
        quit = '<C-c>',
        -- quit = "q",
        -- quit = "<ESC>",
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    code_action_keys = {
        -- quit = "<ESC>",
        quit = 'q',
        exec = '<CR>',
    },
    definition_action_keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
    },
    rename_action_quit = '<C-c>',
    rename_in_select = false,
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        -- auto refresh when change buffer
        auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {},
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})

local M = {}
-- 为 cmp.lua 提供参数格式
M.formatting = {
    format = lspkind.cmp_format({
        mode = 'symbol_text',
        --mode = 'symbol', -- show only symbol annotations

        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
            -- Source 显示提示来源
            vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
            return vim_item
        end,
    }),
}

return M
