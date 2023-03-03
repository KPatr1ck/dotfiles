local status, formatter = pcall(require, 'formatter')

if not status then
    vim.notify('没有找到 formatter')
    return
end

formatter.setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = 'yapf',
                    stdin = true,
                }
            end,
            function()
                return {
                    exe = 'autopep8',
                    args = { '-' },
                    stdin = true,
                }
            end,
            function()
                return {
                    exe = 'isort',
                    args = { '-q', '-' },
                    stdin = true,
                }
            end,
            -- function()
            --     return {
            --         exe = 'docformatter',
            --         args = { '-' },
            --         stdin = true,
            --     }
            -- end,
            function()
                return {
                    exe = 'black',
                    args = {
                        '-q',
                        '-',
                    },
                    stdin = true,
                }
            end,
            -- function()
            --     return {
            --         exe = 'pyment',
            --         args = { '-w', '-' },
            --         stdin = true,
            --     }
            -- end,
            -- function()
            --     return {
            --         exe = 'pydevf',
            --     }
            -- end,
        },
    },
})

-- format on save
vim.api.nvim_exec(
    [[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.py FormatWrite
augroup END
]],
    true
)
