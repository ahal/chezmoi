return {
  "ahal/tabcd.nvim",
  dir = os.getenv("HOME") .. "/dev/tabcd.nvim",
  cmd = { "TabCD", "TabCDNew" },
  opts = {},
  init = function()
    vim.cmd([[cnoreabbrev <expr> tabnew (getcmdtype() ==# ':' && getcmdline() ==# 'tabnew') ? 'TabCDNew' : 'tabnew']])
    vim.cmd([[cnoreabbrev <expr> tcd (getcmdtype() ==# ':' && getcmdline() ==# 'tcd') ? 'TabCD' : 'tcd']])
  end,
}
