require("mason").setup({
    ui = {
        border = "rounded",

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },

    max_concurrent_installers = 4,
})

require("mason-tool-installer").setup({
    ensure_installed = {
        ----------------------------------------------------------------
        -- Language Servers
        ----------------------------------------------------------------
        "clangd",
        "rust-analyzer",

        ----------------------------------------------------------------
        -- Formatters
        ----------------------------------------------------------------

        ----------------------------------------------------------------
        -- Linters
        ----------------------------------------------------------------

        ----------------------------------------------------------------
        -- Debuggers
        ----------------------------------------------------------------
    },

    auto_update = false,
    run_on_start = true,
    start_delay = 3000,
    debounce_hours = 24,
})
