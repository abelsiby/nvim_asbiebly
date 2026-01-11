return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua formatting
        null_ls.builtins.formatting.stylua,
        -- C++ formatting (since you have clangd in Mason)
        null_ls.builtins.formatting.clang_format,
      },
    })

    -- Neovim 0.11 prefers this keymap style
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format Buffer" })
  end,
}
