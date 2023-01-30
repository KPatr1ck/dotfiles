local status, notify = pcall(require, 'notify')

if not status then
    vim.notify('没有找到 notify')
    return
end

notify.setup({
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = 'fade',
    ---@usage Function called when a new window is opened, use for changing win settings/config
    on_open = nil,
    ---@usage Function called when a window is closed
    on_close = nil,
    ---@usage timeout for notifications in ms, default 5000
    timeout = 1000,
    -- Render function for notifications. See notify-render()
    render = 'default',
    ---@usage highlight behind the window for stages that change opacity
    -- background_colour = 'Normal',
    background_colour = '#2E3440',
    ---@usage minimum width for notification windows
    minimum_width = 50,
    ---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
    level = 'WARN',
})

vim.cmd([[
    hi NotifyINFOIcon guifg=#6b8e23
    hi NotifyINFOTitle guifg=#6b8e23
]])
vim.notify = notify
