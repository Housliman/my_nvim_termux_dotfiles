return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
  vim.keymap.set("n", "<leader>lg", ":LazyGit<Cr>")
}
