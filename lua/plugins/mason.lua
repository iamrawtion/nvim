return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "yamlls",
          "jsonls",
          "terraformls",
          "ansiblels",
          "lua_ls",
          "marksman",
          "pyright",
          "helm_ls",      -- for Helm charts
          "tflint",       -- Terraform linter
        },
        automatic_installation = true,
      })
    end,
  },
}

