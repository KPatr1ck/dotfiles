local status, floaterm = pcall(require, 'floaterm')
if not status then
    vim.notify('没有找到 floaterm')
    return
end

floaterm.setup({})
