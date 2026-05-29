return {
  "marko-cerovac/material.nvim",
  version = false,
  lazy = false,
  priority = 1000, -- Essential: loads first to prevent "flicker"
  opts = {
    -- Options are: 'oceanic', 'lighter', 'deep ocean', 'palenight', 'main', or 'darker'
    style = "darker",
    italic_comments = true,
    disable_background = false, -- Set to true if you want a transparent background
    -- This is the specific config option for lualine
    -- Choices are: "default" or "stealth"
    lualine_style = "default",
  },
  config = function(_, opts)
    -- 1. Set the global variable for the style BEFORE loading
    vim.g.material_style = opts.style
    -- 2. Run the actual material setup with your options
    require('material').setup(opts)
    -- 3. Load the colorscheme
    vim.cmd([[colorscheme material]])
  end,
}
