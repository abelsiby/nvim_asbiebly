return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- Keymaps to trigger the terminal can be defined here or in config
  keys = {
    { [[<C-t>]], "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  opts = {
    size = 15,
    open_mapping = [[<c-t>]], -- Keep your existing mapping
    hide_numbers = true,      -- Hide line numbers in terminal windows
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = "horizontal", -- or 'vertical' | 'float' | 'tab'
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Better Terminal Navigation
    -- These mappings make it easier to switch between the terminal and other windows
    function _G.set_terminal_keymaps()
      local map_opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], map_opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], map_opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], map_opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], map_opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], map_opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], map_opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], map_opts)
    end

    -- apply the keymaps only in terminal buffers
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        set_terminal_keymaps()
      end,
    })
  end,
}