require('config.options')

-- 1. lazy.nvim - auto install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Erro ao clonar o lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. Configuração dos seus plugins
require("lazy").setup({
  spec = {
    -- Seu primeiro plugin: base46 para integração com o Matugen do Dank Linux
    -- Seu primeiro plugin: base46 para integração com o Matugen do Dank Linux
    {
      "AvengeMedia/base46",
      lazy = false,      -- Carrega imediatamente
      priority = 1000,   -- Garante prioridade na inicialização
    },

    -- No futuro, você adicionará novos plugins aqui, por exemplo:
    -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
  -- Configurações adicionais do lazy (opcional)
  install = { colorscheme = { "habamax" } }, -- Tema padrão de fallback caso o base46 falhe
  checker = { enabled = true }, -- Verifica atualizações de plugins automaticamente em background
})
