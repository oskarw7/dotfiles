return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- setup mason-nvim-dap
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "codelldb",
                "python", -- mason installs debugpy
                "delve",
            },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

        require("dap-go").setup()
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup({
            enabled = true,
            virt_text_pos = "eol",
        })

        -- dapui setup
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- dap setup
        vim.keymap.set("n", "<F5>", function()
            dap.continue()
        end, { desc = "Debug: Start / Continue" })

        vim.keymap.set("n", "<F6>", function()
            dap.step_into()
        end, { desc = "Debug: Step Into" })

        vim.keymap.set("n", "<F7>", function()
            dap.step_over()
        end, { desc = "Debug: Step Over" })

        vim.keymap.set("n", "<F8>", function()
            dap.step_out()
        end, { desc = "Debug: Step Out" })

        vim.keymap.set("n", "<F9>", function()
            dap.step_back()
        end, { desc = "Debug: Step Back" })

        vim.keymap.set("n", "<F10>", function()
            dap.restart()
        end, { desc = "Debug: Restart" })

        vim.keymap.set("n", "<F11>", function()
            dap.terminate()
        end, { desc = "Debug: Terminate" })

        vim.keymap.set("n", "<F12>", function()
            dap.disconnect()
        end, { desc = "Debug: Disconnect" })

        vim.keymap.set("n", "<Leader>db", function()
            dap.toggle_breakpoint()
        end, { desc = "Debug: Toggle Breakpoint" })

        vim.keymap.set("n", "<Leader>dB", function()
            dap.set_breakpoint()
        end, { desc = "Debug: Set Breakpoint (Log/Condition)" })

        -- LLDB setup
        dap.configurations.c = {
            {
                name = "Launch C Program",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c

        -- DEBUGPY setup
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- current file
                pythonPath = function()
                    -- Use venv if available, fallback to system python
                    local venv_path = os.getenv("VIRTUAL_ENV")
                    if venv_path then
                        return venv_path .. "/bin/python"
                    else
                        return "python3"
                    end
                end,
            },
        }
    end,
}
