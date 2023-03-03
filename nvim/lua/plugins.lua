local packer = require('packer')
packer.startup({
    function(use)
        -- Packer
        use('wbthomason/packer.nvim')
        -- Themes
        use('folke/tokyonight.nvim')
        use('shaunsingh/nord.nvim')
        use('EdenEast/nightfox.nvim')
        use('frenzyexists/aquarium-vim')
        use('Mofiqul/dracula.nvim')
        use({
            'rose-pine/neovim',
            as = 'rose-pine',
        })
        use({ 'catppuccin/nvim', as = 'catppuccin' })
        -- nvim-tree
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        -- nvim-neo-tree
        use({
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
                'MunifTanjim/nui.nvim',
            },
        })
        -- bufferline
        use({
            'akinsho/bufferline.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
        })
        -- lualine
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        -- dashboard-nvim
        use({ 'glepnir/dashboard-nvim', commit = 'f7d623457d6621b25a1292b24e366fae40cb79ab' })
        -- project
        use('ahmedkhalf/project.nvim')
        -- treesitter
        -- use({ "nvim-treesitter/nvim-treesitter" })
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        --------------------- LSP --------------------
        use('williamboman/nvim-lsp-installer')
        -- Lspconfig
        -- use({ 'neovim/nvim-lspconfig', commit = 'ee00aa22dc5254432ac4704e6761d2b127e14622' })
        use({ 'neovim/nvim-lspconfig' })
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- ui
        use('onsails/lspkind-nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        -- lspsaga
        use({ 'glepnir/lspsaga.nvim' })
        -- Lua 增强
        -- use('folke/lua-dev.nvim')
        use('folke/neodev.nvim')
        -- 代码格式化
        use('mhartington/formatter.nvim')
        -- Autopairs
        use('windwp/nvim-autopairs')
        -- 注释
        use('numToStr/Comment.nvim')
        -- surround
        -- use('ur4ltz/surround.nvim')
        use('kylechui/nvim-surround')
        -- vimspector
        use('puremourning/vimspector')
        -- gitsigns
        use('lewis6991/gitsigns.nvim')
        -- floaterm
        use('voldikss/vim-floaterm')
        -- toggleterm
        use('akinsho/toggleterm.nvim')
        -- FTerm
        use('numToStr/FTerm.nvim')
        -- vim-doge
        use({ 'kkoomen/vim-doge', run = ':call doge#install()' })
        -- nvim-notify
        use('rcarriga/nvim-notify')
        -- install without yarn or npm
        use({
            'iamcco/markdown-preview.nvim',
            run = function()
                vim.fn['mkdp#util#install']()
            end,
        })
        -- aerial
        -- use('stevearc/aerial.nvim')
        use({ 'KPatr1ck/aerial.nvim', branch = 'fix_next_up' })
        -- symbols-outline
        use('simrat39/symbols-outline.nvim')
        -- todo-comments
        use({ 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- noice
        use({
            'folke/noice.nvim',
            requires = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                'MunifTanjim/nui.nvim',
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                'rcarriga/nvim-notify',
            },
        })
        -- rest.nvim
        use({
            'rest-nvim/rest.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
        })
    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
