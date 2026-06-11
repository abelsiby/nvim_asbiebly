return {
    {
        dir = vim.fn.stdpath("config"),
        name = "lite-tex-config",
        -- FIX 1: Tell Lazy to load on BOTH tex and plaintex
        ft = { "tex", "plaintex" },
        config = function()
            local lite_tex = require("lite-tex")
            lite_tex.setup({
                auto_compile = false
            })

            vim.api.nvim_create_autocmd("FileType", {
                -- FIX 2: Apply your keymaps to BOTH filetypes
                pattern = { "tex", "plaintex" },
                callback = function()
                    vim.keymap.set("n", "<leader>tc", ":TexCompile<CR>", { buffer = true, silent = true, desc = "Compile TeX" })
                    vim.keymap.set("n", "<leader>tp", ":TexPreview<CR>", { buffer = true, silent = true, desc = "Preview PDF" })
                    vim.keymap.set("n", "<leader>ta", ":TexAutoToggle<CR>", { buffer = true, silent = true, desc = "Toggle Auto Compile" })
                end,
            })
        end,
    }
}
