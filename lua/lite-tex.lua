-- lua/lite-tex.lua
local M = {}

-- Default configuration
M.config = {
    compiler = "pdflatex",
    -- standard args to prevent the compiler from hanging on errors
    compiler_args = { "-interaction=nonstopmode", "-file-line-error", "-halt-on-error" },
    -- Determine the default viewer based on the OS
    viewer = (vim.fn.has("mac") == 1 and "open") or (vim.fn.has("unix") == 1 and "xdg-open") or "SumatraPDF",
    auto_compile = false,
}

-- Setup function to override defaults and map commands
function M.setup(user_opts)
    M.config = vim.tbl_deep_extend("force", M.config, user_opts or {})

    -- Create Neovim User Commands
    vim.api.nvim_create_user_command("TexCompile", M.compile, { desc = "Compile current LaTeX buffer" })
    vim.api.nvim_create_user_command("TexPreview", M.preview, { desc = "Open compiled PDF" })
    vim.api.nvim_create_user_command("TexAutoToggle", M.toggle_auto_compile, { desc = "Toggle compile on save" })

    -- Set up an autocmd group for TeX files
    local group = vim.api.nvim_create_augroup("LiteTexGroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = "*.tex",
        callback = function()
            if M.config.auto_compile then
                M.compile()
            end
        end,
    })
end

-- Async compile function
function M.compile()
    local file = vim.fn.expand("%:p")
    if file == "" or vim.bo.filetype ~= "tex" then
        vim.notify("Not a valid TeX file", vim.log.levels.ERROR, { title = "LiteTex" })
        return
    end

    local cmd = { M.config.compiler }
    for _, arg in ipairs(M.config.compiler_args) do
        table.insert(cmd, arg)
    end
    -- Add the output directory so the PDF generates next to the tex file
    table.insert(cmd, "-output-directory=" .. vim.fn.expand("%:p:h"))
    table.insert(cmd, file)

    vim.notify("Compiling...", vim.log.levels.INFO, { title = "LiteTex" })

    -- Run the compile job asynchronously
    vim.fn.jobstart(cmd, {
        on_exit = function(_, code)
            if code == 0 then
                vim.notify("Compilation successful!", vim.log.levels.INFO, { title = "LiteTex" })
            else
                vim.notify("Compilation failed. Check your syntax.", vim.log.levels.ERROR, { title = "LiteTex" })
            end
        end,
    })
end

-- Function to open the PDF viewer
function M.preview()
    local pdf_file = vim.fn.expand("%:p:r") .. ".pdf"
    if vim.fn.filereadable(pdf_file) == 0 then
        vim.notify("PDF not found. Compile first!", vim.log.levels.ERROR, { title = "LiteTex" })
        return
    end

    local cmd = { M.config.viewer, pdf_file }
    -- Start the viewer detached from Neovim so closing Neovim doesn't kill the viewer
    vim.fn.jobstart(cmd, { detach = true })
end

-- Toggle automatic compilation on save
function M.toggle_auto_compile()
    M.config.auto_compile = not M.config.auto_compile
    local status = M.config.auto_compile and "Enabled" or "Disabled"
    vim.notify("Auto-compile on save: " .. status, vim.log.levels.INFO, { title = "LiteTex" })
end

return M
