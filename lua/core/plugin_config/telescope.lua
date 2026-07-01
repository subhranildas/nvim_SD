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
        ["<C-d>"] = require("telescope.actions").delete_buffer,
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

local function get_visual_selection()
  local _, ls, cs = unpack(vim.fn.getpos("'<"), 2, 3)
  local _, le, ce = unpack(vim.fn.getpos("'>"), 2, 3)

  if ls ~= le then
    return nil
  end

  local line = vim.fn.getline(ls)
  return line:sub(cs, ce)
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

-- Find selected String in visual mode
vim.keymap.set("v", "<leader>fg", function()
  local builtin = get_telescope_builtin()
  if builtin == nil then
    return
  end

  -- Save current register
  local saved_reg = vim.fn.getreg('"')

  -- Yank visual selection
  vim.cmd('normal! "vy')
  local text = vim.fn.getreg('v')

  -- Restore register
  vim.fn.setreg('"', saved_reg)

  builtin.live_grep({
    default_text = text,
    previewer = true,
  })
end, { desc = "Find visual selection" })

vim.keymap.set("n", "<leader>fb", function()
  local builtin = get_telescope_builtin()
  if builtin == nil then
    return
  end

  builtin.live_grep({
    grep_open_files = true,
    previewer = true,
  })
end, { desc = "Find String in Open Buffers" })

vim.keymap.set("v", "<leader>fb", function()
  local builtin = get_telescope_builtin()
  if builtin == nil then
    return
  end

  -- Save current register
  local saved_reg = vim.fn.getreg('"')

  -- Yank visual selection
  vim.cmd('normal! "vy')
  local text = vim.fn.getreg('v')

  -- Restore register
  vim.fn.setreg('"', saved_reg)

  builtin.live_grep({
    grep_open_files = true,
    default_text = text,
    previewer = true,
  })
end, { desc = "Find Visual Selection in Open Buffers" })

-- To open files in buffer
vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<CR>", { desc = "Open Buffer Select" })

