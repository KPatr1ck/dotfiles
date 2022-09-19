vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
function table.copy(t)
    local u = {}
    for k, v in pairs(t) do
        u[k] = v
    end
    return setmetatable(u, getmetatable(t))
end

-- reload config
map('n', '<leader>R', ':lua ReloadConfig()<CR>', opt)

-- visual模式下缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中文本
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)
-- 在visual 模式里粘贴不要复制
map('v', 'p', '"_dP', opt)
-- insert 模式下，跳到行首行尾
map('i', '<C-a>', '<ESC>I', opt)
map('i', '<C-e>', '<ESC>A', opt)

-- windows 分屏快捷键
map('n', '<leader>wv', ':vsp<CR>', opt)
map('n', '<leader>w', ':sp<CR>', opt)
-- 关闭当前
map('n', '<leader>wc', '<C-w>c', opt)
-- 关闭其他
map('n', '<leader>wo', '<C-w>o', opt)
-- 窗口移动
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-l>', '<C-w>l', opt)
-- 比例控制
map('n', '<A-l>', ':vertical resize -2<CR>', opt)
map('n', '<A-h>', ':vertical resize +2<CR>', opt)
map('n', '<A-j>', ':resize +2<CR>', opt)
map('n', '<A-k>', ':resize -2<CR>', opt)

-- 复制文件路径信息
-- relative path  (src/foo.txt)
map('n', '<leader>cP', ':let @+=expand("%")<CR>', opt)
-- absolute path  (/something/src/foo.txt)
map('n', '<leader>cp', ':let @+=expand("%:p")<CR>', opt)
-- filename       (foo.txt)
map('n', '<leader>cf', ':let @+=expand("%:t")<CR>', opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- map('n', 'tr', ':NvimTreeToggle<CR>', opt)
-- map('n', 'tf', ':NvimTreeFindFile<CR>', opt)
-- map('n', 'tc', ':NvimTreeClose<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- 分屏打开文件
    { key = '<leader>w', action = 'split' },
    { key = '<leader>wv', action = 'vsplit' },
    -- 显示隐藏文件
    -- { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
    -- 文件操作
    { key = 'r', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'dd', action = 'remove' },
    { key = 're', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'yy', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 's', action = 'system_open' },
    -- 折叠
    { key = '+', action = 'expand_all' },
    { key = '_', action = 'collapse_all' },
    -- 文件信息
    { key = 'cn', action = 'copy_name' },
    { key = 'cp', action = 'copy_path' },
    { key = 'ca', action = 'copy_absolute_path' },
    { key = 'i', action = 'toggle_file_info' },
    -- 改变目录
    { key = 'P', action = 'dir_up' },
    { key = 'cd', action = 'cd' },
}

-- -- nvim-neo-tree
map('n', 'tr', ':Neotree reveal action=focus toggle=true<CR>', opt)
map('n', 'ts', ':Neotree reveal action=show<CR>', opt)
map('n', 'tf', ':Neotree reveal action=focus<CR>', opt)
map('n', 'tb', ':Neotree reveal action=focus source=buffers<CR>', opt)
map('n', 'tc', ':Neotree action=close<CR>', opt)

pluginKeys.neoTreeList = {
    ['<space>'] = {
        'toggle_node',
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
    },
    ['o'] = 'open',
    ['P'] = 'navigate_up',
    ['cd'] = 'set_root',
    ['<cr>'] = 'open',
    ['<esc>'] = 'revert_preview',
    ['<Tab>'] = { 'toggle_preview', config = { use_float = true } },
    ['<leader>w'] = 'open_split',
    ['<leader>wv'] = 'open_vsplit',
    -- ["S"] = "split_with_window_picker",
    -- ["s"] = "vsplit_with_window_picker",
    ['t'] = 'open_tabnew',
    -- ["<cr>"] = "open_drop",
    -- ["t"] = "open_tab_drop",
    -- ['w'] = 'open_with_window_picker',
    ['C'] = 'close_node',
    ['_'] = 'close_all_nodes',
    ['+'] = 'expand_all_nodes',
    ['.'] = 'toggle_hidden',
    ['a'] = {
        'add',
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
            show_path = 'none', -- "none", "relative", "absolute"
        },
    },
    ['A'] = 'add_directory', -- also accepts the optional config.show_path option like "add".
    ['dd'] = 'delete',
    ['re'] = 'rename',
    ['yy'] = 'copy_to_clipboard',
    ['x'] = 'cut_to_clipboard',
    ['p'] = 'paste_from_clipboard',
    ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
    -- ["c"] = {
    --  "copy",
    --  config = {
    --    show_path = "none" -- "none", "relative", "absolute"
    --  }
    --}
    ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
    ['q'] = 'close_window',
    ['r'] = 'refresh',
    ['?'] = 'show_help',
    ['<'] = 'prev_source',
    ['>'] = 'next_source',
}

-- bufferline
-- Buffer切换
map('n', '<Tab>', '<C-^>', opt)
map('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', opt)
map('n', '<C-A-h>', ':BufferLineMovePrev<CR>', opt)
map('n', '<C-A-l>', ':BufferLineMoveNext<CR>', opt)
-- Tab切换
map('n', '<C-A-k>', ':tabp<CR>', opt)
map('n', '<C-A-j>', ':tabn<CR>', opt)
map('n', '<C-A-t>', ':tabnew<CR>', opt)
-- 关闭
--"moll/vim-bbye"
-- 关闭当前 buffer See Also: https://github.com/akinsho/bufferline.nvim/issues/513
map('n', '<leader>c', ':bp <BAR> bd #<CR>', opt)
map('n', '<leader>cr', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>cl', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>p', ':BufferLinePick<CR>', opt)
-- map("n", "<leader>c", ":BufferLinePickClose<CR>", opt)

-- Terminal相关
map('t', '<Esc>', '<C-\\><C-n>', opt)
-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>tv", ":vsp | terminal<CR>", opt)
-- floaterm
map('n', '<leader>t', ':FloatermNew<CR>', opt)
map('t', '<leader>t', '<C-\\><C-n>:FloatermNew<CR>', opt)
map('t', '<C-PageUp>', ':FloatermPrev<CR>', opt)
map('t', '<C-PageUp>', '<C-\\><C-n>:FloatermPrev<CR>', opt)
map('t', '<C-PageDown>', ':FloatermNext<CR>', opt)
map('t', '<C-PageDown>', '<C-\\><C-n>:FloatermNext<CR>', opt)
map('n', '<C-N>', ':FloatermToggle<CR>', opt)
map('t', '<C-N>', '<C-\\><C-n>:FloatermToggle<CR>', opt)

-- Telescope
-- map("n", "<C-Insert>", "<C-^>", opt)
-- map("n", "<C-n>", "<C-^>", opt)
-- 查找文件
map('n', '<C-Insert>', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<C-A-f>', ':Telescope live_grep<CR>', opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        -- 历史记录
        ['<C-j>'] = 'cycle_history_next',
        ['<C-k>'] = 'cycle_history_prev',
        -- 关闭窗口
        ['<C-c>'] = 'close',
        -- ["<C-N>"] = "close",
        -- 预览窗口上下滚动
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    },
}

-- Code fold
map('n', '_', ':foldclose<CR>', opt)
map('n', '+', ':foldopen<CR>', opt)

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)

    -- code action
    -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)

    -- Lspsaga替换
    -- go xx
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
    mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
    -- diagnostic
    mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
    mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
    mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
    -- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { auync = true } <CR>", opt)
    mapbuf('n', '<leader>f', '<cmd>Format<CR>', opt)

    -- 原始LSP
    ---- go xx
    -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    ---- diagnostic
    --mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    --mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    --mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    --mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    ---- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<C-h>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- ['<Tab>'] = cmp.mapping.confirm({
        --     select = true,
        --     behavior = cmp.ConfirmBehavior.Replace,
        -- }),
        -- 如果窗口内容太多，可以滚动
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
local api = require('Comment.api')
vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, opt)
vim.keymap.set('n', '<C-\\>', api.toggle.blockwise.current, opt)
map('v', '<C-_>', ':lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())<CR>', opt)
map('v', '<C-\\>', ':lua require("Comment.api").locked.toggle_blockwise_op(vim.fn.visualmode())<CR>', opt)

-- Vimspector
pluginKeys.mapVimspector = function()
    -- 开始
    map('n', '<leader>de', ':call vimspector#Launch()<CR>', opt)
    -- 结束
    map('n', '<Leader>dq', ':call vimspector#Reset()<CR>', opt)
    -- 继续
    map('n', '<Leader>dc', ':call vimspector#Continue()<CR>', opt)
    -- 设置断点
    map('n', '<Leader>db', ':call vimspector#ToggleBreakpoint()<CR>', opt)
    map('n', '<Leader>dcl', ':call vimspector#ClearBreakpoints()<CR>', opt)
    --  stepOver, stepOut, stepInto
    map('n', '<leader>dn', '<Plug>VimspectorStepOver', opt)
    map('n', '<leader>dr', '<Plug>VimspectorStepOut', opt)
    map('n', '<leader>ds', '<Plug>VimspectorStepInto', opt)
end

return pluginKeys
