return{
--语法高亮，彩色括号
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "p00f/nvim-ts-rainbow" },
      event = 'VeryLazy',
      config = function()
        require "nvim-treesitter.configs".setup {
          -- 选择需要高亮的语法
          ensure_installed = { "bash", "c", "cpp", "css", "go", "html", "java", "javascript", "latex", "lua", "markdown", "python", "vim" },
    
          -- 启用高亮
          highlight = { enable = true },
    
          -- 启用彩色括号
          rainbow = { enable = true, extended_mode = true, max_file_lines = nil}
        }
      end
     },
}
