vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
  callback = function()
    require('ufo').detach()
  end,
})

vim.opt.foldlevelstart = 99
require('ufo').setup({})
