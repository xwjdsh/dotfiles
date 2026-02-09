local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

map("v", "<C-c>", '"+y', { desc = "Copy to system pasteboard" })
map({ "n", "i" }, "<C-v>", '"+p', { desc = "Paste from system pasteboard" })

-- save file
map("n", "ss", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- windows
map("n", "<leader>w", "<C-W>p", { desc = "Other window", remap = true })
map("n", "sc", "<C-w>c", { desc = "Close current", remap = true })
map("n", "so", "<C-w>o", { desc = "Close others", remap = true })
map("n", "sv", ":vsp<CR>", { desc = "Split vertical", remap = true })
map("n", "sh", ":sp<CR>", { desc = "Split horizontal", remap = true })

function LAZYGIT_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
	})
	lazygit:toggle()
end

function LAZYDOCKER_TOGGLE()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazydocker = Terminal:new({
		cmd = "lazydocker",
		direction = "float",
	})
	lazydocker:toggle()
end

-- lazygit && lazydocker
map("n", "<leader>gg", "<cmd>lua LAZYGIT_TOGGLE()<CR>", { desc = "lazygit", noremap = true, silent = true })
map("n", "<leader>dd", "<cmd>lua LAZYDOCKER_TOGGLE()<CR>", { desc = "lazydocker", noremap = true, silent = true })

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
