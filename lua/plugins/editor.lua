return {
  -- File explorer
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File explorer" },
      { "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Git explorer" },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    opts = { filesystem = { follow_current_file = { enabled = true } } },
  },

  -- Git signs
  { "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local m = function(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end
        m("n", "]h", gs.next_hunk, "Next hunk")
        m("n", "[h", gs.prev_hunk, "Prev hunk")
        m("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        m("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        m("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        m("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame")
      end,
    },
  },

  -- Fugitive
  { "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gvdiffsplit" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff" },
    },
  },

  -- Diffview
  { "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },

  -- Which-key
  { "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunks" },
        { "<leader>d", group = "diff" },
        { "<leader>r", group = "refactor" },
        { "<leader>b", group = "buffer" },
      },
    },
  },

  -- Terminal
  { "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Horiz terminal" },
    },
    opts = { open_mapping = [[<C-\>]], direction = "float", float_opts = { border = "rounded" } },
  },

  -- Refactoring
  { "ThePrimeagen/refactoring.nvim",
    keys = {
      { "<leader>re", function() require("refactoring").refactor("Extract Function") end, mode = "v", desc = "Extract fn" },
      { "<leader>rv", function() require("refactoring").refactor("Extract Variable") end, mode = "v", desc = "Extract var" },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },

  -- DAP (Debug)
  { "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
    },
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap, ui = require("dap"), require("dapui")
          ui.setup()
          dap.listeners.after.event_initialized["dapui"] = function() ui.open() end
          dap.listeners.before.event_terminated["dapui"] = function() ui.close() end
        end,
      },
    },
  },
  { "leoluz/nvim-dap-go", ft = "go", opts = {} },
  { "mfussenegger/nvim-dap-python", ft = "python",
    config = function() require("dap-python").setup("python") end },
}
