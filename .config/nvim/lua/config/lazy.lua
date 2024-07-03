local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', lazyrepo, lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
    spec = {
        { import = 'plugins' },
    },
    defaults = { lazy = true },
    performance = {
        rtp = {
            -- "gzip",
            -- "matchit",
            -- "matchparen",
            -- "netrwPlugin",
            -- "tarPlugin",
            -- "tohtml",
            -- "tutor",
            -- "zipPlugin",
        },
    },
})
