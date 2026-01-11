return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy", -- Load after the UI starts for better performance
  opts = {
    options = {
      -- Match your Everforest theme from the previous step
      theme = "everforest",
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
      globalstatus = true, -- Highly recommended for Neovim 0.11
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } }, -- Shows relative path
      lualine_x = {
        -- Custom component to show active LSP clients
        {
          function()
            local msg = "No LSP"
            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(clients) == nil then return msg end
            local client_names = {}
            for _, client in ipairs(clients) do
              table.insert(client_names, client.name)
            end
            return "[" .. table.concat(client_names, ", ") .. "]"
          end,
          icon = " ",
          color = { fg = "#a7c080", gui = "bold" },
        },
        "encoding",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}