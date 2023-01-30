local cmp = require('cmp')

local cmdline_mapping = cmp.mapping.preset.cmdline()
cmdline_mapping['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
cmdline_mapping['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' })
cmdline_mapping['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' })
cmdline_mapping['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })
cmdline_mapping['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })

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
    -- mapping = require('keybindings').cmp(cmp),
    mapping = cmdline_mapping,
    -- 使用lspkind-nvim显示类型图标 (新增)
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
