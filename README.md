TODO:
* Add mini.ai (or equivalent in lazyvim) ✅ DONE
  - Configured with text objects: f (functions), c (classes), q (quotes), t (tags), d (digits), g (buffer)
  - Usage: daf (delete a function), yif (yank inside function), vac (select a class), etc.

* Add mini.surround (or equivalent in lazyvim) ✅ DONE
  - Configured with keymaps: gsa (add), gsd (delete), gsr (replace), gsf (find), gsh (highlight)
  - Usage: gsa + motion + char to surround, gsd + char to delete surrounding

* add flash.nvim ✅ DONE
  - Quick navigation with 's' key
  - Treesitter integration with 'S' key
  - Usage: press 's' then type labels to jump anywhere on screen

* Add noice.nvim ✅ DONE
  - Fancy UI for command line, messages, and notifications
  - Better LSP documentation rendering
  - Command palette preset enabled

* Add LSP ✅ DONE
  - Refactored into modular structure: lua/plugins/lspconfig/
  - Configured using new vim.lsp.config() and vim.lsp.enable() API (Neovim 0.11+)
  - lua_ls: Full Neovim API support with vim global recognized
  - basedpyright: Python LSP with type checking and auto-imports
  - Mason auto-installs: lua_ls, basedpyright, jdtls, gopls, html, cssls, ts_ls, jsonls, yamlls, bashls, marksman, dockerls, rust_analyzer, clangd

- Blink (auto-complete) ✅ DONE
  - Tab to accept completions
  - Up/Down arrows for navigation
  - LSP, snippets, path, and buffer sources configured
  - Auto-show documentation enabled

* Sort out command line -> fancy input (noice.nvim) ✅ DONE
  - Handled by noice.nvim configuration above

* md preview ✅ DONE
  - markdown-preview.nvim installed
  - Usage: <leader>mp to toggle preview

* Debugger
  - TODO: User will configure DAP manually

* Live Share code session
  - TODO: Not yet configured

* Split screen
  - Built-in with :split and :vsplit
  - TODO: Consider adding smart-splits.nvim or windows.nvim for better management

* Configure Lualine a bit more to make it look like LazyVim ✅ DONE
  - Added git branch and diff indicators
  - Added LSP diagnostics (errors, warnings, info, hints)
  - Shows active LSP clients
  - Global statusline enabled
  - Extensions for lazy and mason

ADDITIONAL FEATURES ADDED:
* Yank highlighting ✅ DONE
  - Visual feedback when yanking text (200ms highlight)
  - Configured in lua/autocmds.lua

* Treesitter ✅ DONE
  - Auto-installs parsers for all configured languages
  - Proper syntax highlighting enabled
  - Incremental selection with <CR> to expand, <BS> to shrink
