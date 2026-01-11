return {
  "jmbuhr/otter.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  opts = {
    lsp = {
      -- This ensures diagnostics don't look messy in markdown
      diagnostic_update_in_insert = false,
    },
    buffers = {
      -- Set to false if you don't want Otter to handle the background buffer
      set_filetype = true,
    },
  },
}
