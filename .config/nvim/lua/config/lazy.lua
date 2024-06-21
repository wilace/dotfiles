local lazy = {}

lazy.load_lazy = function()
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable', -- latest stable release
            lazypath,
        })
    end
    vim.opt.runtimepath:prepend(lazypath)

    require('lazy').setup('plugins', {
        defaults = {
            lazy = true,
            version = '*',
        },
        performance = {
            rtp = {
                disabled_plugins = {
                    "gzip",
                    "matchit",
                    "matchparen",
                    "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                },
            },
        },
    })
end

return lazy
