local indent_group = vim.api.nvim_create_augroup("LanguageIndentation", { clear = true })

local default_indent = {

    expandtab = true,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = 2,
}


local indent_by_filetype = {

    lua = {
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
    },

    python = {
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
    },

    c = {
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
    },

    cpp = {
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
    },

    rust = {
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
    },

    go = {
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
    },

    make = {
        expandtab = true,
        tabstop = 8,
        shiftwidth = 8,
        softtabstop = 8,
    },

    json = {
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
    },

    yaml = {
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
    },

    markdown = {
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
    },
}

vim.api.nvim_create_autocmd("FileType", {

    group = indent_group,
    pattern = "*",
    callback = function(event)
        local filetype = vim.bo[event.buf].filetype
        local opts = indent_by_filetype[filetype] or default_indent

          vim.bo[event.buf].expandtab = opts.expandtab
          vim.bo[event.buf].tabstop = opts.tabstop
          vim.bo[event.buf].shiftwidth = opts.shiftwidth
          vim.bo[event.buf].softtabstop = opts.softtabstop
    end,
})
