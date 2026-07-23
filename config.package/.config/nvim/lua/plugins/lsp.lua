return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  config = function()
    require("mason").setup()

    -- Lua: type this repo's own nvim config against the real runtime API
    -- instead of flagging `vim` as an undefined global.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          codeLens = { enable = true },
          hint = { enable = true },
        },
      },
    })

    -- Python: basedpyright for types/completion, ruff for lint + format
    -- (ruff's own formatter, not pyright's, does the actual formatting).
    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          analysis = { typeCheckingMode = "standard", autoImportCompletions = true },
        },
      },
    })
    vim.lsp.config("ruff", {
      init_options = { settings = { organizeImports = true } },
    })

    -- TypeScript/JavaScript
    vim.lsp.config("ts_ls", {
      settings = {
        typescript = { inlayHints = { includeInlayParameterNameHints = "all" } },
        javascript = { inlayHints = { includeInlayParameterNameHints = "all" } },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "basedpyright", "ruff", "ts_ls" },
    })

    vim.diagnostic.config({
      virtual_text = { spacing = 2, prefix = "●" },
      underline = true,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
    })
  end,
}
