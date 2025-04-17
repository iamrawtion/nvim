return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<leader>tt]],
        direction = "horizontal", -- or "vertical" or "float"
        shading_factor = 2,
        persist_size = true,
        shell = vim.o.shell,
      })

      -- Optional: terminal keymaps inside terminal mode
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      -- ✅ Auto-open terminal on Neovim start
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Only auto-open if a file is passed or cwd is a directory
          if vim.fn.argc() > 0 or vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
            vim.cmd("ToggleTerm direction=horizontal")
          end
        end,
      })
    end,
  }
}

