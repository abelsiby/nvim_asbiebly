return {
  "GCBallesteros/jupytext.nvim",
  lazy = false, -- THIS IS THE KEY FIX
  -- Keep your existing opts and config below
  opts = {
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
    custom_language_formatting = {
      python = {
        extension = "md",
        style = "markdown",
        force_ft = "markdown",
      },
    },
  },
  config = function(_, opts)
    require("jupytext").setup(opts)
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*.ipynb",
      callback = function()
        vim.schedule(function()
          vim.cmd("LspStart")
        end)
      end,
    })
  end,
}
