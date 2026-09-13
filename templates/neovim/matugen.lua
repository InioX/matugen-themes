vim.cmd("highlight clear")
vim.o.background = "{{ mode }}"
vim.g.colors_name = "matugen"

local hl = vim.api.nvim_set_hl
local none = "NONE"

-- Editor interface

hl(0, "Normal", { fg = "{{ colors.on_background.default.hex }}", bg = none })
hl(0, "NormalNC", { link = "Normal" })
hl(0, "Cursor", { fg = "{{ colors.on_primary.default.hex }}", bg = "{{ colors.primary.default.hex }}" })
hl(0, "CursorLine", { bg = "{{ colors.surface_container_low.default.hex }}" })
hl(0, "CursorLineNr", { fg = "{{ colors.primary.default.hex }}", bold = true })
hl(0, "Visual", { bg = "{{ colors.secondary_container.default.hex | set_lightness: 18.0 }}" })
hl(0, "LineNr", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 38.0 }}", bg = none })
hl(0, "NonText", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 25.0 }}", bg = none })
hl(0, "EndOfBuffer", { link = "NonText" })
hl(0, "SpecialKey", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 25.0 }}", bg = none })
hl(0, "Whitespace", { link = "SpecialKey" })
hl(0, "SignColumn", { bg = none })
hl(0, "FoldColumn", { bg = none })
hl(0, "StatusLine", { bg = "{{ colors.surface_container_lowest.default.hex }}" })
hl(0, "StatusLineNC", { fg = "{{ colors.outline.default.hex }}", bg = none })
hl(0, "WinBar", { fg = "{{ colors.on_background.default.hex }}", bg = none, bold = true })
hl(0, "WinBarNC", { fg = "{{ colors.outline.default.hex }}", bg = none })
hl(0, "VertSplit", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 30.0 }}", bg = none })
hl(0, "WinSeparator", { link = "VertSplit" })
hl(0, "TabLine", { fg = "{{ colors.outline.default.hex }}", bg = none })
hl(0, "TabLineFill", { bg = none })
hl(
	0,
	"TabLineSel",
	{ fg = "{{ colors.on_background.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" }
)
hl(0, "ColorColumn", { bg = "{{ colors.surface_container_low.default.hex }}" })
hl(0, "Folded", { fg = "{{ colors.outline.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" })

hl(
	0,
	"NormalFloat",
	{ fg = "{{ colors.on_background.default.hex }}", bg = "{{ colors.surface_container_high.default.hex }}" }
)
hl(
	0,
	"FloatBorder",
	{ fg = "{{ colors.outline_variant.default.hex }}", bg = "{{ colors.surface_container_high.default.hex }}" }
)
hl(0, "FloatTitle", { link = "Title" })

hl(
	0,
	"Pmenu",
	{ fg = "{{ colors.on_background.default.hex }}", bg = "{{ colors.surface_container_high.default.hex }}" }
)
hl(0, "PmenuSbar", { bg = "{{ colors.surface_container_low.default.hex }}" })
hl(0, "PmenuSel", { fg = "{{ colors.on_primary.default.hex }}", bg = "{{ colors.primary.default.hex }}", blend = 0 })
hl(0, "PmenuThumb", { bg = "{{ colors.outline.default.hex }}" })
hl(0, "PmenuKind", { fg = "{{ colors.blue.default.hex }}", bg = "{{ colors.surface_container_high.default.hex }}" })
hl(0, "PmenuKindSel", { link = "PmenuSel" })
hl(0, "PmenuExtra", { fg = "{{ colors.outline.default.hex }}", bg = "{{ colors.surface_container_high.default.hex }}" })
hl(0, "PmenuExtraSel", { link = "PmenuSel" })
hl(0, "WildMenu", { fg = "{{ colors.on_primary.default.hex }}", bg = "{{ colors.primary.default.hex }}" })

hl(0, "DiffAdd", { fg = "{{ colors.green.default.hex }}", bg = "{{ colors.green.default.hex | set_lightness: 16.0 }}" })
hl(
	0,
	"DiffChange",
	{ fg = "{{ colors.yellow.default.hex }}", bg = "{{ colors.yellow.default.hex | set_lightness: 16.0 }}" }
)
hl(0, "DiffDelete", { fg = "{{ colors.red.default.hex }}", bg = "{{ colors.red.default.hex | set_lightness: 16.0 }}" })
hl(0, "DiffText", { fg = "{{ colors.background.default.hex }}", bg = "{{ colors.yellow.default.hex }}" })
hl(0, "Added", { fg = "{{ colors.green.default.hex }}" })
hl(0, "Changed", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "Removed", { fg = "{{ colors.red.default.hex }}" })

hl(0, "MatchParen", { fg = "{{ colors.primary.default.hex }}", bold = true, underline = true })
hl(0, "Search", { fg = "{{ colors.background.default.hex }}", bg = "{{ colors.yellow.default.hex }}" })
hl(0, "IncSearch", { fg = "{{ colors.background.default.hex }}", bg = "{{ colors.orange.default.hex }}" })
hl(0, "CurSearch", { link = "IncSearch" })
hl(0, "QuickFixLine", { link = "CursorLine" })

hl(0, "DiagnosticError", { fg = "{{ colors.red.default.hex }}" })
hl(0, "DiagnosticHint", { fg = "{{ colors.teal.default.hex }}" })
hl(0, "DiagnosticInfo", { fg = "{{ colors.sky.default.hex }}" })
hl(0, "DiagnosticWarn", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "DiagnosticOk", { fg = "{{ colors.green.default.hex }}" })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "{{ colors.red.default.hex }}" })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "{{ colors.yellow.default.hex }}" })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "{{ colors.sky.default.hex }}" })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "{{ colors.teal.default.hex }}" })
hl(
	0,
	"DiagnosticVirtualTextError",
	{ fg = "{{ colors.red.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" }
)
hl(
	0,
	"DiagnosticVirtualTextWarn",
	{ fg = "{{ colors.yellow.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" }
)
hl(
	0,
	"DiagnosticVirtualTextInfo",
	{ fg = "{{ colors.sky.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" }
)
hl(
	0,
	"DiagnosticVirtualTextHint",
	{ fg = "{{ colors.teal.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}" }
)
hl(0, "LspReferenceText", { bg = "{{ colors.surface_container_high.default.hex }}" })
hl(0, "LspReferenceRead", { bg = "{{ colors.surface_container_high.default.hex }}" })
hl(0, "LspReferenceWrite", { bg = "{{ colors.surface_container_high.default.hex }}" })
hl(0, "LspCodeLens", { fg = "{{ colors.outline.default.hex }}", italic = true })
hl(
	0,
	"LspInlayHint",
	{ fg = "{{ colors.outline.default.hex }}", bg = "{{ colors.surface_container_low.default.hex }}", italic = true }
)
hl(0, "LspSignatureActiveParameter", { fg = "{{ colors.orange.default.hex }}", bold = true })

hl(0, "ErrorMsg", { fg = "{{ colors.red.default.hex }}" })
hl(0, "WarningMsg", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "MsgArea", { link = "Normal" })
hl(0, "MsgSeparator", { link = "StatusLine" })
hl(0, "Question", { fg = "{{ colors.tertiary.default.hex }}" })
hl(0, "MoreMsg", { fg = "{{ colors.green.default.hex }}" })
hl(0, "Directory", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "SpellBad", { undercurl = true, sp = "{{ colors.red.default.hex }}" })
hl(0, "SpellCap", { undercurl = true, sp = "{{ colors.yellow.default.hex }}" })
hl(0, "SpellLocal", { undercurl = true, sp = "{{ colors.teal.default.hex }}" })
hl(0, "SpellRare", { undercurl = true, sp = "{{ colors.maroon.default.hex }}" })
hl(0, "Title", { fg = "{{ colors.green.default.hex }}", bold = true })
hl(0, "Conceal", {})
hl(0, "CursorColumn", { link = "CursorLine" })
hl(0, "ModeMsg", { link = "MoreMsg" })
hl(0, "VisualNOS", { link = "Visual" })

-- Base syntax
hl(0, "Boolean", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "Character", { fg = "{{ colors.green.default.hex }}" })
hl(0, "Comment", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 42.0 }}", italic = true })
hl(0, "Conditional", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "Constant", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "Debug", { fg = "{{ colors.red.default.hex }}" })
hl(0, "Define", { fg = "{{ colors.purple.default.hex }}" })
hl(0, "Delimiter", { fg = "{{ colors.outline.default.hex }}" })
hl(0, "Error", { fg = "{{ colors.red.default.hex }}" })
hl(0, "Exception", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "Float", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "Function", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "Number", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "Operator", { fg = "{{ colors.teal.default.hex }}" })
hl(0, "Identifier", { fg = "{{ colors.on_background.default.hex }}" })
hl(0, "Include", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "Keyword", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "Label", { fg = "{{ colors.pink.default.hex }}" })
hl(0, "Macro", { fg = "{{ colors.pink.default.hex }}" })
hl(0, "PreCondit", { fg = "{{ colors.purple.default.hex }}" })
hl(0, "PreProc", { fg = "{{ colors.purple.default.hex }}" })
hl(0, "Repeat", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "Special", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "SpecialChar", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "SpecialComment", { fg = "{{ colors.outline_variant.default.hex | set_lightness: 45.0 }}", italic = true })
hl(0, "Statement", { fg = "{{ colors.purple.default.hex }}" })
hl(0, "StorageClass", { fg = "{{ colors.yellow.default.hex }}", italic = true })
hl(0, "String", { fg = "{{ colors.green.default.hex }}" })
hl(0, "Structure", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "Todo", { fg = "{{ colors.background.default.hex }}", bg = "{{ colors.yellow.default.hex }}", bold = true })
hl(0, "Type", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "Typedef", { fg = "{{ colors.yellow.default.hex }}" })

-- Built-in groups
-- Syntax: Netrw
hl(0, "netrwDir", { link = "Function" })
hl(0, "netrwHelpCmd", { link = "Special" })
hl(0, "netrwMarkFile", { reverse = true })

-- Syntax: vim
hl(0, "vimVar", { fg = "fg" })

-- Syntax: lua
hl(0, "luaFunction", { link = "Function" })
hl(0, "luaConstant", { link = "Boolean" })
hl(0, "luaTable", { fg = "fg" })

-- Syntax: html
hl(0, "htmlEndTag", { link = "Function" })

-- Syntax: javascript
hl(0, "javaScript", { fg = "fg" })
hl(0, "javaScriptBraces", { fg = "fg" })

-- Syntax: typescript
hl(0, "typescriptBraces", { fg = "fg" })
hl(0, "typescriptParens", { fg = "fg" })
hl(0, "typescriptImport", { link = "Keyword" })
hl(0, "typescriptTry", { link = "Keyword" })
hl(0, "typescriptExceptions", { link = "Keyword" })

-- Treesitter (Nvim 0.12+ @foo.bar-style capture groups)
hl(0, "@variable", { fg = "fg" })
hl(0, "@variable.builtin", { fg = "{{ colors.red.default.hex }}", italic = true })
hl(0, "@variable.parameter", { fg = "{{ colors.on_background.default.hex }}", italic = true })
hl(0, "@variable.member", { fg = "{{ colors.mint.default.hex }}", italic = true })
hl(0, "@constructor", { fg = "{{ colors.yellow.default.hex }}" })
hl(0, "@constructor.lua", { fg = "fg" })
hl(0, "@punctuation.bracket", { link = "Delimiter" })
hl(0, "@punctuation.delimiter", { link = "Delimiter" })
hl(0, "@punctuation.special", { fg = "{{ colors.teal.default.hex }}" })
hl(0, "@operator", { link = "Operator" })
hl(0, "@markup.heading", { link = "Title" })
hl(0, "@markup.strong", { bold = true })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.link.label", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "@markup.link.url", { fg = "{{ colors.sky.default.hex }}", underline = true })
hl(0, "@markup.raw", { link = "String" })
hl(0, "@markup.list", { fg = "{{ colors.purple.default.hex }}" })
hl(0, "@comment", { link = "Comment" })
hl(0, "@string", { link = "String" })
hl(0, "@string.escape", { fg = "{{ colors.pink.default.hex }}" })
hl(0, "@string.regexp", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "@keyword", { link = "Keyword" })
hl(0, "@keyword.function", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "@keyword.return", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "@keyword.operator", { fg = "{{ colors.purple.default.hex }}", italic = true })
hl(0, "@function", { link = "Function" })
hl(0, "@function.call", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "@function.builtin", { fg = "{{ colors.blue.default.hex }}", italic = true })
hl(0, "@function.macro", { fg = "{{ colors.pink.default.hex }}" })
hl(0, "@method", { link = "Function" })
hl(0, "@method.call", { fg = "{{ colors.blue.default.hex }}" })
hl(0, "@type", { link = "Type" })
hl(0, "@type.builtin", { fg = "{{ colors.yellow.default.hex }}", italic = true })
hl(0, "@number", { link = "Number" })
hl(0, "@boolean", { link = "Boolean" })
hl(0, "@constant", { link = "Constant" })
hl(0, "@constant.builtin", { fg = "{{ colors.orange.default.hex }}", italic = true })
hl(0, "@module", { fg = "{{ colors.yellow.default.hex }}", italic = true })
hl(0, "@namespace", { fg = "{{ colors.lavender.default.hex }}", italic = true })
hl(0, "@label", { link = "Label" })
hl(0, "@tag", { fg = "{{ colors.red.default.hex }}" })
hl(0, "@tag.attribute", { fg = "{{ colors.orange.default.hex }}", italic = true })
hl(0, "@tag.delimiter", { fg = "{{ colors.outline.default.hex }}" })
hl(0, "@diff.plus", { fg = "{{ colors.green.default.hex }}" })
hl(0, "@diff.minus", { fg = "{{ colors.red.default.hex }}" })
hl(0, "@diff.delta", { fg = "{{ colors.yellow.default.hex }}" })

-- LSP semantic tokens:
-- Neovim gives semantic tokens priority 125 vs treesitter's 100, so by
-- default LSP silently overrides/flattens treesitter's colors once the
-- server finishes analyzing the buffer. Linking these broad/generic types
-- to "NONE" clears that layer's attributes entirely, letting treesitter's
-- highlight underneath show through unchanged instead of getting flattened.
local semantic_passthrough = {
	-- "@lsp.type.variable",
	-- "@lsp.type.parameter",
	"@lsp.type.property",
	-- "@lsp.type.class",
	-- "@lsp.type.struct",
	-- "@lsp.type.enum",
	-- "@lsp.type.enumMember",
	-- "@lsp.type.interface",
	-- "@lsp.type.type",
	-- "@lsp.type.typeParameter",
	-- "@lsp.type.function",
	-- "@lsp.type.method",
	-- "@lsp.type.macro",
	-- "@lsp.type.decorator",
	-- "@lsp.type.keyword",
	-- "@lsp.type.comment",
	-- "@lsp.type.string",
	-- "@lsp.type.number",
	-- "@lsp.type.regexp",
	-- "@lsp.type.operator",
}
for _, group in ipairs(semantic_passthrough) do
	hl(0, group, { link = "NONE" })
end

hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = "{{ colors.red.default.hex }}", italic = true })
hl(0, "@lsp.typemod.variable.readonly", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "@lsp.typemod.function.defaultLibrary", { fg = "{{ colors.blue.default.hex }}", italic = true })
hl(0, "@lsp.typemod.property.readonly", { fg = "{{ colors.orange.default.hex }}" })
hl(0, "@lsp.type.namespace", { fg = "{{ colors.lavender.default.hex }}", italic = true })

-- Terminal

vim.g.terminal_color_0 = "{{ colors.surface.default.hex }}"
vim.g.terminal_color_1 = "{{ colors.red.default.hex }}"
vim.g.terminal_color_2 = "{{ colors.green.default.hex }}"
vim.g.terminal_color_3 = "{{ colors.yellow.default.hex }}"
vim.g.terminal_color_4 = "{{ colors.blue.default.hex }}"
vim.g.terminal_color_5 = "{{ colors.purple.default.hex }}"
vim.g.terminal_color_6 = "{{ colors.teal.default.hex }}"
vim.g.terminal_color_7 = "{{ colors.on_surface.default.hex }}"
vim.g.terminal_color_8 = "{{ colors.surface_variant.default.hex }}"
vim.g.terminal_color_9 = "{{ colors.red.default.hex | lighten: 10 }}"
vim.g.terminal_color_10 = "{{ colors.green.default.hex | lighten: 10 }}"
vim.g.terminal_color_11 = "{{ colors.yellow.default.hex | lighten: 10 }}"
vim.g.terminal_color_12 = "{{ colors.blue.default.hex | lighten: 10 }}"
vim.g.terminal_color_13 = "{{ colors.purple.default.hex | lighten: 10 }}"
vim.g.terminal_color_14 = "{{ colors.teal.default.hex | lighten: 10 }}"
v
