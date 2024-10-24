-- Basic
vim.g.mapleader = " "
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.cmd("filetype plugin on")

-- Temp
vim.keymap.set({"", "i"}, "<up>", "<nop>")
vim.keymap.set({"", "i"}, "<down>", "<nop>")
vim.opt.mouse = ''

-- Install Lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup("plugins")
