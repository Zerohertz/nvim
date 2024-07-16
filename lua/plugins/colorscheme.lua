-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      -- default_integrations = true,
      color_overrides = {
        all = {
          base = "#000000",
          text = "#ffffff",

          -- f0 + 0a --
          red = "#f00a0a", -- git -
          yellow = "#f0f00a", -- git edit
          green = "#0af00a", -- git -, string
          peach = "#f00af0", -- val

          -- a0 + 0a --
          blue = "#a00a0a", -- functions, method
          lavender = "#a00a0a", -- property
          sky = "#0aa00a", -- operator

          -- ff + 55 --
          maroon = "#ff5555", -- inputs
          mauve = "#55ff55", -- keywords (class, def, with, ...)
          sapphire = "#5555ff", -- __init__

          -- grey --
          mantle = "#0f0f0f", -- neo-tree background
          surface0 = "#333333", -- cursor
          surface1 = "#555555", -- code line
          overlay2 = "#a0a0a0", -- ., ,, (), {}, []
          pink = "#c0c0c0", -- f{}

          -- theme --
          rosewater = "#800a0a", -- file path
          overlay0 = "#800a0a", -- neo-tree line & code hint
          teal = "#a03030", -- comment

          -- ? --
          -- flamingo = "#ff0000",
          -- subtext0 = "#ff0000",
          -- subtext1 = "#ff0000",
          -- overlay1 = "#ff0000",
          -- surface2 = "#ff0000",
          -- crust = "#ff0000",
        },
      },
      custom_highlights = function()
        return {
          -- :Telescope highlights
          DiagnosticSignInfo = { fg = "#800a0a" },

          -- Dashboard --
          Label = { fg = "#800a0a" },
          DashboardHeader = { fg = "#800a0a" },
          DashboardProjectTitle = { fg = "#800a0a" },
          DashboardMruTitle = { fg = "#800a0a" },

          -- Mason --
          MasonHeader = { bg = "#800a0a", fg = "#ffffff" },
          MasonLink = { bg = "#800a0a", fg = "#ffffff" },
          MasonHighlight = { fg = "#800a0a" },
          MasonHighlightBlock = { bg = "#800a0a", fg = "#ffffff" },
          MasonHighlightBlockBold = { bg = "#800a0a", fg = "#ffffff" },
        }
      end,
    })
  end,
}
