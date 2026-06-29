-- Unesed for now, use based on requirement
local rg_file_args = {
  "rg",
  "--files",
  "--hidden",
  "--follow",
  "--glob",
  "!**/.git/**",
  "--glob",
  "!**/build/**",
  "--glob",
  "!**/.cache/**",
  "--glob",
  "!**/__pycache__/**",
}

require("telescope").setup({
  defaults = {
    preview = {
      treesitter = false,
    },
    file_ignore_patterns = {
      "%.git/",
      "build/",
      ".cache/",
      "__pycache__/",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
})

-- Helper functions
-- Telescope workspace search
local function get_telescope_builtin()
  local ok, builtin = pcall(require, "telescope.builtin")
  if not ok then
    vim.notify("Telescope is not installed or not loaded", vim.log.levels.ERROR)
    return nil
  end
  return builtin
end

-- Get workspace root details
local function get_workspace_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]

  if git_root ~= nil and git_root ~= "" then
    return git_root
  end

  return vim.fn.getcwd()
end

-- Keymaps
-- Find files
vim.keymap.set("n", "<leader>ff", function()

  local builtin = get_telescope_builtin()
  if builtin == nil then
    return
  end

  builtin.find_files({
    hidden = true,
    previewer = true,
  })
end, { desc = "Find files in Workspace" })

-- Find String
vim.keymap.set("n", "<leader>fg", function()

  local builtin = get_telescope_builtin()
  if builtin == nil then
    return
  end

  builtin.live_grep({
    previewer = true,
  })
end, { desc = "Find String From Current Directory" })

-- To open files in buffer
vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<CR>", { desc = "Open Buffer Select" })

