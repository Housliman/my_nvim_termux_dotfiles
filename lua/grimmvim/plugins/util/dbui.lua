return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
    },
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
    {
      "<leader>da",
      function()
        vim.g.auto_run_sql = not vim.g.auto_run_sql
        vim.notify("Auto SQL Run: " .. (vim.g.auto_run_sql and "Enabled" or "Disabled"))
      end,
      desc = "Toggle auto-run SQL on save",
    },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.auto_run_sql = true -- toggle for auto-run feature
    -- vim.g.db_cli_program = "/opt/lampp/bin/mysql"
  end,
  config = function()
    -- Disable folding in dbout output buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dbout",
      callback = function()
        vim.opt_local.foldenable = false
      end,
    })

    -- Auto-run SQL queries on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.sql",
      callback = function()
        if vim.g.auto_run_sql and vim.bo.filetype == "sql" then
          vim.cmd("DB")
        end
      end,
    })
  end,
}
