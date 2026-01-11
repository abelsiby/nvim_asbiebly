return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- Essential: loads first to prevent "flicker"
  opts = {
    -- "hard", "medium" (default), or "soft"
    background = "medium",
    italic_comments = true,
    transparent_background = false,
    ui_contrast = "low",
    diagnostic_line_highlight = true,
  },
  config = function(_, opts)
    -- Initialize the plugin with options
    require("everforest").setup(opts)
    -- Load the colorscheme
    vim.cmd([[colorscheme everforest]])
  end,
}
