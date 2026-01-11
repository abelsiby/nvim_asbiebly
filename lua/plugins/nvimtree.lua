return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- Recommended to keep false if you want it to hijack netrw on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- 0.11 Optimization: Better defaults for high-res/modern terminals
    view = {
      width = 35,
      side = "left",
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".DS_Store" },
    },
    actions = {
      open_file = {
        quit_on_open = false,
        -- This ensures nvim-tree plays nice with your bufferline
        window_picker = {
          enable = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    -- Keymaps using the modern <cmd> syntax for 0.11
    -- These are faster as they execute in the background without entering command mode
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Tree" })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus File Tree" })
  end,
}