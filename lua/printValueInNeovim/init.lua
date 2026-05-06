local M = {}

function M.show()
  local expr = vim.fn.expand("<cexpr>")
  local loader = loadstring("return " .. expr)
  if loader then
    local status, result = pcall(loader)
    if status and result ~= nil then
      local lines = { "Value: " .. vim.inspect(result), "Type: " .. type(result) }
      local fbuf, fwin = vim.lsp.util.open_floating_preview(lines, "lua", {
        border = "rounded",
        focusable = true,
        focus = true,
      })
      if fwin then
        vim.api.nvim_set_current_win(fwin)
        local opts = { buffer = fbuf, silent = true, nowait = true }
        vim.keymap.set("n", "q", "<cmd>close<cr>", opts)
        vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", opts)
        vim.bo[fbuf].buflisted = false
        vim.bo[fbuf].bufhidden = "wipe"
      end
    else
      vim.lsp.buf.hover()
    end
  end
end

return M
