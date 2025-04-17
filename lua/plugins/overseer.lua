return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
      vim.keymap.set("n", "<leader>oo", "<cmd>OverseerToggle<CR>", { desc = "Toggle Overseer" })
    end,
  },
}

