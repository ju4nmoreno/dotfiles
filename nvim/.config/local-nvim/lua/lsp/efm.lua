local prettier = {
  -- formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT} --stdin",
  formatStdin = true
}

local eslint = {
  lintCommand = './node_modules/.bin/eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintSource = 'eslint',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' }
}

-- eslint = {
-- sourceName = "eslint",
-- command = "./node_modules/.bin/eslint",
-- rootPatterns = {
-- ".eslitrc.js",
-- "package.json"
-- },

require"lspconfig".efm.setup {
  root_dir = require("lspconfig").util.root_pattern { ".git/", "." },
  init_options = {
    documentFormatting = true,
    hover = true,
    documnetSymbol = true
  },
  filetypes = {
    -- "typescript",
    -- "lua",
    -- "html",
    -- "css",
    -- 'scss',
    "vim"
    -- "javascript",
    -- "javascript.jsx",
    -- "javascriptreact",
    -- "typescriptreact",
    -- "typescript.tsx"
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
          formatStdin = true
        }
      },
      -- html = { prettier, eslint },
      -- css = { prettier, eslint },
      -- scss = { prettier, eslint }
      -- javascript = { prettier, eslint },
      -- typescript = { eslint, prettier },
      -- javascriptreact = { prettier, eslint },
      -- typescriptreact = { prettier, eslint }
    }
  }
}
