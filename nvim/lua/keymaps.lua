local keymap = vim.keymap
local s = {silent = true}

keymap.set("i", "jj", "<Esc>")

keymap.set("n", "<leader>e", ":Explore<CR>", {silent = true}) -- open explorer

keymap.set("n", "<leader>w", ":write<CR>" )
keymap.set("n", "<leader>q", ":q<CR>")

-- move up and down wrapped lines
keymap.set("n", "j", "gj") 
keymap.set("n", "k", "gk")

-- go to end and beginning of the line
keymap.set({"n", "v"}, "L", "$")
keymap.set({"n", "v"}, "H", "^")

keymap.set("n", "K", vim.lsp.buf.hover)
keymap.set("n", "K", vim.lsp.buf.definition)

keymap.set("n", "<leader>bn", ":bnext<CR>", s)
keymap.set("n", "<leader>bp", ":bprev<CR>", s)

keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }, s)
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" }, s)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" }, s)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" }, s)


