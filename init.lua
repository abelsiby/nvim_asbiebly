local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("vim-options")
require("lazy").setup("plugins")
vim.g.python3_host_prog=vim.fn.expand("~/.miniforge3/bin/python3") -- for conda use "~/.virtualenvs/neovim/bin/python3"

vim.g.loaded_python3_provider = nil
vim.cmd('runtime! plugin/rplugin.vim')

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.ipynb",
  callback = function()
    -- 1. Use Otter to provide LSP support for the code blocks
    -- This fixes syntax highlighting and adds autocompletion
    local status_ok, otter = pcall(require, "otter")
    if status_ok then
      otter.activate({"python"}, true, true, nil)
    end

    -- 2. Initialize Molten and Import existing outputs
    -- We use a schedule to ensure Jupytext has finished its conversion
    vim.schedule(function()
      if vim.fn.exists(":MoltenInit") > 0 then
        vim.cmd("MoltenInit")
        -- pcall prevents errors if the .ipynb has no saved output data
        pcall(function() vim.cmd("MoltenImportOutput") end)
      end
    end)
  end,
})
