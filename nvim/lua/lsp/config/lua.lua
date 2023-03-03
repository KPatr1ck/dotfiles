-- See https://github.com/folke/neodev.nvim#-setup

return {
    on_setup = function(server)
        -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
        require('neodev').setup({
            -- add any options here, or leave empty to use the default settings
        })

        -- example to setup lua_ls and enable call snippets
        server.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        })
    end,
}
