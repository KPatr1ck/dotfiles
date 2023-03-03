-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, 'lualine')
if not status then
    vim.notify('没有找到 lualine')
    return
end

local status_ui, lsp_ui = pcall(require, 'lsp.ui')
if not status_ui then
    vim.notify('没有找到 lsp.ui')
    return
end

local signs = lsp_ui.signs

lualine.setup({
    options = {
        theme = auto,
        -- theme = 'catppuccin',
        -- theme = 'nordfox',
        -- https://github.com/ryanoasis/powerline-extra-symbols
        -- component_separators = { left = ' ', right = ' ' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    extensions = { 'nvim-tree', 'toggleterm', 'neo-tree' },
    sections = {
        lualine_a = {
            {
                require('noice').api.status.mode.get,
                cond = require('noice').api.status.mode.has,
                color = { bg = '#ff9e64', fg = '#ffffff' },
                padding = 2,
            },
            { 'mode', padding = 2 },
        },
        lualine_b = {
            { 'branch', padding = 2 },
            { 'diff', padding = 2 },
            {
                'diagnostics',
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'nvim_diagnostic', 'coc' },

                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = signs.Error, warn = signs.Warn, info = signs.Info, hint = signs.Hint },
                colored = true, -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false, -- Show diagnostics even if there are none.
                padding = 2,
            },
        },
        lualine_c = {
            { 'filename', padding = 2 },
            {
                'lsp_progress',
                -- spinner_symbols = { ' ', ' ', ' ', ' ', ' ', ' ' },
            },
        },
        lualine_x = {
            'filesize',
            {
                'fileformat',
                -- symbols = {
                --   unix = '', -- e712
                --   dos = '', -- e70f
                --   mac = '', -- e711
                -- },
                symbols = {
                    unix = 'LF',
                    dos = 'CRLF',
                    mac = 'CR',
                },
            },
            'encoding',
            'filetype',
        },
        lualine_y = { { 'progress', padding = 2 } },
        lualine_z = { { 'location', padding = 2 } },
    },
})
