require("gitsigns").setup({
    signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
    },
})

vim.api.nvim_set_hl(0, "GitSignsAdd", {
    -- fg = "#98c379",
    fg = "#5a8f5a",
})

vim.api.nvim_set_hl(0, "GitSignsChange", {
    fg = "#e5c07b",
})

vim.api.nvim_set_hl(0, "GitSignsDelete", {
    fg = "#e06c75",
})

