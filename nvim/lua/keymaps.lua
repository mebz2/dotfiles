local keymap = vim.keymap
local s = { silent = true }

-- select all
keymap.set("n", "<C-a>", "go<S-v>G")
-- go to normal mode
keymap.set("i", "jj", "<Esc>")

-- change working directory
keymap.set("n", "<leader>cd", ":cd %:p:h<CR>")

-- configuration
keymap.set("n", "<leader>cc", ":edit $MYVIMRC<CR>")
-- semi colon to colon
keymap.set("n", ";", ":");

-- restart
keymap.set("n", "<leader>rr", ":restart<CR>", { silent = true })

-- oil
keymap.set("n", "-", ":Oil<CR>", { silent = true }) -- open explorer

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

--Nvimtree keymaps
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-n>", ":wincmd p<CR>")

-- telescope keymaps
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>fh", builtin.help_tags)
keymap.set("n", "<leader>fb", builtin.buffers)
keymap.set("n", "<leader>fd", builtin.diagnostics)
keymap.set("n", "<leader>fm", builtin.marks)

-- harpoon keymaps
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>a", function() harpoon:list():add() end)
keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local themes = require("telescope.themes")
-- local function toggle_telescope(harpoon_files)
-- 	local file_paths = {}
-- 	for _, item in ipairs(harpoon_files.items) do
-- 		table.insert(file_paths, item.value)
-- 	end
--
-- 	require("telescope.pickers").new(
-- 		themes.get_dropdown({}), {
-- 			prompt_title = "Harpoon",
-- 			finder = require("telescope.finders").new_table({
-- 				results = file_paths,
-- 			}),
-- 			previewer = conf.file_previewer({}),
-- 			sorter = conf.generic_sorter({}),
-- 		}):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end)
