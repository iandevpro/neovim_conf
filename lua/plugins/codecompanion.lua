return {
  -- .config/nvim/lua/plugins/codecompanion.lua
  -- from -- https://www.reddit.com/r/neovim/comments/1igrcsu/codecompanion_with_ollama_and_local_llm/
  -- additionally for yaml (TSInstall needs compiler)
  -- sudo apt install gcc
  -- :TSInstall yaml
    {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    -- config for using codecompanion as a source for blink.cmp
    -- https://github.com/Saghen/blink.cmp/discussions/1202#discussion-7947854
      {
        "saghen/blink.cmp",
        lazy = false,
        version = "*",
        opts = {
          keymap = {
            preset = "enter",
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
          },
          sources = {
            default = { "codecompanion", "lsp", "path", "buffer" },
            -- cmdline = {}, -- Disable sources for command-line mode
            per_filetype = { codecompanion = { "codecompanion" } },
          },
        },
      },
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = 'qwen',
        },
        inline = {
          adapter = 'qwen',
        },
        cmd = {
          adapter = 'qwen',
        },
      },
      adapters = {
        qwen = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'qwen2.5-coder:7b',
                num_ctx = 131072,
              },
            },
          })
        end,
        deepseek_r1_14b = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'deepseek_r1_14b', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'deepseek-r1:14b-qwen-distill-q4_K_M',
                num_ctx = 131072,
              },
            },
          })
        end,
      },
      opts = {
        log_level = 'DEBUG',
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = 'vertical', -- vertical|horizontal split for default provider
          opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
          provider = 'default', -- default|mini_diff
        },
      },
    },
  },
}
