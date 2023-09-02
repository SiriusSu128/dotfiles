local packer = require("packer")
packer.startup({
    function(use) -- 下面是插件列表
        -- Packer 可以管理自己本身
        use("wbthomason/packer.nvim")
        -- catppuccin 主题
        use { "catppuccin/nvim", as = "catppuccin" }
        --
        use 'keaising/im-select.nvim'
        use { 'kevinhwang91/nvim-ibus-sw', event = 'InsertEnter',
            config = function()
                require('ibus-sw').setup()
            end
        }
    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 以浮动窗口打开安装列表
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
