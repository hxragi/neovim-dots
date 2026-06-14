vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-mini/mini.tabline',
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/Saghen/blink.cmp', branch = "v1" },
})

--- catppuccin theme ---
require('catppuccin').setup({
  transparent_background = true,
})
vim.cmd('colorscheme catppuccin-mocha')

--- nvim tree ---
require('nvim-tree').setup({
  view = {
    side = "right",
  },
})

--- tabline ---
require('mini.tabline').setup()

--- statusline ---
require('mini.statusline').setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = MiniStatusline.section_git({ trunc_width = 75 })
      local diagnostics    = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename       = MiniStatusline.section_filename({ trunc_width = 140 })
      local location       = MiniStatusline.section_location({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        { hl = "MiniStatuslineDevinfo",  strings = { git, diagnostics } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineLocation", strings = { location } },
      })
    end,
  },
})

--- treesitter ---
require('nvim-treesitter').setup()
require('nvim-treesitter').install({
  "rust", "java", "lua", "python", "bash",
  "yaml", "toml", "vim", "vimdoc", "markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "java", "lua", "python", "bash", "yaml", "toml", "vim", "vimdoc", "markdown" },
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match) or args.match
    if vim.treesitter.language.add(lang) then
      vim.treesitter.start()
    end
  end,
})

--- blink cmp ---
require('blink-cmp').setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
  },
})
