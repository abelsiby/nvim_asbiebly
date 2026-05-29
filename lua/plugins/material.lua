return {
  "marko-cerovac/material.nvim",
  version = false,
  lazy = false,
  priority = 1000, -- Essential: loads first to prevent "flicker"
  opts = {
    -- Options are: 'oceanic', 'lighter', 'deep ocean', 'palenight', 'main', or 'darker'
    style = "darker",
    -- Customizations (optional, matching your previous setups)
    italic_comments = true,
    disable_background = false, -- Set to true if you want a transparent background
  },
  config = function(_, opts)
    -- Set the global variable for the style BEFORE loading the colorscheme
    vim.g.material_style = opts.style
    -- Load the colorscheme
    vim.cmd([[colorscheme material]])
  end,
}
