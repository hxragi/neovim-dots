--- leader ---
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- nvim tree ---
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

--- neovim f1 help ---
vim.keymap.set({ "n", "v", "i" }, "<F1>", "<Nop>")

--- clipboard ---
vim.keymap.set({ "v" }, "<Leader>y", '"+y')

--- buffers ---
vim.keymap.set({ "n" }, "<Leader>bdd", '<cmd>%bd|edit#|bd#<CR>')

vim.keymap.set({ "n" }, "<Leader><Left>", '<cmd>:bp<CR>')
vim.keymap.set({ "n" }, "<Leader><Right>", '<cmd>:bn<CR>')

--- telescope ---
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
