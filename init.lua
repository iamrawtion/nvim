require("config.options")        -- vim options like tab width
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  end,
})

-- Close all windows together
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    -- Close Neo-tree if it's open
    pcall(function()
      require("neo-tree.command").execute({ action = "close" })
    end)

    -- Close all ToggleTerm instances
    pcall(function()
      local terms = require("toggleterm.terminal").get_all()
      for _, term in ipairs(terms) do
        term:shutdown()  -- closes buffer, removes state
      end
    end)
  end,
})


