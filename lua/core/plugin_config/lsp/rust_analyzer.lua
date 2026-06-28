return {
    cmd = { "rust-analyzer" },

    filetypes = { "rust" },

    settings = {
        ["rust-analyzer"] = {

            cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                    enable = true,
                },
            },

            checkOnSave = true,

            check = {
                command = "clippy",
            },

            procMacro = {
                enable = true,
            },

            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },

            completion = {
                postfix = {
                    enable = true,
                },
            },

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
}
