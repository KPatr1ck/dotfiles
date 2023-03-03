local status, bufferline = pcall(require, 'bufferline')
if not status then
    vim.notify('没有找到 bufferline')
    return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        -- separator_style = 'slant',
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        -- Neotree
        offsets = {
            {
                filetype = 'neo-tree',
                text = 'Explorer',
                -- text = function()
                --     return vim.fn.getcwd()
                -- end,
                highlight = 'Directory',
                text_align = 'center',
            },
        },
        -- NvimTree
        -- offsets = {
        --     {
        --         filetype = 'NvimTree',
        --         text = 'File Explorer',
        --         highlight = 'Directory',
        --         text_align = 'center',
        --     },
        -- },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = 'nvim_lsp',
    },
})
