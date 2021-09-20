" Author: Chi-Sheng Liu

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "my-colorscheme"

" ========================================
" Default Highlight Groups
" see :help highlight-groups

hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=9 gui=NONE guifg=NONE guibg=#ef2929
"Conceal
"Cursor
"lCursor
"CursorIM
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=#303030
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=#303030
hi Directory cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi DiffAdd cterm=reverse,bold ctermfg=108 ctermbg=234 gui=reverse,bold guifg=#87af87 guibg=#1c1c1c
hi DiffChange cterm=reverse,bold ctermfg=103 ctermbg=233 gui=reverse,bold guifg=#8787af guibg=#121212
hi DiffDelete cterm=reverse ctermfg=131 ctermbg=236 gui=reverse guifg=#af5f5f guibg=#303030
hi DiffText cterm=reverse,bold ctermfg=208 ctermbg=234 gui=reverse,bold guifg=#ff8700 guibg=#1c1c1c
"EndOfBuffer
hi ErrorMsg cterm=NONE ctermfg=233 ctermbg=197 gui=NONE guifg=#121212 guibg=#ff005f
hi VertSplit cterm=NONE ctermfg=95 ctermbg=NONE gui=NONE guifg=#875f5f guibg=NONE
hi Folded cterm=bold ctermfg=232 ctermbg=228 gui=bold guifg=#080808 guibg=#ffff87
hi FoldColumn cterm=bold ctermfg=46 ctermbg=NONE gui=bold guifg=#00ff00 guibg=NONE
hi SignColumn cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
"IncSearch
hi LineNr cterm=NONE ctermfg=102 ctermbg=NONE gui=NONE guifg=#878787 guibg=NONE
"LineNrAbove
"LineNrBelow
hi CursorLineNr cterm=bold ctermfg=226 ctermbg=236 gui=bold guifg=#ffff00 guibg=#303030
hi MatchParen cterm=NONE ctermfg=233 ctermbg=185 gui=NONE guifg=#121212 guibg=#d7d75f
hi ModeMsg cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
hi MoreMsg cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
hi NonText cterm=NONE ctermfg=59 ctermbg=NONE gui=NONE guifg=#5f5f5f guibg=NONE
hi Normal cterm=NONE ctermfg=231 ctermbg=233 gui=NONE guifg=#ffffff guibg=#121212
hi Pmenu cterm=NONE ctermfg=232 ctermbg=255 gui=NONE guifg=#080808 guibg=#eeeeee
hi PmenuSel cterm=NONE ctermfg=231 ctermbg=242 gui=NONE guifg=#ffffff guibg=#666666
hi PmenuSbar cterm=NONE ctermfg=NONE ctermbg=250 gui=NONE guifg=NONE guibg=#bcbcbc
hi PmenuThumb cterm=NONE ctermfg=NONE ctermbg=244 gui=NONE guifg=NONE guibg=#808080
hi Question cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
"QuickFixLine
hi Search cterm=NONE ctermfg=232 ctermbg=221 gui=NONE guifg=#080808 guibg=#ffd75f
hi SpecialKey cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
"SpellBad
"SpellCap
"SpellLocal
"SpellRare
hi StatusLine cterm=NONE ctermfg=81 ctermbg=233 gui=NONE guifg=#5fd7ff guibg=#121212
hi StatusLineNC cterm=NONE ctermfg=103 ctermbg=233 gui=NONE guifg=#8787af guibg=#121212
"StatusLineTerm
"StatusLineTermNC
"TabLine
"TabLineFill
"TabLineSel
"Terminal
hi Title cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
hi Visual cterm=NONE ctermfg=NONE ctermbg=59 gui=NONE guifg=NONE guibg=#5f5f5f
"VisualNOS
hi WarningMsg cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
"WildMenu
"Menu
"Scrollbar
"Tooltip

" ========================================
" Syntax Groups
" see :help group-name

hi Comment cterm=NONE ctermfg=67 ctermbg=NONE gui=NONE guifg=#5f87af guibg=NONE

hi Constant cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE
hi String cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
hi Character cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE
"Number
"Boolean
"Float

hi Identifier cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
"Function

hi Statement cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
"Conditional
"Repeat
"Label
"Operator
"Keyword
"Exception

hi PreProc cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi Include cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi Define cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
"Macro
"PreCondit

hi Type cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
"StorageClass
"Structure
"Typedef

hi Special cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE
hi SpecialChar cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi Tag cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi Delimiter cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi SpecialComment cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi Debug cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE

hi Underlined cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE

hi Ignore cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

hi Error cterm=NONE ctermfg=231 ctermbg=160 gui=NONE guifg=#ffffff guibg=#d70000

hi Todo cterm=bold ctermfg=NONE ctermbg=9 gui=bold guifg=NONE guibg=#ef2929

" ========================================
" Filetype specific syntax highlighting, including syntax groups coming from the
" plugin 'sheerun/vim-polyglot'

" json
hi jsonKeyword cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsonNull cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE
hi jsonQuote cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" jsonc
hi jsoncBraces cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsoncKeywordMatch cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" javascript
hi jsClassKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsExportDefault cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi jsFuncArgOperator cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi jsFuncArgs cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi jsFuncCall cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsGlobalNodeObjects cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsGlobalObjects cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsNull cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE
hi jsTemplateBraces cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsTemplateExpression cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi jsThis cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE

" jsx
hi jsxAttrib cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi jsxBraces cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxClosePunct cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxCloseString cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxComponentName cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi jsxDot cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxEqual cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxOpenPunct cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi jsxTagName cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE

" sh
hi link shSheBang Comment
hi shCaseEsac cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi shDerefSimple cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi shDerefVarArray cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi shEcho cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi shForPP cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi shLoop cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi shOption cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi shSnglCase cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi shStatement cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE

" yaml
hi yamlDocumentStart cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi yamlFlowIndicator cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi yamlFlowStringDelimiter cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi yamlKeyValueDelimiter cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi yamlPlainScalar cterm=NONE ctermfg=185 ctermbg=NONE gui=NONE guifg=#d7d75f guibg=NONE

" dockerfile
hi dockerfileKeyword cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi dockerfileOption cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE

" docker-compose
hi dockercomposeKeywords cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE

" gitignore
hi gitignoreSeparator cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi gitignoreWildcard cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE

" go template
hi gotplAction cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE

" python
hi pythonBuiltinFunc cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi pythonBuiltinObj cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi pythonClass cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi pythonClassVar cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi pythonDecorator cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi pythonDottedName cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi pythonFunctionCall cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi pythonStrFormat cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi pythonStrInterpRegion cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi pythonStrTemplate cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE

" c
hi cFormat cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi cSpecial cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE
hi cSpecialCharacter cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi cStorageClass cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE

" c++
hi cppSTLnamespace cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi cppSTLvariable cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" make
hi makeCmdNextLine cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi makeCommands cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi makeIdent cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE

" php
hi phpParent cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" go
hi goConst cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goDeclType cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goDeclaration cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goField cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goPackage cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goParamName cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi goParamType cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goTypeDecl cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi goTypeName cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi goVar cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE

" html
hi htmlArg cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi htmlEndTag cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi htmlTag cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi htmlTitle cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" css
hi cssAttr cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi cssAttrComma cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi cssAttributeSelector cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi cssBraces cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi cssImportant cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi cssMediaType cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi cssSelectorOp cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi cssSelectorOp2 cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi cssVendor cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE

" scss
hi scssAmpersand cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi scssDefault cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi scssMixin cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi scssVariable cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE

" graphql
hi graphqlName cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi graphqlTemplateString cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi graphqlStructure cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE

" markdown
hi htmlBold cterm=bold ctermfg=231 ctermbg=NONE gui=bold guifg=#ffffff guibg=NONE
hi htmlH1 cterm=bold ctermfg=81 ctermbg=NONE gui=bold guifg=#5fd7ff guibg=NONE
hi mkdCodeDelimiter cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi mkdHeading cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi mkdListItem cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi mkdRule cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi mkdURL cterm=NONE ctermfg=141 ctermbg=NONE gui=NONE guifg=#af87ff guibg=NONE

" typescript
hi typescriptAbstract cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptAliasKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptAmbientDeclaration cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptArrayMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptArrowFuncArg cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi typescriptAssign cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptBOMLocationMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptBinaryOp cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptBraces cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptCacheMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptCall cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi typescriptCastKeyword cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptClassHeritage cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi typescriptClassKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptClassName cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi typescriptConsoleMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptConstructSignature cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptConstructorType cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptDOMDocMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptDOMFormProp cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptES6SetMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptEndColons cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptEnum cterm=NONE ctermfg=112 ctermbg=NONE gui=NONE guifg=#87d700 guibg=NONE
hi typescriptEnumKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptExceptions cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptExport cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptFuncComma cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptFuncKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptFuncType cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi typescriptFuncTypeArrow cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptIdentifier cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi typescriptImport cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptImportType cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptInterfaceKeyword cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptJSONStaticMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptKeywordOp cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptMathStaticMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptMember cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptMemberOptionality cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptModule cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptObjectLabel cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptOperator cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptOptionalMark cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptPromiseMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptResponseProp cterm=NONE ctermfg=231 ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi typescriptRestOrSpread cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptStringMethod cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptTemplateSB cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptTemplateSubstitution cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptTypeBracket cterm=NONE ctermfg=197 ctermbg=NONE gui=NONE guifg=#ff005f guibg=NONE
hi typescriptTypeParameter cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#ff8700 guibg=NONE
hi typescriptTypeReference cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
hi typescriptVariable cterm=NONE ctermfg=81 ctermbg=NONE gui=NONE guifg=#5fd7ff guibg=NONE
