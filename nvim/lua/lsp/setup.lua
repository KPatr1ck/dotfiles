require('nvim-lsp-installer').setup({
    -- 自动安装 Language Servers
    automatic_installation = true,
})
local lspconfig = require('lspconfig')

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    sumneko_lua = require('lsp.config.lua'), -- lua/lsp/config/lua.lua
    pyright = require('lsp.config.pyright'),
    -- jedi_language_server = require("lsp.config.jedi_language_server"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == 'table' then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
