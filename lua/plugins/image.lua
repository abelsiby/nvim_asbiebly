return {
  "3rd/image.nvim",
  -- Load when opening files that might contain images
  ft = { "markdown", "quarto", "ipynb", "norg" },
  dependencies = {
    -- Ensure you have Luarocks installed, as this plugin needs 'magick'
    {
      "vhyrro/luarocks.nvim",
      priority = 1001, -- Must load before image.nvim
      opts = { rocks = { "magick" } },
    },
  },
  opts = {
    backend = "kitty",
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
    -- Added 0.11 specific ignore for the new float types
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "lspinfo", "blink-cmp-menu" },
    -- INTEGRATIONS: This is the key part for your Jupytext workflow
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki", "jupytext" }, -- Added jupytext
      },
      neorg = { enabled = true },
    },
  },
}
