-- define common options
vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- ---------- 正常模式 ----------
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<C-l>", "<C-w>l", opt)
keymap.set("n", "<C-h>", "<C-w>h", opt)
keymap.set("n", "<C-j>", "<C-w>j", opt)
keymap.set("n", "<C-k>", "<C-w>k", opt)
keymap.set("n", "<Leader>v", "<C-w>v", opt)
keymap.set("n", "<Leader>s", "<C-w>s", opt)

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

--退出与保存
keymap.set({"n", "v"},  "<leader>q", ":q<CR>", { noremap = true, silent = true })
keymap.set({"n", "v"},  "<leader>w", ":w<CR>", { noremap = true, silent = true })
