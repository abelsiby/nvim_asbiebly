return {
  "quarto-dev/quarto-nvim",
  ft = { "quarto", "markdown" },
  dependencies = {
    -- Otter provides the "LSP inside LSP" magic for code chunks
    {
      "jmbuhr/otter.nvim",
      opts = {
        buffers = {
          set_filetype = true,
        },
      },
    },
    "hrsh7th/nvim-cmp",
  },
  opts = {
    lspFeatures = {
      enabled = true,
      languages = { "r", "python", "rust", "lua" },
      chunks = "all",
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "molten", -- Matches your Molten setup
      ft_runners = { python = "molten" },
      never_run = { "yaml" },
    },
    -- We disable default keymaps to use our custom LspAttach ones
    keymap = {
      enabled = false,
    },
  },
  config = function(_, opts)
    local quarto = require("quarto")
    quarto.setup(opts)
    -- Custom Quarto Keymaps
    vim.keymap.set("n", "<leader>qp", quarto.quartoPreview, { desc = "Quarto Preview" })
    vim.keymap.set("n", "<leader>qq", quarto.quartoClosePreview, { desc = "Close Preview" })
    -- Integration with Molten: Run cells
    vim.keymap.set("n", "<leader>rc", "<cmd>QuartoSend<cr>", { desc = "Run Cell" })
    vim.keymap.set("n", "<leader>ra", "<cmd>QuartoSendAll<cr>", { desc = "Run All Cells" })
  end,
}
