return {
    --文件树
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>tt", ":NvimTreeToggle<CR>", mode = "n", desc = "文件树" },
        },
        config = function()
            -- 启用文档树
            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                renderer = {
                    root_folder_modifier = ":t",
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_open = "",
                                arrow_closed = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "U",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                view = {
                    width = 30,
                    side = "left",
                },
            })
        end,
    },
}
