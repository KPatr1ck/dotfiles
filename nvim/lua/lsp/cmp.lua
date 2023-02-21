local cmp = require('cmp')

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmdline_mapping = cmp.mapping.preset.cmdline()
cmdline_mapping['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
cmdline_mapping['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' })
cmdline_mapping['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif has_words_before() then
        cmp.complete({
            reason = cmp.ContextReason.Auto,
        })
    else
        fallback()
    end
end, { 'i', 'c' })
-- cmdline_mapping['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' })
cmdline_mapping['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })
cmdline_mapping['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })
-- 如果窗口内容太多，可以滚动
-- cmdline_mapping['<PageDown>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' })
-- cmdline_mapping['<PageUp>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' })

function dumpvar(data)
    -- cache of tables already printed, to avoid infinite recursive loops
    local tablecache = {}
    local buffer = ''
    local padder = '    '

    local function _dumpvar(d, depth)
        local t = type(d)
        local str = tostring(d)
        if t == 'table' then
            if tablecache[str] then
                -- table already dumped before, so we dont
                -- dump it again, just mention it
                buffer = buffer .. '<' .. str .. '>\n'
            else
                tablecache[str] = (tablecache[str] or 0) + 1
                buffer = buffer .. '(' .. str .. ') {\n'
                for k, v in pairs(d) do
                    buffer = buffer .. string.rep(padder, depth + 1) .. '[' .. k .. '] => '
                    _dumpvar(v, depth + 1)
                end
                buffer = buffer .. string.rep(padder, depth) .. '}\n'
            end
        elseif t == 'number' then
            buffer = buffer .. '(' .. t .. ') ' .. str .. '\n'
        else
            buffer = buffer .. '(' .. t .. ') "' .. str .. '"\n'
        end
    end
    _dumpvar(data, 0)
    print(buffer)
    -- return buffer
end

cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn['vsnip#anonymous'](args.body)

            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 补全源
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- For vsnip users.
        { name = 'vsnip' },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },
    }, { { name = 'buffer' }, { name = 'path' } }),

    -- 快捷键设置
    mapping = cmdline_mapping,
    formatting = require('lsp.ui').formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline('/', {
    mapping = cmdline_mapping,
    sources = {
        { name = 'buffer' },
    },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(':', {
    mapping = cmdline_mapping,
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
