return{
  -- amongst your other plugins
  {'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup{
          size = 15,
          open_mapping = [[<c-t>]], -- Press <Ctrl-t> to open the terminal
          shell = vim.o.shell, -- Use the default shell
        }
    end
  }
}
