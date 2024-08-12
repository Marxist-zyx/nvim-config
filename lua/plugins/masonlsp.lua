return {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        -- mason 配置
        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- 定义一个包含多个包名的表（table）
        local packages_to_install = {
            "prettier", -- html markdown格式化
            "stylua", -- lua
            "black", --python
            "clang-format", --C/C++
            "fprettify", --fortran
        }

        -- 使用循环遍历包名列表并安装
        for _, package_name in ipairs(packages_to_install) do
            local registry = require("mason-registry")
            local package = registry.get_package(package_name)

            if package then
                if not package:is_installed() then
                    vim.notify(("[mason.nvim] %s is installing"):format(package))
                    package:install()
                end
            else
                vim.notify(("[mason.nvim] %s unexist"):format(package))
            end
        end
        require("mason-lspconfig").setup({
            -- 选择需要启动的 lsp 服务器的语言
            ensure_installed = {
                "bashls",
                "clangd",
                "html",
                "jdtls",
                "texlab",
                "lua_ls",
                "marksman",
                "pyright",
                "vimls",
                "fortls",
            },
        })
    end,
}
