return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "pylint" },
            c = { "cspell" },
            cpp = { "cspell" },
            java = { "checkstyle" },
        }

        local pylint = lint.linters.pylint

        local function get_python_path()
            local cwd = vim.fn.getcwd()
            local venv_python = cwd .. "/venv/bin/python"
            local dot_venv_python = cwd .. "/.venv/bin/python"

            if vim.fn.executable(dot_venv_python) == 1 then
                return dot_venv_python
            elseif vim.fn.executable(venv_python) == 1 then
                return venv_python
            else
                return "python3"
            end
        end

        pylint.cmd = get_python_path()

        pylint.args = {
            "-m",
            "pylint",
            "-f",
            "json",
            "--stdin-path",
            function()
                return vim.api.nvim_buf_get_name(0)
            end,
            "-",
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
