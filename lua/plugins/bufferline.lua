return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy", -- No need to load bufferline until UI is ready
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin", -- or "slant" / "thick"
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    -- Keymaps
    -- Use 'silent = true' to avoid command-line flicker
    -- Use 'noremap = true' to prevent recursive mapping issues
    local opts = { silent = true, noremap = true }
    -- Switch buffers in Normal Mode
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)

    -- Extra utility: Close current buffer
    vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", opts)
  end,
}
