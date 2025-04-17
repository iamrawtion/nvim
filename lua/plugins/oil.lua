return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = false, -- You can set this true if replacing neo-tree
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["<CR>"] = "actions.select",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["g."] = "actions.toggle_hidden",
        },
      })

      -- Optional: keymap to open oil at current path
      vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>", { desc = "Open parent directory (oil)" })
    end,
  },
}

