return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    -- 按键设置
    vim.keymap.set("n", "<leader>]", ":bnext<CR>")
    vim.keymap.set("n", "<leader>[", ":bprevious<CR>")
    vim.keymap.set("n", "<leader>de", ":bdelete<CR>")

    require "bufferline".setup {
      options = {
        -- 使用 nvim 内置 lsp
        diagnostics = "nvim_lsp",

        -- 左侧让出 nvim-tree 的位置

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
 
    }
  }
  end
}
