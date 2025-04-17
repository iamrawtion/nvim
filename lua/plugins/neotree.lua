return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- { "3rd/image.nvim", opts = {} }, -- Optional image preview support
    },
    lazy = false,
    keys = {
      { "<leader>e",  "<cmd>Neotree toggle<CR>",           desc = "Toggle Neo-tree" },
      { "<leader>ef", "<cmd>Neotree float toggle<CR>",     desc = "Neo-tree (Float)" },
      { "<leader>eb", "<cmd>Neotree buffers toggle<CR>",   desc = "Neo-tree Buffers" },
      { "<leader>eg", "<cmd>Neotree git_status toggle<CR>",desc = "Neo-tree Git Status" },
      { "<leader>er", "<cmd>Neotree reveal<CR>",           desc = "Neo-tree Reveal File" },
    },
    opts = {
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  }
}

