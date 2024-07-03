vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('turn_off_auto_commenting', {}),
    pattern = { '*' },
    callback = function()
        vim.cmd('setlocal fo-=jcroql')
        vim.cmd('setlocal fo+=tcqj')
    end,
})
