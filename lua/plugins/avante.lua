-- NOTE: https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua

local provider = ""
-- NOTE: https://github.com/yetone/avante.nvim/blob/ebadba7420a5f9b85829273b8c9cd2be56d9b074/lua/avante/providers/copilot.lua#L107-L113
if vim.loop.fs_stat(os.getenv("HOME") .. "/.config/github-copilot/apps.json") ~= nil then
  provider = "copilot"
else
  provider = "openai"
end
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = provider,
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "claude-sonnet-4",
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      claude = {
        hide_in_model_selector = true,
      },
      azure = {
        hide_in_model_selector = true,
      },
      gemini = {
        hide_in_model_selector = true,
      },
      vertex = {
        hide_in_model_selector = true,
      },
      vertex_claude = {
        hide_in_model_selector = true,
      },
      cohere = {
        hide_in_model_selector = true,
      },
      bedrock = {
        hide_in_model_selector = true,
      },
      ollama = {
        hide_in_model_selector = true,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
