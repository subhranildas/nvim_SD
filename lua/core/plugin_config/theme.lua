local M = {}

-- Available themes
M.themes = {
    "kanagawa",
    "gruvbox",
}

-- Current theme index
M.current = 1

----------------------------------------------------
-- Theme implementations
----------------------------------------------------

local function load_gruvbox()
    vim.g.gruvbox_transparent_bg = true
    vim.opt.background = "dark"
    vim.cmd.colorscheme("gruvbox")
    vim.o.termguicolors = true
end

local function load_kanagawa()
  vim.o.termguicolors = true
  require("kanagawa").setup({
    compile = false,
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    theme = "wave", -- wave, dragon, lotus
    colors = {},
    overrides = function(colors)
        return {}
    end,
  })

  vim.cmd.colorscheme("kanagawa")
end

local loaders = {
    gruvbox = load_gruvbox,
    kanagawa = load_kanagawa,
}

----------------------------------------------------
-- Public API
----------------------------------------------------

function M.load(theme)
    if loaders[theme] then
        loaders[theme]()
    else
        vim.notify("Unknown theme: " .. theme, vim.log.levels.ERROR)
    end
end

function M.next()
    M.current = M.current % #M.themes + 1
    M.load(M.themes[M.current])
end

function M.previous()
    M.current = (M.current - 2) % #M.themes + 1
    M.load(M.themes[M.current])
end

----------------------------------------------------
-- Keymaps
----------------------------------------------------

vim.keymap.set(
    "n",
    "<leader>ct",
    M.next,
    { desc = "Next Theme" }
)

vim.keymap.set(
    "n",
    "<leader>cT",
    M.previous,
    { desc = "Previous Theme" }
)

----------------------------------------------------
-- Initial theme
----------------------------------------------------

M.load(M.themes[M.current])

return M
