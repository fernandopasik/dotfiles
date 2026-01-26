local function map(mode, lhs, rhs, opts)
  -- set default value if not specify
  if opts.noremap == nil then
    opts.noremap = true
  end
  if opts.silent == nil then
    opts.silent = true
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "-", "<cmd>Oil<CR>", { desc = "Open parant directory in Oil" })
