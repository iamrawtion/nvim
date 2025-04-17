return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim", -- for extras like eslint, ruff
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- 📦 Formatters
          null_ls.builtins.formatting.shfmt,            -- shell
          null_ls.builtins.formatting.prettier,         -- yaml, json, markdown, html, etc.
          null_ls.builtins.formatting.terraform_fmt,    -- Terraform

          -- 🧹 Linters / Diagnostics
          null_ls.builtins.diagnostics.yamllint,        -- YAML
          require("none-ls.diagnostics.eslint"),        -- JS/TS
          require("none-ls.diagnostics.ruff"),          -- Python

          -- ✍️ Optional
          null_ls.builtins.completion.spell,            -- Spelling suggestions
        },
      })

      -- 🔁 Format on Save (optional)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.sh", "*.py", "*.tf", "*.json", "*.yaml", "*.yml", "*.md" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  }
}

