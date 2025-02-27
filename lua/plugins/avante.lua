local function is_copilot_authenticated()
  local ok, copilot = pcall(require, "copilot")
  if not ok then
    return "openai"
  end
  if type(copilot.is_authenticated) ~= "function" then
    return "openai"
  end
  return "copilot"
end
local default_provider = is_copilot_authenticated() and "copilot" or "openai"

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    debug = false,
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | string
    provider = default_provider,
    -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
    -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
    -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
    auto_suggestions_provider = default_provider,
    cursor_applying_provider = "copilot",
    ---@alias Tokenizer "tiktoken" | "hf"
    -- Used for counting tokens and encoding text.
    -- By default, we will use tiktoken.
    -- For most providers that we support we will determine this automatically.
    -- If you wish to use a given implementation, then you can override it here.
    tokenizer = "tiktoken",
    rag_service = {
      enabled = false, -- Enables the rag service, requires OPENAI_API_KEY to be set
    },
    web_search_engine = {},
    openai = nil,
    -- NOTE: https://docs.github.com/en/copilot/using-github-copilot/ai-models/changing-the-ai-model-for-copilot-chat
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      -- model = "o3-mini",
      -- model = "gpt-4o",
      -- model = "gpt-4o-2024-08-06",
      model = "claude-3.5-sonnet",
      -- model = "claude-3.7-sonnet",
      -- model = "gemini-2.0-flash",
      proxy = nil, -- [protocol://]host[:port] Use this proxy
      allow_insecure = false, -- Allow insecure server connections
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
    },
    azure = "",
    claude = "",
    bedrock = "",
    gemini = "",
    vertex = "",
    cohere = "",
    ---To add support for custom provider, follow the format below
    ---See https://github.com/yetone/avante.nvim/wiki#custom-providers for more details
    vendors = {
      ["claude-haiku"] = "",
      ["claude-opus"] = "",
    },
    ---Specify the special dual_boost mode
    ---1. enabled: Whether to enable dual_boost mode. Default to false.
    ---2. first_provider: The first provider to generate response. Default to "openai".
    ---3. second_provider: The second provider to generate response. Default to "claude".
    ---4. prompt: The prompt to generate response based on the two reference outputs.
    ---5. timeout: Timeout in milliseconds. Default to 60000.
    ---How it works:
    --- When dual_boost is enabled, avante will generate two responses from the first_provider and second_provider respectively. Then use the response from the first_provider as provider1_output and the response from the second_provider as provider2_output. Finally, avante will generate a response based on the prompt and the two reference outputs, with the default Provider as normal.
    ---Note: This is an experimental feature and may not work as expected.
    dual_boost = {
      enabled = false,
      first_provider = "openai",
      second_provider = "claude",
      prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
      timeout = 60000, -- Timeout in milliseconds
    },
    ---Specify the behaviour of avante.nvim
    ---1. auto_focus_sidebar              : Whether to automatically focus the sidebar when opening avante.nvim. Default to true.
    ---2. auto_suggestions = false, -- Whether to enable auto suggestions. Default to false.
    ---3. auto_apply_diff_after_generation: Whether to automatically apply diff after LLM response.
    ---                                     This would simulate similar behaviour to cursor. Default to false.
    ---4. auto_set_keymaps                : Whether to automatically set the keymap for the current line. Default to true.
    ---                                     Note that avante will safely set these keymap. See https://github.com/yetone/avante.nvim/wiki#keymaps-and-api-i-guess for more details.
    ---5. auto_set_highlight_group        : Whether to automatically set the highlight group for the current line. Default to true.
    ---6. jump_result_buffer_on_finish = false, -- Whether to automatically jump to the result buffer after generation
    ---7. support_paste_from_clipboard    : Whether to support pasting image from clipboard. This will be determined automatically based whether img-clip is available or not.
    ---8. minimize_diff                   : Whether to remove unchanged lines when applying a code block
    ---9. enable_token_counting           : Whether to enable token counting. Default to true.
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions = false, -- Experimental stage
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      jump_result_buffer_on_finish = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
      enable_token_counting = true,
      enable_cursor_planning_mode = false,
    },
    history = {
      max_tokens = 4096,
      storage_path = vim.fn.stdpath("state") .. "/avante",
      paste = {
        extension = "png",
        filename = "pasted-%Y-%m-%d-%H-%M-%S",
      },
    },
    highlights = {
      diff = {
        current = nil,
        incoming = nil,
      },
    },
    mappings = {
      ---@class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      -- NOTE: The following will be safely set by avante.nvim
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      toggle = {
        default = "<leader>at",
        debug = "<leader>ad",
        hint = "<leader>ah",
        suggestion = "<leader>as",
        repomap = "<leader>aR",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        retry_user_request = "r",
        edit_user_request = "e",
        switch_windows = "<Tab>",
        reverse_switch_windows = "None",
        remove_file = "d",
        add_file = "@",
        close = { "<Esc>", "q" },
      },
      files = {
        add_current = "<leader>ac", -- Add current buffer to selected files
      },
      select_model = "<leader>a?", -- Select model command
    },
    windows = {
      ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
      position = "right",
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width in vertical layout
      height = 30, -- default % based on available height in horizontal layout
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- Height of the input window in vertical layout
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the ask window
        ---@alias AvanteInitialDiff "ours" | "theirs"
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    --- @class AvanteConflictConfig
    diff = {
      autojump = true,
      --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
      --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
      --- Disable by setting to -1.
      override_timeoutlen = 500,
    },
    run_command = {
      -- Only applies to macOS and Linux
      shell_cmd = "sh -c",
    },
    --- @class AvanteHintsConfig
    hints = {
      enabled = true,
    },
    --- @class AvanteRepoMapConfig
    repo_map = {
      ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- ignore files matching these
      negate_patterns = {}, -- negate ignore files matching these.
    },
    --- @class AvanteFileSelectorConfig
    file_selector = {
      --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
      provider = "native",
      -- Options override for custom providers
      provider_opts = {},
    },
    suggestion = {
      debounce = 600,
      throttle = 600,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
    -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
    -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}
