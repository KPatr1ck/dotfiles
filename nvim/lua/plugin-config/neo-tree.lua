local status, neo_tree = pcall(require, 'neo-tree')
if not status then
    vim.notify('没有找到 neo-tree')
    return
end

-- 列表操作快捷键
local list_keys = require('keybindings').neoTreeList
neo_tree.setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
        container = {
            enable_character_fade = true,
        },
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
        },
        icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = 'ﰊ',
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = '*',
            highlight = 'NeoTreeFileIcon',
        },
        modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
        },
        git_status = {
            symbols = {
                -- Change type
                added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = '✖', -- this can only be used in the git_status source
                renamed = '', -- this can only be used in the git_status source
                -- Status type
                untracked = '',
                ignored = '',
                unstaged = '',
                staged = '',
                conflict = '',
            },
        },
    },
    window = {
        position = 'left',
        width = '25%',
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = list_keys,
    },
    nesting_rules = {},
    filesystem = {
        follow_current_file = true,
        commands = {
            copy_filename = function(state)
                local node = state.tree:get_node()
                print(string.format('Copy %s to clipboard.', node.name))
                vim.fn.setreg('*', node.name, 'c')
            end,
            copy_abs_path = function(state)
                local node = state.tree:get_node()
                local full_path = node.path
                print(full_path)
                print(string.format('Copy %s to clipboard.', full_path))
                vim.fn.setreg('*', full_path, 'c')
            end,
            copy_path = function(state)
                local node = state.tree:get_node()
                local full_path = node.path
                local relative_path = full_path:sub(#state.path + 2)
                print(relative_path)
                print(string.format('Copy %s to clipboard.', relative_path))
                vim.fn.setreg('*', relative_path, 'c')
            end,
        },
        window = {
            mappings = {
                ['P'] = 'navigate_up',
                ['cd'] = 'set_root',
                ['.'] = 'toggle_hidden',
                ['cf'] = 'copy_filename',
                ['ca'] = 'copy_abs_path',
                ['cp'] = 'copy_path',
            },
        },
    },
    -- buffers = {
    --     follow_current_file = true, -- This will find and focus the file in the active buffer every
    --     -- time the current file is changed while the tree is open.
    --     group_empty_dirs = true, -- when true, empty folders will be grouped together
    --     show_unloaded = true,
    --     window = {
    --         mappings = {
    --             ['bd'] = 'buffer_delete',
    --             ['<bs>'] = 'navigate_up',
    --             ['.'] = 'set_root',
    --         },
    --     },
    -- },
    git_status = {
        window = {
            mappings = {
                ['gA'] = 'git_add_all',
                ['gu'] = 'git_unstage_file',
                ['ga'] = 'git_add_file',
                ['gr'] = 'git_revert_file',
                ['gc'] = 'git_commit',
                ['gp'] = 'git_push',
                ['gg'] = 'git_commit_and_push',
            },
        },
    },
    source_selector = {
        winbar = false, -- toggle to show selector on winbar
        statusline = false, -- toggle to show selector on statusline
        show_scrolled_off_parent_node = false, -- boolean
        tab_labels = { -- table
            filesystem = '  ', -- string | nil
            buffers = '  ', -- string | nil
            git_status = '  ', -- string | nil
            diagnostics = ' 裂 ', -- string | nil
        },
        content_layout = 'center', -- string
        -- tabs_layout = 'equal', -- string
        tabs_layout = 'active', -- string
        truncation_character = '…', -- string
        tabs_min_width = nil, -- int | nil
        tabs_max_width = nil, -- int | nil
        padding = 0, -- int | { left: int, right: int }
        separator = { left = '▏', right = '▕' }, -- string | { left: string, right: string, override: string | nil }
        separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
        show_separator_on_edge = false, -- boolean
        highlight_tab = 'NeoTreeTabInactive', -- string
        highlight_tab_active = 'NeoTreeTabActive', -- string
        highlight_background = 'NeoTreeTabInactive', -- string
        highlight_separator = 'NeoTreeTabSeparatorInactive', -- string
        highlight_separator_active = 'NeoTreeTabSeparatorActive', -- string
    },
})
