return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({})
        },
      })

      telescope.load_extension("ui-select")

      -- Keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Help Tags' })
    end
  }
}

