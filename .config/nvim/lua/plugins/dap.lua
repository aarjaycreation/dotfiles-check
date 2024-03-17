local dap = require("dap")

dap.adapters.lldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/Users/afonso/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}
dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000
}

dap.configurations.c = {
    {
        name = "Manually start codelldb",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            local args = vim.fn.input('Arguments: ')
            return args ~= '' and { args } or nil
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
    {
        name = "Auto start codelldb",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            local args = vim.fn.input('Arguments: ')
            return args ~= '' and { args } or nil
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },

}
