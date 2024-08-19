local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { import = "plugins.ui" },   --ui界面
        { import = "plugins.bufferline" }, --缓冲区
        { import = "plugins.tree" }, --文件树
        { import = "plugins.treesitter" }, --语法高亮
        { import = "plugins.autopairs" }, --自动括号
        { import = "plugins.whichkey" }, --快捷键
        { import = "plugins.telescope" }, --模糊查找
        { import = "plugins.nvimcmp" }, --自动补全
        { import = "plugins.masonlsp" }, --lsp管理
        { import = "plugins.lspconfig" }, --lsp配置
        { import = "plugins.trouble" }, --错误提示
        { import = "plugins.nonels" }, --代码格式化插件
        { import = "plugins.vimtex" }, --代码格式化插件
    },
})
