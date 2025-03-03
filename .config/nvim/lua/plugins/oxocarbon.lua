-- https://github.com/nyoom-engineering/oxocarbon.nvim?tab=readme-ov-file#lazynvim
return {
	"nyoom-engineering/oxocarbon.nvim",
	-- https://github.com/nyoom-engineering/oxocarbon.nvim?tab=readme-ov-file#usage
	init = function()
		vim.opt.background = "dark"
		vim.cmd("colorscheme oxocarbon")
		-- Override the oxocarbon CmpItemKind highlighting since the background color does not work well with the nvim-cmp symbols
		local oxocarbon = require("oxocarbon").oxocarbon
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", {
			fg = oxocarbon.base08,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindColor", {
			fg = oxocarbon.base08,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {
			fg = oxocarbon.base08,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindText", {
			fg = oxocarbon.base09,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", {
			fg = oxocarbon.base09,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", {
			fg = oxocarbon.base09,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindConstant", {
			fg = oxocarbon.base10,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", {
			fg = oxocarbon.base10,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindReference", {
			fg = oxocarbon.base10,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", {
			fg = oxocarbon.base11,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", {
			fg = oxocarbon.base11,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindClass", {
			fg = oxocarbon.base11,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindModule", {
			fg = oxocarbon.base11,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", {
			fg = oxocarbon.base11,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindField", {
			fg = oxocarbon.base12,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", {
			fg = oxocarbon.base12,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", {
			fg = oxocarbon.base12,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", {
			fg = oxocarbon.base13,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {
			fg = oxocarbon.base13,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", {
			fg = oxocarbon.base13,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", {
			fg = oxocarbon.base14,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindFile", {
			fg = oxocarbon.base14,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", {
			fg = oxocarbon.base15,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindValue", {
			fg = oxocarbon.base15,
			bg = oxocarbon.none,
		})
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", {
			fg = oxocarbon.base15,
			bg = oxocarbon.none,
		})
		-- Highlighting for the Copilot CmpItemKind
		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {
			fg = oxocarbon.base14,
			bg = oxocarbon.none,
		})
	end,
}
