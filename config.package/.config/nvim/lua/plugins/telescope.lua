return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope Find Files" },
    { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Telescope Git Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope Help Tags" },
  },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("fzf")
  end,
}
