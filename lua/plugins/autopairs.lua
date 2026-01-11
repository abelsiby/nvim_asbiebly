return {
  "windwp/nvim-autopairs",
  -- Load as soon as we enter insert mode
  event = "InsertEnter",
  -- Dependencies is good practice to ensure cmp is loaded if we're integrating
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true, -- Enable Treesitter integration
      ts_config = {
        lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
        javascript = { "template_string" },
      },
    })

    -- Integration with nvim-cmp
    -- This automatically adds '(' after selecting a function or method
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
