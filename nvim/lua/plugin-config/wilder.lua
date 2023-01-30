local status, wilder = pcall(require, 'wilder')

if not status then
    vim.notify('没有找到 wilder')
    return
end

wilder.setup({ modes = { ':', '/', '?' } })
