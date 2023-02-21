local status, ident_blankline = pcall(require, 'indent_blankline')
if not status then
    vim.notify('没有找到 indent_blankline')
    return
end

-- Rainbow
local hl_list = {}
for i, color in pairs({ '#6C2121', '#767621', '#217621', '#324B9B', '#2F6F6F', '#9B7093' }) do
    local name = 'IndentBlanklineIndent' .. i
    vim.api.nvim_set_hl(0, name, { fg = color })
    table.insert(hl_list, name)
end

ident_blankline.setup({
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
