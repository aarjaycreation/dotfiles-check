local dap = require("dap")

dap.adapters.lldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/Users/afonso/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.configurations.c = {
    {
        name = "codelldb: With args",
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

}

