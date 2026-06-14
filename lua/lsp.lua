local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.enable({
  'rust_analyzer', 'jdtls', 'lua_ls', 'basedpyright',
  'bashls', 'yamlls', 'taplo',
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    vim.keymap.set("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    vim.keymap.set("n", "<Leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
    vim.keymap.set("n", "<Leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", vim.tbl_extend("force", opts, { desc = "Show references" }))
    vim.keymap.set("n", "<Leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", vim.tbl_extend("force", opts, { desc = "Show signature help" }))
    vim.keymap.set("n", "<Leader>gc", "<cmd>lua vim.lsp.buf.rename()<cr>", vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", vim.tbl_extend("force", opts, { desc = "Format buffer" }))
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", vim.tbl_extend("force", opts, { desc = "Code action" }))
  end,
})
