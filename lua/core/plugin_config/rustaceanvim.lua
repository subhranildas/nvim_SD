local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.rustaceanvim = {
    server = {
        capabilities = capabilities,

        settings = {
            ["rust-analyzer"] = {
                inlayHints = {
                    bindingModeHints = {
                        enable = true,
                    },
                    chainingHints = {
                        enable = true,
                    },
                    closingBraceHints = {
                        enable = true,
                        minLines = 10,
                    },
                    closureReturnTypeHints = {
                        enable = "always",
                    },
                    lifetimeElisionHints = {
                        enable = "always",
                        useParameterNames = true,
                    },
                    parameterHints = {
                        enable = true,
                    },
                    typeHints = {
                        enable = true,
                    },
                },
            },
        },
    },
}

