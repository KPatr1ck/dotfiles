function _G.ReloadConfig()
    vim.cmd('luafile %')
    vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
end
