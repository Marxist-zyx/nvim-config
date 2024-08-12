return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        require("null-ls").setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.fprettify,
            },
        })
        require("null-ls").setup({
            -- you can reuse a shared lspconfig on_attach callback here
        })
    end,
}
