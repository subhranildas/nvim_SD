require("ibl").setup({
    indent = {
        char = "│",
    },

    scope = {
        enabled = true,
    },

    exclude = {
        filetypes = {
            "help",
            "dashboard",
            "NvimTree",
            "lazy",
            "mason",
            "TelescopePrompt",
            "terminal",
        },
    },
})

-- Main context block background
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })

-- Context line numbers background (keeps it uniform)
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#232731", fg = "#5c6370" })

-- Add a crisp bottom border under the sticky header
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#4b5263" })
