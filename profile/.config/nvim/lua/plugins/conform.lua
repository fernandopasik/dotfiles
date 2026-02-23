return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = function()
    local util = require("conform.util")
    return {
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      formatters = {
        black = { require_cwd = true },
        cmake_format = {
          cwd = util.root_file({ ".cmake-format", ".cmake-format.yaml", ".cmake-format.json", "cmake-format.yaml" }),
          require_cwd = true,
        },
        mdformat = {
          cwd = util.root_file({ ".mdformat.toml", "pyproject.toml" }),
          require_cwd = true,
        },
        prettier = { require_cwd = true },
        stylua = { require_cwd = true },
        yamlfmt = {
          command = "pre-commit",
          args = { "run", "yamlfmt", "--files", "$FILENAME" },
          stdin = false,
          cwd = util.root_file({ ".pre-commit-config.yaml" }),
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        astro = { "prettier" },
        cmake = { "cmake_format" },
        css = { "prettier" },
        go = { "goimports", "gofmt" },
        graphql = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        json5 = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier", "mdformat", stop_after_first = true },
        nix = { "nixfmt" },
        python = { "black" },
        scss = { "prettier" },
        svelte = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier", "yamlfmt", stop_after_first = true },
      },
    }
  end,
}
