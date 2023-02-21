-- NightFox
require('nightfox').setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath('cache') .. '/nightfox',
        compile_file_suffix = '_compiled', -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        colorblind = {
            enable = false, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
                protan = 0, -- Severity [0,1] for protan (red)
                deutan = 0, -- Severity [0,1] for deutan (green)
                tritan = 0, -- Severity [0,1] for tritan (blue)
            },
        },
        styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'italic',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'bold',
            variables = 'NONE',
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        modules = { -- List of various plugins and additional options
            -- ...
        },
    },
    palettes = {},
    specs = {},
    groups = {},
})

-- setup must be called before loading
local colorscheme = 'nordfox'
-- local colorscheme = 'dawnfox'
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
-- local colorscheme = 'onedark'
-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
--     vim.notify('colorscheme ' .. colorscheme .. ' 没有找到！')
--     return
-- end

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

-- local colorscheme = 'onedark_vivid'
-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
--     vim.notify('colorscheme ' .. colorscheme .. ' 没有找到！')
--     return
-- end

-- Catppuccin
-- require('catppuccin').setup({
--     flavour = 'mocha', -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = 'latte',
--         dark = 'mocha',
--     },
--     transparent_background = false,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = 'dark',
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { 'italic' },
--         conditionals = { 'italic' },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })

-- -- setup must be called before loading
-- vim.cmd.colorscheme('catppuccin')
-- require('catppuccin').setup({
--     flavour = 'frappe', -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = 'latte',
--         dark = 'mocha',
--     },
--     transparent_background = false,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = 'dark',
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { 'italic' },
--         conditionals = { 'italic' },
--         loops = {},
--         functions = {},
--         keywords = { 'bold' },
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         neotree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         lsp_saga = true,
--         dashboard = true,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })

-- -- setup must be called before loading
-- local colorscheme = 'catppuccin-frappe'
-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
-- if not status_ok then
--     vim.notify('colorscheme ' .. colorscheme .. ' 没有找到！')
--     return
-- end
