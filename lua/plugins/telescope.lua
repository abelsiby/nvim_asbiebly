return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    -- Change opts to a function to avoid the "module not found" error
    opts = function()
      return {
        defaults = {
          path_display = { "smart" },
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("ui-select")

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
      map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
      map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Old Files" })
      map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy Search Buffer" })
      map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP References" })
      map("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
    end,
  },
}
