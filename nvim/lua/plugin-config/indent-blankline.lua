local status, indent_blankline = pcall(require, 'indent_blankline')
if not status then
    vim.notify('没有找到 indent_blankline')
    return
end

-- Rainbow
local hl_list = {}
local rainbow_colors = { '#6C2121', '#767621', '#217621', '#324B9B', '#2F6F6F', '#9B7093' }

-- Helper func to convert list to set
function Set(list)
    local set = {}
    for _, l in ipairs(list) do
        set[l] = true
    end
    return set
end

local M = {}
M.set_indent_blankline_hl = function()
    -- Nightfox palette
    local nightfox_schemes = Set({
        'carbonfox',
        'dawnfox',
        'dayfox',
        'duskfox',
        'nightfox',
        'nordfox',
        'terafox',
    })
    if nightfox_schemes[vim.g.colors_name] then
        local palette = require('nightfox.palette').load(vim.g.colors_name)
        rainbow_colors = {
            palette.red.dim,
            palette.green.dim,
            palette.yellow.dim,
            palette.cyan.dim,
            palette.orange.dim,
            palette.pink.dim,
        }
    end

    for i, color in pairs(rainbow_colors) do
        local name = 'IndentBlanklineIndent' .. i
        vim.api.nvim_set_hl(0, name, { fg = color })
        if #hl_list < #rainbow_colors then
            table.insert(hl_list, name)
        end
    end
end

-- Setup indent_blankline highlights
M.set_indent_blankline_hl()

indent_blankline.setup({
    -- 空行占位
    space_char_blankline = ' ',

    -- 用 treesitter 判断上下文
    show_current_context = true,
    show_current_context_start = true,

    -- Color
    char_highlight_list = hl_list,

    context_patterns = {
        'class',
        'function',
        'method',
        'element',
        '^if',
        '^while',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
    },
    -- :echo &filetype
    filetype_exclude = {
        'dashboard',
        'packer',
        'terminal',
        'help',
        'log',
        'markdown',
        'TelescopePrompt',
        'lsp-installer',
        'lspinfo',
        'toggleterm',
    },
    -- 竖线样式
    char = '¦',
    -- char = '┆'
    -- char = '│'
    -- char = "⎸",
    -- char = '▏',
})

return M
