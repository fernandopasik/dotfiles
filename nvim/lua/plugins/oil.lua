return {
  'stevearc/oil.nvim',
  opts = {
    float = {
      border = "rounded",
      padding = 10
    },
    view_options = {
      show_hidden = true
    }
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} }
  },
  lazy = false,
}
