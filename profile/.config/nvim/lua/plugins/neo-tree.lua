return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          hide_hidden = false,
          never_show = { ".git" },
          visible = true,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_set_hl(0, "NeoTreeDotfile", { link = "NeoTreeFileName" })
      vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#626262" })
    end,
    lazy = false,
  }
}
