vim.cmd("let g:netrw_liststyle = 3")

-- Add autocommand to keep background of nvim transparent for NvimTree
local nvimtree_transparent_group = vim.api.nvim_create_augroup("NvimTreeTransparent", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = nvimtree_transparent_group,
    callback = function()
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
    end,
})

-- Remove Trailing Whitespaces from following files
local trim_trailing_ws_group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = trim_trailing_ws_group,
    pattern = {
        "*.c",
        "*.h",
        "*.sh",
        "*.md",
        "*.txt",
        "*.lua",
        "*.js",
        "*.py",
    },
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
    end,
})
