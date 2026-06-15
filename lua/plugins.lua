-- Catppuccin Theme
require('catppuccin').setup({
  transparent_background = true,
})
vim.cmd('colorscheme catppuccin-mocha')

-- Nvim Tree
require('nvim-tree').setup({
  view = {
    side = "right",
    width = 45,
  },
})

-- Mini Tabline
require('mini.tabline').setup()

-- Mini Statusline
require('mini.statusline').setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git = MiniStatusline.section_git({ trunc_width = 75 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineLocation", strings = { location } },
      })
    end,
  },
})

-- Treesitter
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

-- Blink CMP
require('blink-cmp').setup({
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 5000 },
    menu = {
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    trigger = { prefetch_on_insert = false },
  },
  signature = {
    enabled = false,
    trigger = {
      enabled = false,
      show_on_trigger_character = false,
      show_on_insert_on_trigger_character = false,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

-- Autopairs
require("nvim-autopairs").setup()

-- Noice
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = true,
      view = "hover",
    },
    signature = {
      enabled = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
})

-- Cord
require('cord').setup({
  editor = { tooltip = "💻 Neovim <3" },
  idle = { enabled = false },
  display = { theme = "catppuccin" },
})
