-- Autocommand to remove trailing white spaces
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local view = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.c", "*.h" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- LSP related auto command to enable the lsp inlay hint
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end
    end,
})

