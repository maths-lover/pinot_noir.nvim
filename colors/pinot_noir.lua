-- A modern Neovim take on vim-256noir by andreasvc
-- https://github.com/andreasvc/vim-256noir

local colorbuddy = require 'colorbuddy'

colorbuddy.colorscheme 'pinot_noir'

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

local palette = {
  -- brightest foreground, used for keywords and emphasis
  fg_white = { gui = '#eeeeee', cterm = 255 },

  -- slightly dimmer, used for constants and literals
  fg_alt = { gui = '#D0D0D0', cterm = 252 },

  -- base foreground for normal text
  fg_grey = { gui = '#bcbcbc', cterm = 250 },

  -- muted, used for strings
  fg_string = { gui = '#8a8a8a', cterm = 245 },

  -- dimmest foreground, used for comments and line numbers
  fg_comment = { gui = '#585858', cterm = 240 },

  -- dark background used for search highlights and inactive statusline
  bg_search = { gui = '#303030', cterm = 236 },

  -- slightly lighter than background, used for cursorline
  cursorline_color = { gui = '#121212', cterm = 233 },

  -- very dark, used for pmenuthumb
  black = { gui = '#080808', cterm = 232 },

  -- pure black background
  background = { gui = '#000000', cterm = 16 },

  -- accent reds for numbers, errors, diffs
  bright_red = { gui = '#FF0000', cterm = 196 },
  red = { gui = '#AF0000', cterm = 124 },
  dark_red = { gui = '#870000', cterm = 88 },
}

-- initialize all colors from palette
for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

-- ============================================================================
-- EDITOR BASICS (matching vim-256noir exactly)
-- ============================================================================
Group.new('Normal', c.fg_grey, c.background, s.none)
Group.new('Keyword', c.fg_white, c.background, s.none)
Group.new('Constant', c.fg_alt, c.background, s.none)
Group.new('String', c.fg_string, c.background, s.none)
Group.new('Comment', c.fg_comment, c.background, s.none)
Group.new('Number', c.bright_red, c.background, s.none)
Group.new('Identifier', c.fg_grey, c.background, s.none)
Group.new('Todo', c.fg_white, c.background, s.none)
Group.new('Error', c.fg_white, c.dark_red, s.none)
Group.new('ErrorMsg', c.fg_white, c.red, s.none)
Group.new('Search', c.fg_string, c.bg_search, s.none)
Group.new('IncSearch', c.fg_white, c.fg_string, s.reverse)
Group.new('DiffChange', c.dark_red, c.fg_white, s.none)
Group.new('DiffText', c.fg_grey, c.bright_red, s.bold)
Group.new('SignColumn', c.red, c.background, s.none)
Group.new('SpellBad', c.fg_white, c.dark_red, s.undercurl)
Group.new('SpellCap', c.fg_white, c.red)
Group.new('SpellRare', c.red, c.background, s.none)
Group.new('WildMenu', c.fg_comment, c.fg_white, s.none)
Group.new('Pmenu', c.fg_white, c.fg_comment, s.none)
Group.new('PmenuThumb', c.black, c.fg_comment, s.none)
Group.new('SpecialKey', c.background, c.fg_white, s.none)
Group.new('MatchParen', c.background, c.fg_comment, s.none)
Group.new('CursorLine', c.none, c.cursorline_color, s.none)
Group.new('StatusLine', c.fg_string, c.background, s.bold + s.reverse)
Group.new('StatusLineNC', c.bg_search, c.background, s.reverse)
Group.new('Visual', c.fg_grey, c.fg_comment, s.none)
Group.new('TermCursor', c.none, c.none, s.reverse)

-- ============================================================================
-- LINKED VIM SYNTAX GROUPS
-- ============================================================================

-- Treated as Normal (base text)
Group.link('Boolean', g.Normal)
Group.link('Delimiter', g.Normal)
Group.link('Title', g.Normal)
Group.link('Debug', g.Normal)
Group.link('Exception', g.Normal)
Group.link('FoldColumn', g.Normal)
Group.link('Macro', g.Normal)
Group.link('ModeMsg', g.Normal)
Group.link('MoreMsg', g.Normal)
Group.link('Question', g.Normal)

-- Treated as Keyword (bright white)
Group.link('Conditional', g.Keyword)
Group.link('Statement', g.Keyword)
Group.link('Operator', g.Keyword)
Group.link('Structure', g.Keyword)
Group.link('Function', g.Keyword)
Group.link('Include', g.Keyword)
Group.link('Type', g.Keyword)
Group.link('Typedef', g.Keyword)
Group.link('Label', g.Keyword)
Group.link('Define', g.Keyword)
Group.link('DiffAdd', g.Keyword)
Group.link('diffAdded', g.Keyword)
Group.link('diffCommon', g.Keyword)
Group.link('Directory', g.Keyword)
Group.link('PreCondit', g.Keyword)
Group.link('PreProc', g.Keyword)
Group.link('Repeat', g.Keyword)
Group.link('Special', g.Keyword)
Group.link('SpecialChar', g.Keyword)
Group.link('StorageClass', g.Keyword)

-- Treated as String (medium gray)
Group.link('SpecialComment', g.String)
Group.link('CursorLineNr', g.String)

-- Treated as Number (bright red)
Group.link('Character', g.Number)
Group.link('Float', g.Number)
Group.link('Tag', g.Number)
Group.link('Folded', g.Number)
Group.link('WarningMsg', g.Number)

-- Treated as Comment (dark gray)
Group.link('LineNr', g.Comment)
Group.link('NonText', g.Comment)
Group.link('DiffDelete', g.Comment)
Group.link('diffRemoved', g.Comment)
Group.link('Whitespace', g.Comment)

-- Treated as Visual
Group.link('PmenuSbar', g.Visual)
Group.link('PmenuSel', g.Visual)
Group.link('VisualNOS', g.Visual)
Group.link('VertSplit', g.Visual)

-- Other links
Group.link('iCursor', g.SpecialKey)
Group.link('Cursor', g.StatusLine)
Group.link('SpellLocal', g.SpellCap)
Group.link('Underlined', g.SpellRare)
Group.link('rstEmphasis', g.SpellRare)
Group.link('diffChanged', g.DiffChange)
Group.link('TabLine', g.SpellRare)
Group.link('QuickFixLine', g.String)
Group.link('NvimFigureBrace', g.ErrorMsg)
Group.link('NvimInternalError', g.ErrorMsg)

-- ============================================================================
-- MODERN UI GROUPS
-- ============================================================================
Group.new('FloatBorder', c.fg_comment, c.background, s.none)
Group.new('FloatTitle', c.fg_white, c.background, s.none)
Group.new('NormalFloat', c.fg_grey, c.background, s.none)
Group.new('WinSeparator', c.bg_search, c.background, s.none)
Group.new('CursorColumn', c.none, c.cursorline_color, s.none)
Group.new('ColorColumn', c.none, c.cursorline_color, s.none)
Group.new('TabLineFill', c.none, c.background, s.none)
Group.new('TabLineSel', c.fg_white, c.background, s.bold)

-- ============================================================================
-- LSP DIAGNOSTICS
-- ============================================================================
Group.new('DiagnosticError', c.red, c.none, s.none)
Group.new('DiagnosticWarn', c.fg_alt, c.none, s.none)
Group.new('DiagnosticInfo', c.fg_string, c.none, s.none)
Group.new('DiagnosticHint', c.fg_comment, c.none, s.none)
Group.new('DiagnosticUnderlineError', c.none, c.none, s.undercurl)
Group.new('DiagnosticUnderlineWarn', c.none, c.none, s.undercurl)
Group.new('DiagnosticUnderlineInfo', c.none, c.none, s.undercurl)
Group.new('DiagnosticUnderlineHint', c.none, c.none, s.undercurl)
Group.link('DiagnosticVirtualTextError', g.DiagnosticError)
Group.link('DiagnosticVirtualTextWarn', g.DiagnosticWarn)
Group.link('DiagnosticVirtualTextInfo', g.DiagnosticInfo)
Group.link('DiagnosticVirtualTextHint', g.DiagnosticHint)
Group.new('DiagnosticSignError', c.red, c.background, s.none)
Group.new('DiagnosticSignWarn', c.fg_alt, c.background, s.none)
Group.new('DiagnosticSignInfo', c.fg_string, c.background, s.none)
Group.new('DiagnosticSignHint', c.fg_comment, c.background, s.none)

-- ============================================================================
-- TREESITTER HIGHLIGHTS
-- ============================================================================

-- Identifiers
Group.link('@variable', g.Normal)
Group.link('@variable.builtin', g.Normal)
Group.link('@variable.parameter', g.Normal)
Group.link('@variable.member', g.Normal)
Group.link('@constant', g.Constant)
Group.link('@constant.builtin', g.Constant)
Group.link('@constant.macro', g.Constant)
Group.link('@module', g.Normal)
Group.link('@label', g.Keyword)

-- Literals
Group.link('@string', g.String)
Group.link('@string.escape', g.Keyword)
Group.link('@string.special', g.Keyword)
Group.link('@character', g.Number)
Group.link('@number', g.Number)
Group.link('@number.float', g.Number)
Group.link('@boolean', g.Normal)

-- Types
Group.link('@type', g.Keyword)
Group.link('@type.builtin', g.Keyword)
Group.link('@type.definition', g.Keyword)
Group.link('@attribute', g.Keyword)
Group.link('@property', g.Normal)

-- Functions
Group.link('@function', g.Keyword)
Group.link('@function.builtin', g.Keyword)
Group.link('@function.macro', g.Keyword)
Group.link('@function.method', g.Keyword)
Group.link('@constructor', g.Keyword)

-- Keywords
Group.link('@keyword', g.Keyword)
Group.link('@keyword.function', g.Keyword)
Group.link('@keyword.operator', g.Keyword)
Group.link('@keyword.return', g.Keyword)
Group.link('@keyword.import', g.Keyword)
Group.link('@keyword.repeat', g.Keyword)
Group.link('@keyword.conditional', g.Keyword)
Group.link('@keyword.exception', g.Keyword)
Group.link('@operator', g.Keyword)

-- Punctuation
Group.link('@punctuation.bracket', g.Normal)
Group.link('@punctuation.delimiter', g.Normal)
Group.link('@punctuation.special', g.Keyword)

-- Comments
Group.link('@comment', g.Comment)
Group.link('@comment.todo', g.Todo)
Group.link('@comment.note', g.Todo)
Group.link('@comment.warning', g.WarningMsg)
Group.link('@comment.error', g.Error)

-- Markup
Group.link('@markup.heading', g.Keyword)
Group.link('@markup.strong', g.Keyword)
Group.link('@markup.italic', g.Normal)
Group.link('@markup.link', g.String)
Group.link('@markup.link.url', g.String)
Group.link('@markup.raw', g.String)
Group.link('@markup.list', g.Keyword)

-- Tags (HTML/JSX)
Group.link('@tag', g.Keyword)
Group.link('@tag.attribute', g.Normal)
Group.link('@tag.delimiter', g.Comment)

-- ============================================================================
-- LSP SEMANTIC TOKENS
-- ============================================================================
Group.link('@lsp.type.class', g.Keyword)
Group.link('@lsp.type.decorator', g.Keyword)
Group.link('@lsp.type.enum', g.Keyword)
Group.link('@lsp.type.enumMember', g.Constant)
Group.link('@lsp.type.function', g.Keyword)
Group.link('@lsp.type.interface', g.Keyword)
Group.link('@lsp.type.method', g.Keyword)
Group.link('@lsp.type.namespace', g.Normal)
Group.link('@lsp.type.parameter', g.Normal)
Group.link('@lsp.type.property', g.Normal)
Group.link('@lsp.type.struct', g.Keyword)
Group.link('@lsp.type.type', g.Keyword)
Group.link('@lsp.type.variable', g.Normal)
