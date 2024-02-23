# pyright: strict

from colorscheme_generator import generate_colorscheme

# ========================================

colorscheme_name = "my-colorscheme"

colors = {
    "white": 231,
    "black": 16,
    "pink": 197,
    "orange": 208,
    "yellow": 185,
    "green": 112,
    "blue": 81,
    "purple": 141,
}

# Available template variables are "colorscheme_name", keys in colors dict, and
# "text_{color}", where color is one of the keys in colors dict.
#
# "text_{color}" expands to "cterm=NONE ctermfg={color-number} ctermbg=NONE"
#
# You only need to specify cterm settings and corresponding gui settings will be
# automatically generated

template = '''\
" Author: Chi-Sheng Liu

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "$colorscheme_name"

" ========================================
" Default Highlight Groups
" see :help highlight-groups

hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=9
"Conceal
"Cursor
"lCursor
"CursorIM
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=236
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=236
hi Directory $text_blue
hi DiffAdd cterm=reverse,bold ctermfg=108 ctermbg=234
hi DiffChange cterm=reverse,bold ctermfg=103 ctermbg=233
hi DiffDelete cterm=reverse ctermfg=131 ctermbg=236
hi DiffText cterm=reverse,bold ctermfg=208 ctermbg=234
"EndOfBuffer
hi ErrorMsg cterm=NONE ctermfg=233 ctermbg=$pink
hi VertSplit cterm=NONE ctermfg=95 ctermbg=NONE
hi Folded cterm=bold ctermfg=232 ctermbg=228
hi FoldColumn cterm=bold ctermfg=46 ctermbg=NONE
hi SignColumn cterm=NONE ctermfg=NONE ctermbg=NONE
"IncSearch
hi LineNr cterm=NONE ctermfg=102 ctermbg=NONE
"LineNrAbove
"LineNrBelow
hi CursorLineNr cterm=bold ctermfg=226 ctermbg=236
hi MatchParen cterm=NONE ctermfg=233 ctermbg=185
hi ModeMsg $text_yellow
hi MoreMsg $text_yellow
hi NonText cterm=NONE ctermfg=59 ctermbg=NONE
hi Normal cterm=NONE ctermfg=$white ctermbg=233
hi Pmenu cterm=NONE ctermfg=232 ctermbg=255
hi PmenuSel cterm=NONE ctermfg=231 ctermbg=242
hi PmenuSbar cterm=NONE ctermfg=NONE ctermbg=250
hi PmenuThumb cterm=NONE ctermfg=NONE ctermbg=244
hi Question $text_yellow
"QuickFixLine
hi Search cterm=NONE ctermfg=232 ctermbg=221
hi SpecialKey $text_pink
"SpellBad
"SpellCap
"SpellLocal
"SpellRare
hi StatusLine cterm=NONE ctermfg=81 ctermbg=233
hi StatusLineNC cterm=NONE ctermfg=103 ctermbg=233
"StatusLineTerm
"StatusLineTermNC
"TabLine
"TabLineFill
"TabLineSel
"Terminal
hi Title $text_yellow
hi Visual cterm=NONE ctermfg=NONE ctermbg=59
"VisualNOS
hi WarningMsg $text_pink
"WildMenu
"Menu
"Scrollbar
"Tooltip

" ========================================
" Syntax Groups
" see :help group-name

hi Comment cterm=NONE ctermfg=67 ctermbg=NONE

hi Constant $text_purple
hi String $text_yellow
hi Character $text_yellow
"Number
"Boolean
"Float

hi Identifier $text_green
"Function

hi Statement $text_pink
"Conditional
"Repeat
"Label
"Operator
"Keyword
"Exception

hi PreProc $text_green
hi Include $text_pink
hi Define $text_blue
"Macro
"PreCondit

hi Type $text_blue
"StorageClass
"Structure
"Typedef

hi Special $text_purple
hi SpecialChar $text_pink
hi Tag $text_pink
hi Delimiter $text_white
hi SpecialComment $text_blue
hi Debug $text_blue

hi Underlined $text_green

hi Ignore cterm=NONE ctermfg=NONE ctermbg=NONE

hi Error cterm=NONE ctermfg=$white ctermbg=160

hi Todo cterm=bold ctermfg=$white ctermbg=9

" ========================================
" Filetype specific syntax highlighting, including plugins

" json
hi jsonKeyword $text_white
hi jsonNull $text_purple
hi jsonQuote $text_white

" jsonc
hi jsoncBraces $text_white
hi jsoncKeywordMatch $text_white

" javascript
hi jsBuiltins $text_blue
hi jsClassKeyword $text_blue
hi jsExceptions $text_blue
hi jsExportDefault $text_pink
hi jsFuncArgOperator $text_pink
hi jsFuncArgs $text_orange
hi jsFuncCall $text_blue
hi jsGlobalNodeObjects $text_blue
hi jsGlobalObjects $text_blue
hi jsNull $text_purple
hi jsTemplateBraces $text_blue
hi jsTemplateExpression $text_blue
hi jsThis $text_orange

" jsx
hi jsxAttrib $text_green
hi jsxBraces $text_white
hi jsxClosePunct $text_white
hi jsxCloseString $text_white
hi jsxComponentName $text_pink
hi jsxDot $text_white
hi jsxEqual $text_white
hi jsxOpenPunct $text_white
hi jsxTagName $text_pink

" sh
hi link shSheBang Comment
hi shCaseEsac $text_pink
hi shDerefSimple $text_blue
hi shDerefVarArray $text_orange
hi shEcho $text_orange
hi shForPP $text_white
hi shLoop $text_pink
hi shOption $text_orange
hi shSnglCase $text_pink
hi shStatement $text_blue

" yaml
hi yamlDocumentStart $text_pink
hi yamlFlowIndicator $text_white
hi yamlFlowStringDelimiter $text_white
hi yamlKeyValueDelimiter $text_white
hi yamlPlainScalar $text_yellow

" dockerfile
hi dockerfileKeyword $text_pink
hi dockerfileOption $text_orange

" docker-compose
hi dockercomposeKeywords $text_green

" gitignore
hi gitignoreSeparator $text_white
hi gitignoreWildcard $text_pink

" go template
hi gotplAction $text_blue

" python
hi pythonBuiltinFunc $text_blue
hi pythonBuiltinObj $text_white
hi pythonClass $text_green
hi pythonClassVar $text_orange
hi pythonDecorator $text_pink
hi pythonDottedName $text_blue
hi pythonFunctionCall $text_blue
hi pythonStrFormat $text_blue
hi pythonStrInterpRegion $text_blue
hi pythonStrTemplate $text_blue

" c
hi cFormat $text_pink
hi cSpecial $text_purple
hi cSpecialCharacter $text_pink
hi cStorageClass $text_pink

" c++
hi cppSTLnamespace $text_white
hi cppSTLvariable $text_white

" make
hi makeCmdNextLine $text_white
hi makeCommands $text_blue
hi makeIdent $text_orange

" php
hi phpParent $text_white

" go
hi goConst $text_blue
hi goDeclType $text_blue
hi goDeclaration $text_blue
hi goField $text_blue
hi goPackage $text_blue
hi goParamName $text_orange
hi goParamType $text_blue
hi goTypeDecl $text_blue
hi goTypeName $text_green
hi goVar $text_blue

" html
hi htmlArg $text_green
hi htmlEndTag $text_white
hi htmlTag $text_white
hi htmlTitle $text_white

" css
hi cssAttr $text_white
hi cssAttrComma $text_white
hi cssAttributeSelector $text_green
hi cssBraces $text_white
hi cssImportant $text_pink
hi cssMediaType $text_blue
hi cssSelectorOp $text_white
hi cssSelectorOp2 $text_pink
hi cssVendor $text_orange

" scss
hi scssAmpersand $text_pink
hi scssDefault $text_pink
hi scssMixin $text_pink
hi scssVariable $text_orange

" graphql
hi graphqlName $text_orange
hi graphqlTemplateString $text_white
hi graphqlStructure $text_pink

" markdown
hi htmlBold cterm=bold ctermfg=$white ctermbg=NONE
hi htmlH1 cterm=bold ctermfg=$blue ctermbg=NONE
hi mkdCodeDelimiter $text_pink
hi mkdHeading $text_pink
hi mkdListItem $text_pink
hi mkdRule $text_pink
hi mkdURL $text_purple

" typescript
hi typescriptAbstract $text_pink
hi typescriptAliasKeyword $text_blue
hi typescriptAmbientDeclaration $text_blue
hi typescriptArrayMethod $text_blue
hi typescriptArrowFuncArg $text_orange
hi typescriptAssign $text_pink
hi typescriptBOMLocationMethod $text_blue
hi typescriptBinaryOp $text_pink
hi typescriptBraces $text_white
hi typescriptCacheMethod $text_blue
hi typescriptCall $text_orange
hi typescriptCastKeyword $text_pink
hi typescriptClassHeritage $text_green
hi typescriptClassKeyword $text_blue
hi typescriptClassName $text_green
hi typescriptConsoleMethod $text_blue
hi typescriptConstructSignature $text_pink
hi typescriptConstructorType $text_pink
hi typescriptDOMDocMethod $text_blue
hi typescriptDOMFormProp $text_white
hi typescriptES6SetMethod $text_blue
hi typescriptEndColons $text_white
hi typescriptEnum $text_green
hi typescriptEnumKeyword $text_blue
hi typescriptExceptions $text_pink
hi typescriptExport $text_pink
hi typescriptFuncComma $text_white
hi typescriptFuncKeyword $text_blue
hi typescriptFuncType $text_orange
hi typescriptFuncTypeArrow $text_blue
hi typescriptIdentifier $text_orange
hi typescriptImport $text_pink
hi typescriptImportType $text_pink
hi typescriptInterfaceKeyword $text_blue
hi typescriptJSONStaticMethod $text_blue
hi typescriptKeywordOp $text_pink
hi typescriptMathStaticMethod $text_blue
hi typescriptMember $text_white
hi typescriptMemberOptionality $text_pink
hi typescriptModule $text_blue
hi typescriptObjectLabel $text_white
hi typescriptOperator $text_pink
hi typescriptOptionalMark $text_pink
hi typescriptPromiseMethod $text_blue
hi typescriptResponseProp $text_white
hi typescriptRestOrSpread $text_pink
hi typescriptStringMethod $text_blue
hi typescriptTemplateSB $text_blue
hi typescriptTemplateSubstitution $text_blue
hi typescriptTypeBracket $text_pink
hi typescriptTypeParameter $text_orange
hi typescriptTypeReference $text_blue
hi typescriptVariable $text_blue

" sql
hi Quote $text_white
hi sqlKeyword $text_pink
hi sqlFunction $text_blue

" prisma
hi prismaFunction $text_blue
hi prismaFunctionArgs $text_orange
hi prismaValue $text_blue
'''

# ========================================

generate_colorscheme(colorscheme_name, template, colors)
