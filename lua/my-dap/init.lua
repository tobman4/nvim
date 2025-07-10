local dap = require("dap")
local ui = require("dapui")

ui.setup()

dap.adapters.coreclr = {
  type = 'executable',
  command = os.getenv("NETCOREDBG_PATH") or "netcoredbg",
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

vim.api.nvim_set_keymap("n", "db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", ":DapContinue<CR>", { noremap= true })
vim.api.nvim_set_keymap("n", "<F9>", ":DapStepOver<CR>", { noremap= true })

require("my-dap.python")
