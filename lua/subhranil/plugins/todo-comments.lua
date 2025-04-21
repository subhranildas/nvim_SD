return {
    "folke/todo-comments.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local todo_comments = require("todo-comments")

        -- Set Keymaps
        local keymap = vim.keymap

        keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, {desc = "Next todo Comment"})

        keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, {desc = "Next todo Comment"})

        todo_comments.setup({

            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {

                -- FIX:
                -- IMPORTANT:
                -- TODO:
                -- HACK:
                -- WARN:
                -- PERF:
                -- NOTE:
                -- TEST:

                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },

                TODO = {
                    icon = " ",
                    color = "info"
                },

                HACK = {
                    icon = " ",
                    color = "warning"
                },

                WARN = {
                    icon = " ",
                    color = "warning",
                    alt = { "WARNING", "XXX" }
                },

                PERF = {
                    icon = " ",
                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },

                NOTE = {
                    icon = " ",
                    color = "hint",
                    alt = { "INFO" }
                },

                IMPORTANT = {
                    icon = " ",
                    color = "important"
                },

                TEST = {
                    icon = "⏲ ",
                    color = "test",
                    alt = { "TESTING", "PASSED", "FAILED" }
                },
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" },
                important = { "#217303" }
            },
        })

    end,
}
