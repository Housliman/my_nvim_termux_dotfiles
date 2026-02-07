return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local map = vim.keymap.set
		local substitute = require("substitute")
		substitute.setup()
		map("n", "gs", substitute.operator, { desc = "Substitute with motion", noremap = true, silent = true })
		map("n", "gss", substitute.line, { desc = "Substitute line", noremap = true, silent = true })
		map("n", "gS", substitute.eol, { desc = "Substitute to end of line", noremap = true, silent = true })
		map("x", "gs", substitute.visual, { desc = "Substitute in visual mode", noremap = true, silent = true })
	end,
}
