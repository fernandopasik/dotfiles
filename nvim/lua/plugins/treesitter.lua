return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.config")

    configs.setup({
      ensure_installed = {
        "angular", "asm", "astro", "awk",
        "bash",
        "c", "cmake", "comment", "cpp", "csv",
        "dart", "desktop", "diff", "dockerfile",
        "ecma", "editorconfig",
        "fish",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "go", "gomod", "gosum", "gotmpl", "gowork", "gpg", "graphql", "groovy",
        "hcl", "helm", "html", "html_tags", "http",
        "ini",
        "java", "javadoc", "javascript", "jinja", "jinja_inline", "jq", "jsdoc", "json", "json5",
        "jsonnet", "jsx",
        "kotlin",
        "latex", "liquid", "lua", "luadoc",
        "make", "markdown", "markdown_inline", "mermaid",
        "nginx", "nix",
        "objc",
        "pascal", "passwd", "pem", "perl", "php", "phpdoc", "powershell", "printf", "properties",
        "proto", "python",
        "query",
        "readline", "regex", "requirements", "robots_txt", "ruby", "rust",
        "scala", "scss", "sql", "ssh_config", "svelte",
        "terraform", "thrift", "tmux", "todotxt", "toml", "tsx", "typescript", "typespec",
        "vim", "vimdoc", "vue",
        "xml",
        "yaml",
        "zig", "zsh",
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<Backspace>",
        },
      },
    })
  end
}
