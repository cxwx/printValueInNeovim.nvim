if vim.g.loaded_printValueInNeovim then
  return
end
vim.g.loaded_printValueInNeovim = true

vim.api.nvim_create_user_command("PrintValue", function()
  require("printValueInNeovim").show()
end, { desc = "Display lua value under cursor" })
