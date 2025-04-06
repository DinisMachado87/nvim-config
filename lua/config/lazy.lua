-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require 'fluoromachine'
      fm.setup {
        glow = false,
        theme = 'fluoromachine',
        transparent = true,
      }
      vim.cmd.colorscheme 'fluoromachine'
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
    "nvim-treesitter/playground",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "javascript",
          "python",
          "html"
        },
        sync_install = false,
        highlight = { 
            enable = true,
            custom_captures = {
                ["@variable"] = "Identifier", -- Customize how @variable is highlighted
            }
        },
        indent = { enable = true },
        playground = {
            enable = true,
            updatetime = 25,
            persist_queries = false,
        }
      })
    end
  },
    {
      "Diogo-ss/42-header.nvim",
      cmd = { "Stdheader" },
      keys = { "<F1>" },
      opts = {
        default_map = true, -- Default mapping <F1> in normal mode.
        auto_update = true, -- Update header when saving.
        user = "dimachad", -- Your user.
        mail = "dimachad@student.42berlin.d"
      },
      config = function(_, opts)
        require("42header").setup(opts)
      end,
    }
}
local opts = {}
require("lazy").setup(plugins, opts)
-- Keymaps for telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Custom highlight settings
--
-- Customize color for struct name
--vim.api.nvim_set_hl(0, "@variable", { fg = "#ffb86c" }) --orange
vim.api.nvim_set_hl(0, "@variable", { fg = "#00b34d" }) --green
--vim.api.nvim_set_hl(0, "@variable", { fg = "#1a8cff" }) --blue
