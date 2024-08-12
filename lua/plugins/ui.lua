return {
    --透明插件
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").clear_prefix("NvimTree")
            require("transparent").clear_prefix("whichkey")
            require("transparent").clear_prefix("lazy")
            require("transparent").clear_prefix("telescope")
            require("transparent").clear_prefix("mason")
            require("transparent").clear_prefix("nvim")
            require("transparent").clear_prefix("Luasnip")
            require("transparent").clear_prefix("cmp")
            require("transparent").clear_prefix("lsp")
            require("transparent").clear_prefix("trouble")
            require("transparent").clear_prefix("indent")
            require("transparent").clear_prefix("bufferline")
            -- Optional, you don't have to run setup.
            require("transparent").setup({
                -- table: default groups
                groups = {
                    "Normal",
                    "NormalNC",
                    "Comment",
                    "Constant",
                    "Special",
                    "Identifier",
                    "Statement",
                    "PreProc",
                    "Type",
                    "Underlined",
                    "Todo",
                    "String",
                    "Function",
                    "Conditional",
                    "Repeat",
                    "Operator",
                    "Structure",
                    "LineNr",
                    "NonText",
                    "SignColumn",
                    "StatusLine",
                    "StatusLineNC",
                    "CursorLine",
                    "CursorLineNr",
                    "EndOfBuffer",
                    "CmpDocumentation",
                    "NormalFloat",
                    "WinFloat",
                    "DiagnosticError",
                    "DiagnosticWarn",
                    "DiagnosticInfo",
                    "DiagnosticHint",
                },
                -- table: additional groups that should be cleared
                extra_groups = {
                    -- 额外的组，例如 Pmenu（弹出菜单）可能也需要透明化
                    "Pmenu",
                    "PmenuSel",
                    "PmenuSbar",
                    "PmenuThumb",
                    "Diagnostics:",
                },
                -- table: groups you don't want to clear
                exclude_groups = {},
                -- function: code to be executed after highlight groups are cleared
                -- Also the user event "TransparentClear" will be triggered
                on_clear = function() end,
            })
        end,
    },
    --主题
    {
        "folke/tokyonight.nvim",
        event = "VeryLazy",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    --状态栏
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_c = {
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { "filename", separator = "",   path = 1 },
                        { "filesize", separator = "" },
                    },
                    lualine_x = { "encoding", "fileformat" },
                    lualine_y = {
                        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
            })
        end,
    },
    -----------------缩进线
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("ibl").setup({})
        end,
    },
}
