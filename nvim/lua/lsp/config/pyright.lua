local common = require('lsp.common-config')
local opts = {
    capabilities = common.capabilities,
    flags = common.flags,
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = false,
                useLibraryCodeForTypes = false,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
}
return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
