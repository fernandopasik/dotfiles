local M = {}

function M.ts_lang()
  local ok, parser = pcall(vim.treesitter.get_parser, 0)
  if ok and parser then
    return ("[%s]"):format(parser:lang())
  end
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  return lang and ("[%s]"):format(lang) or ""
end

return M
