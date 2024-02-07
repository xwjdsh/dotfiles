-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
	noremap = true,
	silent = true,
}

map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 复制粘贴到系统剪贴板
map("v", "<C-c>", '"+y', opt)
map("n", "<C-v>", '"+p', opt)

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 窗口跳转
map("n", "<leader>w", "<C-w>w", opt)

-- plugins
-- nvim-tree 打开/关闭
map("n", "<leader>f", ":NvimTreeToggle<CR>", opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-x>", ":BufferLinePickClose<CR>", opt)
map("n", "<leader>bgt", ":BufferLineGroupToggle ", { silent = false, nowait = true })
map("n", "<leader>bgc", ":BufferLineGroupClose ", { silent = false, nowait = true })

-- fzf-lua
map("n", "<c-p>", ":FzfLua files<CR>", opt)
map("n", "<c-g>", ":FzfLua grep<CR>", opt)
map("n", "<leader>l", ":FzfLua buffers<CR>", opt)
map("n", "<leader>g", ":FzfLua git_status<CR>", opt)
