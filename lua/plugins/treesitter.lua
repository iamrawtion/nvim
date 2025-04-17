return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "fish", "python", "ruby", "perl", "lua",
          "html", "css", "scss", "javascript", "typescript", "tsx", "vue",
          "json", "json5", "yaml", "toml", "graphql",
          "c", "cpp", "rust", "go", "java", "c_sharp", "nix",
          "dockerfile", "terraform", "hcl", "make", "ini",
          "csv", "markdown", "markdown_inline", "xml",
          "cmake", "vim", "vimdoc",
          "regex", "query", "gitcommit", "gitignore", "proto", "svelte",
          "php", "elixir", "erlang", "scala", "kotlin", "dart",
          "sql", "rego", "r"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}

