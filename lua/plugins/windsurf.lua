return {
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        -- Optional config
        -- virtual_text = { enabled = true },
        -- enable_cmp_source = true,
        -- workspace_root = { use_lsp = true }
      })
    end,
  },
}

