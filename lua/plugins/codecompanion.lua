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
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = 'devstral',
        },
        inline = {
          adapter = 'devstral',
        },
        cmd = {
          adapter = 'devstral',
        },
      },
      adapters = {
        qwen = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'qwen2.5-coder:7b',
              },
              num_ctx = { default = 131072 },
            },
          })
        end,
        deepseek_r1_14b = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'deepseek_r1_14b', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'deepseek-r1:14b-qwen-distill-q4_K_M',
              },
              num_ctx = { default = 131072 },
            },
          })
        end,
        granite3_3_ian_mod = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'granite3_3_ian_mod', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'granite3.3-ian-mod-num-ctx-32768:latest',
              },
              num_ctx = { default = 131072 },
            },
          })
        end,
        devstral = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'devstral', -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = 'devstral:24b',
              },
              num_ctx = { default = 131072 },
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
