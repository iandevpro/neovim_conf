return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    sources = {
      -- default = { "lsp", "copilot", "lazydev", "path", "snippets", "buffer", "ripgrep" },
      default = { "lsp", "path", "buffer", "codecompanion" },
      per_filetype = { codecompanion = { "codecompanion" } },
      providers = {
        lsp = { score_offset = 10 },
        buffer = { score_offset = 8 },
        path = { score_offset = 8 },
        -- ripgrep = { module = "blink-ripgrep", name = "Ripgrep", score_offset = 7 },
      },
    },
  },
}
