return {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle", -- enables :ASToggle command
    event = { "InsertLeave", "TextChanged", "FocusLost" },
    opts = {
        trigger_events = {
            immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
            defer_save = { "InsertLeave", "TextChanged" },
            cancel_deferred_save = { "InsertEnter" },
        },
        execution_message = nil,
    },
    keys = {
        {
            "<leader>as",
            "<cmd>ASToggle<CR>",
            desc = "Toggle AutoSave",
        },
    },
}
