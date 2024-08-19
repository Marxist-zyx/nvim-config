return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        -- 对错误警告的图标
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            update_in_insert = true,
            severity_sort = true,
        })

        -- Show line diagnostics automatically in hover window
        vim.o.updatetime = 250
        vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

        -----------诊断符号
        local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        ---------语言
        local servers = {
            "lua_ls",
            "jsonls",
            -- "cssls",
            "html",
            "pyright",
            "bashls",
            "clangd",
            "texlab",
            "marksman",
            "vimls",
            "jdtls",
            "fortls",
            -- "yamlls",
        }
        --------------快捷键
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            local keymap = vim.api.nvim_buf_set_keymap
            keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
            keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
            keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
            keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
            keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
            keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
            keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
            keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
            keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        for _, server in pairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    end,
}
