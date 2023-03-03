local status, todo_comments = pcall(require, 'todo-comments')
if not status then
    vim.notify('没有找到 todo-comments')
    return
end

todo_comments.setup({
    signs = false,
})
