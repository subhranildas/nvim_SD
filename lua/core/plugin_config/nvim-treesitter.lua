require("nvim-treesitter").setup({
    -- Pursers
    ensure_installed = {
        "c",
        "cpp",
        "rust",
        "yaml",
        "toml",
        "lua",
        "python",
        "vim",
    },

    -- Syntax highlighting config
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Smart indentation config
    indent = {
      enable = true,
    }
})
