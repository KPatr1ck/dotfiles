-- 基础设置
require('basic')

-- 快捷键设置
require('keybindings')

-- Packer 插件管理
require('plugins')

-- 主题设置
require('colorscheme')

-- nvim-tree
require('plugin-config.nvim-tree')

-- bufferline
require('plugin-config.bufferline')

-- lualine
require('plugin-config.lualine')

-- telescope
require('plugin-config.telescope')

-- dashboard
require('plugin-config.dashboard')

-- project
require('plugin-config.project')

-- nvim-treesitter
require('plugin-config.nvim-treesitter')

-- 内置LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
require('lsp.formatter')

-- indent-blankline
require('plugin-config.indent-blankline')

-- indent-blankline
require('plugin-config.neo-tree')

-- autopairs
require('plugin-config.nvim-autopairs')

-- comment
require('plugin-config.comment')

-- surround
require('plugin-config.surround')

-- Vimspector
require('dap.vimspector')
