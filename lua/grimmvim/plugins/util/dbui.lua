return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  ft = { "sql", "mysql", "plsql" },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
    { "<leader>dba", "<cmd>DBUIAddConnection<CR>", desc = "Add DB Connection" },
    { "<leader>ds", "<cmd>Telescope dadbod<CR>", desc = "Telescope DB Tables" },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    -- vim.g.db_cli_program = "/opt/lampp/bin/mysql"
  end,
  config = function()
    -- Automatically disable folding in dbout buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dbout",
      callback = function()
        vim.opt_local.foldenable = false
      end,
    })
  end,
}

