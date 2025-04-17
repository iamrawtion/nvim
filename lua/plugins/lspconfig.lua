return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = {
        "bashls", "dockerls", "yamlls", "jsonls", "terraformls",
        "ansiblels", "lua_ls", "marksman", "pyright", "helm_ls",
        "tflint"
      }

      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT", -- Neovim uses LuaJIT
                },
                diagnostics = {
                  globals = { "vim" }, -- tell LSP that `vim` is a global
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          })
        else
          lspconfig[server].setup({})
        end
      end
    end,
  },
}

