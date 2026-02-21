return {
  'nvim-mini/mini.statusline',
  version = '*',
  config = function()
    local statusline = require('mini.statusline')

    statusline.setup({
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
          local filename       = statusline.section_filename({ trunc_width = 140 })
          local fileinfo       = statusline.section_fileinfo({ trunc_width = 120 })
          local location       = statusline.section_location({ trunc_width = 75 })
          local diagnostics    = statusline.section_diagnostics({ trunc_width = 75 })
          local ts_lang        = require('utils.ts').ts_lang()

          return statusline.combine_groups({
            { hl = mode_hl,            strings = { mode } },
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineFilename', strings = { ts_lang } },
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = 'MiniStatuslineFilename', strings = { diagnostics } },
            { hl = 'MiniStatuslineLocation', strings = { location } },
          })
        end,
      },
    })
  end,
}
