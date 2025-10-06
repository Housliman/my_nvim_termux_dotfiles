-- Keymap to open colorscheme picker
vim.keymap.set(
  "n",
  "<leader>cl",
  function()
    require("telescope.builtin").colorscheme({
      enable_preview = true,
      ignore_builtins = true,
    })
  end,
  { noremap = true, silent = true, desc = "Choose colorscheme" }
)

-- Plugin specs
return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.0 },
          vertical   = { mirror = false },
          width      = 0.2,
          height     = 0.8,
        },
      },
    },
  },
}

