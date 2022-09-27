local status, floaterm = pcall(require, 'toggleterm')
if not status then
    vim.notify('没有找到 toggleterm')
    return
end

floaterm.setup({
    direction = 'float',
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = 'double',
        width = function()
            return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.9)
        end,
    },
})
