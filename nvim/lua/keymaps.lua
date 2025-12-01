local k = vim.keymap
local s = { silent = true }

-- select all
k.set("n", "<C-a>", "go<S-v>G")
-- go to normal mode
k.set("i", "jj", "<Esc>")

-- change working directory
k.set("n", "<leader>cd", ":cd %:p:h<CR>")

-- configuration
k.set("n", "<leader>cc", ":edit $MYVIMRC<CR>")
-- semi colon to colon
k.set("n", ";", ":");

-- restart
k.set("n", "<leader>rr", ":restart<CR>", { silent = true })

-- oil
k.set("n", "-", ":Oil<CR>", { silent = true }) -- open explorer

-- write and quit
k.set("n", "<leader>w", ":write<CR>")
k.set("n", "<leader>lf", vim.lsp.buf.format)
k.set("n", "<leader>qq", ":qall<CR>")

-- move lines
k.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
k.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
k.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
k.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- move between buffers
k.set("n", "<leader>bn", ":bnext<CR>", s)
k.set("n", "<leader>bp", ":bprev<CR>", s)

-- move up and down wrapped lines
k.set("n", "j", "gj")
k.set("n", "k", "gk")

-- go to end and beginning of the line
k.set({ "n", "v" }, "L", "$")
k.set({ "n", "v" }, "H", "^")

-- lsp keymaps
k.set("n", "K", vim.lsp.buf.hover)
k.set("n", "gd", vim.lsp.buf.definition)
k.set("n", "<leader>rn", vim.lsp.buf.rename)

-- update plugins
k.set("n", "<leader>ps", '<cmd>lua vim.pack.update()<CR>')

--Nvimtree keymaps
k.set("n", "<leader>n", ":NvimTreeToggle<CR>")
k.set("n", "<C-n>", ":wincmd p<CR>")

-- telescope keymaps
local builtin = require("telescope.builtin")
k.set("n", "<leader>ff", builtin.find_files)
k.set("n", "<leader>fg", builtin.live_grep)
k.set("n", "<leader>fh", builtin.help_tags)
k.set("n", "<leader>fb", builtin.buffers)
k.set("n", "<leader>fd", builtin.diagnostics)
k.set("n", "<leader>fm", builtin.marks)

-- harpoon keymaps
local harpoon = require("harpoon")
harpoon:setup()
k.set("n", "<leader>a", function() harpoon:list():add() end)
k.set("n", "<leader>hn", function() harpoon:list():next() end)
k.set("n", "<leader>hp", function() harpoon:list():prev() end)
k.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
