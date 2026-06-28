local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", {
    capabilities = capabilities,

    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--offset-encoding=utf-16",
    },
})

vim.lsp.enable("clangd")
