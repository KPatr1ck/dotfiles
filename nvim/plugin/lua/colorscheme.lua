-- NightFox
-- Default options
require('nightfox').setup({
    options = {
        -- Compiled file's destination location
        transparent = false, -- Disable setting background
        terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
            comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'bold',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'italic',
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
    },
})

local colorscheme = 'nordfox'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' 没有找到！')
    return
end

-- OneDark
-- require('onedark').setup({
--     function_style = 'italic',
--     sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
--
--     -- Change the "hint" color to the "orange0" color, and make the "error" color bright red
--     colors = { hint = 'orange0', error = '#ff0000' },
--
--     -- Overwrite the highlight groups
--     overrides = function(c)
--         return {
--             htmlTag = { fg = c.red0, bg = '#282c34', sp = c.hint, style = 'underline' },
--             DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
--             -- this will remove the highlight groups
--             TSField = {},
--         }
--     end,
-- })

-- OneDark Pro
-- require('onedarkpro').setup({
--     dark_theme = 'onedark', -- The default dark theme
--     light_theme = 'onelight', -- The default light theme
--     plugins = {
--         lsp_saga = true,
--         nvim_tree = true,
--         telescope = true,
--         native_lsp = false,
--         polygot = false,
--         treesitter = false,
--         packer = true,
--         dashboard = true,
--     },
-- })
--
-- local colorscheme = 'onedarkpro'
-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
--     vim.notify('colorscheme ' .. colorscheme .. ' 没有找到！')
--     return
-- end
