-- https://github.com/ellisonleao/gruvbox.nvim?tab=readme-ov-file#using-lazynvim
return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = true,
	init = function()
		local background_setting_path = vim.fn.stdpath("config") .. "/background-setting.txt"

		-- Initialize last_mtime.
		local last_mtime = 0
		local fs_stat = vim.uv.fs_stat(background_setting_path)
		if fs_stat then
			last_mtime = fs_stat.mtime.sec
		end

		-- Get the background from the setting file.
		local function set_background()
			local file = io.open(background_setting_path, "r")
			if file then
				local background = file:read("*l")
				if background == "dark" or background == "light" then
					vim.o.background = background
				end
				file:close()
			end
		end

		-- Initialize background.
		set_background()

		-- Setup timer to check the background setting every 15 minutes (900000 ms).
		local timer = vim.uv.new_timer()
		if timer then
			timer:start(0, 900000, vim.schedule_wrap(
				function()
					local current_fs_stat = vim.uv.fs_stat(background_setting_path)
					if current_fs_stat and current_fs_stat.mtime.sec > last_mtime then
						last_mtime = current_fs_stat.mtime.sec
						set_background()
					end
				end
			))
		end

		-- https://github.com/ellisonleao/gruvbox.nvim?tab=readme-ov-file#basic-usage
		vim.cmd([[colorscheme gruvbox]])

		-- Mapping to toggle between light and dark background.
		vim.keymap.set("n", "<leader>g", function()
				if vim.o.background == 'light' then
					vim.o.background = 'dark'
				else
					vim.o.background = 'light'
				end

				local file = io.open(background_setting_path, 'w')
				if file then
					file:write(vim.o.background)
					file:close()
				end
			end,
			{ desc = "Toggle background", silent = true })
	end,
}
