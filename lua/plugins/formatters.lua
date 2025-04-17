return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          sh = { "shfmt" },
          json = { "jq" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          terraform = { "terraform_fmt" },
        },
      })
    end,
  },
}

