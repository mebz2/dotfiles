local keymap = vim.keymap
local s = { silent = true }

-- go to normal mode
keymap.set("i", "jj", "<Esc>")

-- restart
keymap.set("n", "<leader>rr", ":restart<CR>", { silent = true })

-- oil
keymap.set("n", "-", ":Oil<CR>", { silent = true }) -- open explorer

-- neotree
keymap.set("n", "<leader>e", ":Neotree filesystem reveal right<CR>", { silent = true }) -- open explorer
keymap.set("n", "<leader>ce", ":Neotree close<CR>", { silent = true })                  -- open explorer

-- write and quit
keymap.set("n", "<leader>w", ":write<CR>")
keymap.set("n", "<leader>qq", ":qall<CR>")

-- move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- move between buffers
keymap.set("n", "<leader>bn", ":bnext<CR>", s)
keymap.set("n", "<leader>bp", ":bprev<CR>", s)

-- move up and down wrapped lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- go to end and beginning of the line
keymap.set({ "n", "v" }, "L", "$")
keymap.set({ "n", "v" }, "H", "^")

-- lsp keymaps
keymap.set("n", "K", vim.lsp.buf.hover)
keymap.set("n", "gd", vim.lsp.buf.definition)

-- update plugins
keymap.set("n", "<leader>ps", '<cmd>lua vim.pack.update()<CR>')

-- telescope keymaps
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>fh", builtin.help_tags)
keymap.set("n", "<leader>fb", builtin.buffers)
keymap.set("n", "<leader>fd", builtin.diagnostics)

-- miniharp keymaps
keymap.set("n", "<leader>m", '<cmd>lua require("miniharp").toggle_file()<CR>')
keymap.set("n", "<leader>l", '<cmd>lua require("miniharp").show_list()<CR>')
