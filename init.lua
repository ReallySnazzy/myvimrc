vim.o.guifont = "MonoLisa Nerd Font:h12"
vim.o.clipboard = "unnamedplus"
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.o.number = true

-- Auto install lazy if missing
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

-- Setup leader for lazy and plugins after lazy is setup
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove trailing spaces in Lua files to silence the annoying linter
vim.api.nvim_create_autocmd(
  {"BufWritePre"},
  {
    pattern = { "*.lua" },
    command = [[%s/\s\+$//e]],
  }
)

require("lazy").setup("plugins")

