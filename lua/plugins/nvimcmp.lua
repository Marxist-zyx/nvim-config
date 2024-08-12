-- 检查
local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    -- event = { 'BufRead', 'BufNewFile' },
    dependencies = {
        "neovim/nvim-lspconfig",
        -- 补全插件
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        -- 第三方片段引擎
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        vim.cmd("LspStart")
        local cmp_ok, cmp = pcall(require, "cmp")
        local luasnip_ok, luasnip = pcall(require, "luasnip")
        if not cmp_ok or not luasnip_ok then
            return
        end

        local kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = " ",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = " ",
            Misc = " ",
        }
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            -- 片段引擎
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            -- 按键映射
            mapping = cmp.mapping.preset.insert({
                -- Ctrl+B 向上滚动补全列表
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                -- Ctrl+F 向下滚动补全列表
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- Ctrl+E 取消补全，ESC 也可以退出
                ["<C-e>"] = cmp.mapping.abort(),
                -- 回车 选定补全选项
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- Tab 在列表中选择补全选项或者跳到下一个可输入位置
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- Shift+Tab 返回上一个输入位置
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            -- 指定资源
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
        })
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
