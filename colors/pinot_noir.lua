-- Courtesy to original author of this colorscheme
-- Check it out here: https://github.com/andreasvc/vim-256noir

local colorbuddy = require 'colorbuddy'

colorbuddy.colorscheme 'pinot_noir'

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles
-- vim.g.colors_name = 'pinot_noir'

local palette = {
  -- for foreground purposes
  fg_white = { gui = '#eeeeee', cterm = 255 },

  -- for constants and stuff
  fg_alt = { gui = '#D0D0D0', cterm = 252 },

  -- third lightest color in the pallette, used for normal text
  fg_grey = { gui = '#bcbcbc', cterm = 250 },

  -- for strings and stuff
  fg_string = { gui = '#8a8a8a', cterm = 245 },

  -- for comments, matching parantheses, signcolumn bg, etc.
  fg_comment = { gui = '#585858', cterm = 240 },

  -- used for background of searching and stuff and statuslinenc
  bg_search = { gui = '#303030', cterm = 236 },

  -- slightly ligther than black color, used for cursorline and stuff
  cursorline_color = { gui = '#121212', cterm = 233 },

  -- slightly lighther than background but still very dark, used for only pmenuthumb
  black = { gui = '#080808', cterm = 232 },

  -- utter black for background
  background = { gui = '#000000', cterm = 16 },

  -- reds
  bright_red = { gui = '#FF0000', cterm = 196 },
  red = { gui = '#AF0000', cterm = 124 },
  dark_red = { gui = '#870000', cterm = 88 },
}

-- initialize all colors from palette
for key, value in pairs(palette) do
  Color.new(key, value.gui)
end

-- EDITOR BASICS
Group.new('Normal', c.fg_grey, c.background, s.none)
Group.new('Keyword', c.white, c.background, s.italic)
Group.new('Constant', c.fg_alt, c.background, s.none)
Group.new('String', c.fg_string, c.background, s.none)
Group.new('Comment', c.fg_comment, c.background, s.italic)
Group.new('Number', c.bright_red, c.background, s.none)
Group.new('Error', c.white, c.dark_red, s.none)
Group.new('ErrorMsg', c.white, c.red, s.none)
Group.new('Search', c.fg_string, c.bg_search, s.none)
Group.new('IncSearch', c.white, c.fg_string, s.reverse)
Group.new('DiffChange', c.dark_red, c.white, s.none)
Group.new('DiffText', c.fg_grey, c.bright_red, s.bold)
Group.new('SignColumn', c.red, c.fg_comment, s.none)
Group.new('SpellBad', c.white, c.dark_red, s.undercurl)
Group.new('SpellCap', c.white, c.red)
Group.new('SpellRare', c.red, c.background, s.none)
Group.new('WildMenu', c.fg_comment, c.white, s.none)
Group.new('Pmenu', c.white, c.fg_comment, s.none)
Group.new('PmenuThumb', c.black, c.fg_comment, s.none)
Group.new('SpecialKey', c.background, c.white, s.none)
Group.new('MatchParen', c.background, c.fg_comment, s.none)
Group.new('CursorLine', c.none, c.cursorline_color, s.none)
Group.new('StatusLine', c.fg_string, c.background, s.bold + s.reverse)
Group.new('StatusLineNC', c.bg_search, c.background, s.reverse)
Group.new('Visual', c.fg_grey, c.fg_comment, s.none)
Group.new('TermCursor', c.none, c.none, s.reverse)
Group.new('Identifier', c.fg_grey, c.background, g.Normal + s.italic)
Group.new('Todo', c.white, c.background, g.Keyword + s.italic)

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
Group.link('SpecialComment', g.String)
Group.link('CursorLineNr', g.String)
Group.link('Character', g.Number)
Group.link('Float', g.Number)
Group.link('Tag', g.Number)
Group.link('Folded', g.Number)
Group.link('WarningMsg', g.Number)
Group.link('iCursor', g.SpecialKey)
Group.link('SpellLocal', g.SpellCap)
Group.link('LineNr', g.Comment)
Group.link('NonText', g.Comment)
Group.link('DiffDelete', g.Comment)
Group.link('diffRemoved', g.Comment)
Group.link('PmenuSbar', g.Visual)
Group.link('PmenuSel', g.Visual)
Group.link('VisualNOS', g.Visual)
Group.link('VertSplit', g.Visual)
Group.link('Cursor', g.StatusLine)
Group.link('Underlined', g.SpellRare)
Group.link('rstEmphasis', g.SpellRare)
Group.link('diffChanged', g.DiffChange)
Group.link('TabLine', g.SpellRare)
Group.link('QuickFixLine', g.String)
Group.link('Whitespace', g.Comment)
Group.link('@variable.builtin', g.Normal)
Group.link('NvimFigureBrace', g.ErrorMsg)
Group.link('NvimInternalError', g.ErrorMsg)
