return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  lazy = false,
  -- Load for python/markdown since you're using Jupytext/Notebooks
  ft = { "python", "markdown", "quarto", "ipynb" },
  build = ":UpdateRemotePlugins",
  init = function()
    -- These MUST be set before the plugin loads
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 12
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_virt_text_max_lines = 1
    vim.g.molten_auto_open_output = true
  end,
  config = function()
    -- Keymaps
    local opts = { silent = true }
    vim.keymap.set("n", "<leader>mi", "<cmd>MoltenInit<cr>",
      { silent = true, desc = "Initialize Kernel" })
    vim.keymap.set("n", "<leader>me", "<cmd>MoltenEvaluateOperator<cr>",
      { silent = true, desc = "Run Operator" })
    vim.keymap.set("n", "<leader>ml", "<cmd>MoltenEvaluateLine<cr>",
      { silent = true, desc = "Run Line" })
    vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv",
      { silent = true, desc = "Run Visual" })
    vim.keymap.set("n", "<leader>mh", "<cmd>MoltenHideOutput<cr>",
      { silent = true, desc = "Hide Output" })
    -- Special handling for Notebook users
    -- Automatically import your Jupytext markdown code cells into Molten
    vim.keymap.set("n", "<leader>ip", function()
      local v = vim.fn.winsaveview()
      vim.cmd([[MoltenImportOutput]])
      vim.fn.winrestview(v)
    end, { desc = "Import Notebook Output" })
  end,
}
