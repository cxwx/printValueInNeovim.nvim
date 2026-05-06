# printValueInNeovim.nvim

在 Neovim 的 Lua 文件中，将光标放在表达式上即可在浮动窗口中查看该表达式的值和类型。

## 安装

使用 [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "cxwx/printValueInNeovim.nvim",
  ft = "lua",
  keys = {
    { ",oh", "<cmd>PrintNvimValue<cr>", ft = "lua", desc = "Display value in nvim" },
  },
}
```

可自定义按键，将 `,oh` 替换为任意键位即可。

## 使用

1. 打开一个 Lua 文件
2. 将光标放在任意 Lua 表达式上（变量名、函数调用、表字段等）
3. 按配置的快捷键（默认 `,oh`）查看该表达式的值和类型
4. 按 `q` 或 `Esc` 关闭浮动窗口

若表达式无法求值，会回退到 `vim.lsp.buf.hover()` 显示 LSP hover 信息。
