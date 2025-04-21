vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  renderer = {
    root_folder_label = ":~:s?$?/..?",
    highlight_opened_files = "all",
    group_empty = true,
  },
  view = {
    adaptive_size = true,
    side = "left",
    preserve_window_proportions = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  },
})

local tree_api = require("nvim-tree.api")

-- Open file
vim.keymap.set("n", "<CR>", tree_api.node.open.edit, { desc = "Open file" })

-- Open in vertical split
vim.keymap.set("n", "<leader>v", tree_api.node.open.vertical, { desc = "Vertical Split" })

-- Open in horizontal split
vim.keymap.set("n", "<leader>s", tree_api.node.open.horizontal, { desc = "Horizontal Split" })

-- Open in new tab
vim.keymap.set("n", "<leader>t", tree_api.node.open.tab, { desc = "Open in Tab" })
