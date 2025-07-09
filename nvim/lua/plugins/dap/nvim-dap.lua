return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- setup mason-nvim-dap
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "codelldb",
                "python", -- mason installs debugpy
            },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

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
        end)
        vim.keymap.set("n", "<F6>", function()
            dap.terminate()
        end)
        vim.keymap.set("n", "<F10>", function()
            dap.step_over()
        end)
        vim.keymap.set("n", "<F11>", function()
            dap.step_into()
        end)
        vim.keymap.set("n", "<F12>", function()
            dap.step_out()
        end)
        vim.keymap.set("n", "<Leader>db", function()
            dap.toggle_breakpoint()
        end)
        vim.keymap.set("n", "<Leader>dB", function()
            dap.set_breakpoint()
        end)

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
