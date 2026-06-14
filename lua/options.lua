local opt = vim.opt

opt.showcmd = true
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 700
opt.signcolumn = "yes"
opt.list = true
vim.g.termguicolors = true
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
opt.listchars = "tab:»·,trail:·,nbsp:·"
vim.diagnostic.config({ virtual_text = true })
vim.lsp.log.set_level("warn")
opt.laststatus = 3
opt.mousescroll = "ver:0,hor:0"
opt.mouse = ""
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"

