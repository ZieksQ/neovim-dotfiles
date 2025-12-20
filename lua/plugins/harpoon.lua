return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		-- Default UI: toggle Harpoon menu
		vim.keymap.set("n", "<leader>M", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle quick menu" })

		-- Add current file to Harpoon
		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add current file to list" })

		-- Jump to files 1-4
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Go to file 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Go to file 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Go to file 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Go to file 4" })

		-- Navigate within Harpoon list
		vim.keymap.set("n", "<leader>p", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Previous file in list" })
		vim.keymap.set("n", "<leader>n", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Next file in list" })

		-- === Delete Harpoon item with dd inside UI ===
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "harpoon",
			callback = function()
				vim.keymap.set("n", "dd", function()
					local ui = harpoon.ui
					local idx = ui:get_current_index()
					if idx then
						harpoon:list():remove_at(idx)
					end
				end, { buffer = true, desc = "Harpoon: Remove selected item" })
			end,
		})
	end,
}
