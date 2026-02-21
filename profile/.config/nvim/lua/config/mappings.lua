local builtin = require('telescope.builtin')

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

map('n', '<leader>ff', builtin.find_files,  { desc = 'Find files' })
map('n', '<leader>fg', builtin.live_grep,   { desc = 'Live grep' })
map('n', '<leader>fb', builtin.buffers,     { desc = 'Find buffers' })
map('n', '<leader>fh', builtin.help_tags,   { desc = 'Help tags' })
map('n', '<leader>fw', builtin.grep_string, { desc = 'Grep word under cursor' })
