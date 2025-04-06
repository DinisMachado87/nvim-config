-- Set tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Ensure spaces instead of tabs
vim.opt.smartindent = true -- Enable smart indenting
-- Set line numbering and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Set shell to bash
vim.opt.shell = "/bin/bash"
-- Keymap to exit insert mode with 'jk' or 'kj'
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
-- Set leader key
vim.g.mapleader = " "
-- @ ~/.config/nvim/lua/config/lazy.lua
require("config.lazy")
-- auto added code by nalebrun header42
local header = require('42header')
vim.api.nvim_create_user_command(
    'Header',
    function()
        header.insert_header()
    end,
    {}
)
-- Map F2 to insert 42 header
vim.api.nvim_set_keymap('n', '<F2>', ':Header<CR>', { noremap = true, silent = true })



