return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- Ensure these specific parsers are present
    ensure_installed = { "lua", "python", "markdown", "markdown_inline" },
    highlight = {
      enable = true,
      -- FIX: For some themes, setting this to true for markdown 
      -- helps resolve "flat" colors in fenced blocks.
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- Using the correct 0.11 module call
    require("nvim-treesitter").setup(opts)
    -- FORCE Neovim to recognize python inside markdown
    vim.g.markdown_fenced_languages = {
      "python",
      "py=python",
    }
  end,
}
