return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = false,
    signcolumn = true,
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
  keys = {
    {
      "]c",
      function()
        require("gitsigns").nav_hunk("next")
      end,
      desc = "Next Git hunk",
    },
    {
      "[c",
      function()
        require("gitsigns").nav_hunk("prev")
      end,
      desc = "Previous Git hunk",
    },
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Git hunk",
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "Show Git diff",
    },
  },
}
