return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            -- Core languages you specified
            "lua_ls",           -- Lua
            -- Conditional Python LSP: basedpyright on Unix, pyright on Windows
            vim.fn.has("win32") == 1 and "pyright" or "basedpyright",
            "jdtls",            -- Java
            "gopls",            -- Go
            "html",             -- HTML
            "cssls",            -- CSS
            "ts_ls",            -- TypeScript/JavaScript/React

            -- Additional commonly used LSPs
            "jsonls",           -- JSON
            "yamlls",           -- YAML
            "bashls",           -- Bash/Shell scripts
            "marksman",         -- Markdown
            "dockerls",         -- Dockerfile
            "rust_analyzer",    -- Rust
            "clangd",           -- C/C++
        },
        automatic_installation = true,
    },
}
