-- Diagnostic Icons
-- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
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

local lspsaga = require('lspsaga')
lspsaga.setup({
    ui = {
        theme = 'round',
        title = true,
        winblend = 0,
        border = 'rounded',
    },
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    request_timeout = 2000,
    finder = {
        --percentage
        max_height = 0.5,
        keys = {
            jump_to = 'p',
            edit = { 'o', '<CR>' },
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>',
        },
    },
    definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
    },
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = true,
        keys = {
            -- string | table type
            quit = 'q',
            exec = '<CR>',
        },
    },
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        insert_winblend = 0,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        --1 is max
        max_width = 0.7,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        border_follow = true,
        keys = {
            exec_action = 'o',
            quit = 'q',
            go_action = 'g',
        },
    },
    rename = {
        quit = '<C-c>',
        exec = '<CR>',
        mark = 'x',
        confirm = '<CR>',
        in_select = true,
    },
    outline = {
        win_position = 'right',
        win_with = '',
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = 'o',
            expand_collapse = 'u',
            quit = 'q',
        },
    },
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = 'e',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            jump = 'o',
            quit = 'q',
            expand_collapse = 'u',
        },
    },
    symbol_in_winbar = {
        enable = true,
        separator = ' >> ',
        ignore_patterns = { 'noice' },
        hide_keyword = true,
        show_file = false,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
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
M.signs = signs

return M
