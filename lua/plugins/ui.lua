return {
  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha", transparent_background = true })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Status line
  { "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Buffer line (tabs)
  { "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "neo-tree", text = "Files", padding = 1 } },
        separator_style = "slant",
      },
    },
  },

  -- Indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = { indent = { char = "│" }, scope = { enabled = true } },
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Noice (better UI)
  { "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = { override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      }},
    },
  },
}
