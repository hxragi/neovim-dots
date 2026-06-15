-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable F1 help
vim.keymap.set({ "n", "v", "i" }, "<F1>", "<Nop>")

-- Clipboard
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Yank to clipboard" })

-- Buffers
vim.keymap.set("n", "<Leader>bdd", '%bd|edit#|bd#<CR>', { desc = "Delete all buffers except current" })
vim.keymap.set("n", "<Leader><Left>", '<cmd>bp<CR>', { desc = "Previous buffer" })
vim.keymap.set("n", "<Leader><Right>", '<cmd>bn<CR>', { desc = "Next buffer" })

-- File Explorer (nvim-tree)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Telescope
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Live grep' })
