let b:current_syntax='odin'
set commentstring=//\ %s

syntax keyword odinKeyword
  \ defer if else for in not_in break continue switch case return
  \ or_break or_else or_continue or_return
  \ proc struct union enum distinct dynamic map bit_set bit_field
  \ transmute cast inline no_inline type_of size_of align_of
  \ package using foreign import inline no_inline

syntax match odinPointerType '\v%x5e\zs\i+\ze' display

syntax match odinCompilerDirective '\v#\i+' display

syntax keyword odinConstant true false nil

syntax match odinConstant '\-\-\-'

syntax match odinArrayType '\v\]\zs\i+\ze' contains=odinArrayIndex

syntax match odinReturnType '\v-\>\s*\zs\i+[^(]\ze'

syntax match odinEnumBackingType '\venum\s+\zs\i+\ze'

syntax match odinAttribute "\v\@\w+" display

syntax match odinTypeDeclaration '\v\zs\i+\ze\s+::\s*(distinct|enum|struct|union|bit_set|map|bit_field|\[|\^)'

syntax region odinAttribute
      \ matchgroup=odinAttribute
      \ start="@\ze(" end="\ze)"
      \ transparent oneline

syntax match odinInteger "\v<[0-9][0-9_]*>"
syntax match odinFloat "\-\?\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\="
syntax match odinHex "\<0[xX][0-9A-Fa-f_]\+\>"
syntax match odinOct "\<0[oO][0-7_]\+\>"
syntax match odinBin "\<0[bB][01_]\+\>"

syntax region odinLineComment start=/\/\// end=/$/  contains=@Spell
syntax region odinBlockComment start=/\/\*/ end=/\*\// contains=@Spell,odinBlockComment

syntax match odinEnumValue ' \zs\.\w\+\ze'

syntax match odinStructLiteral '\v\s+\zs\i+\ze(\(.{-}\))?\{'

syntax match odinTypeSpec '\v\i+\s*:\s*\zs\i+\ze($|,|\))'

hi! link odinKeyword Keyword
hi! link odinCompilerDirective Keyword

hi! link odinEnumValue Label

syntax region odinRawString start=+`+ end=+`+
syntax region odinChar start=+'+ skip=+\\\\\|\\'+ end=+'+
syntax region odinString start=+"+ skip=+\\\\\|\\'+ end=+"+ contains=odinEscape
syntax match odinEscape display contained /\\\([nrt\\'"]\|x\x\{2}\)/

hi! link odinInteger Number
hi! link odinFloat Number
hi! link odinHex Number
hi! link odinDoz Number
hi! link odinOct Number
hi! link odinBin Number

hi! link odinLineComment Comment
hi! link odinBlockComment Comment

hi! link odinString String
hi! link odinRawString String
hi! link odinChar Label
hi! link odinEscape Special

hi! link odinStructLiteral Type
hi! link odinEnumBackingType Type
hi! link odinTypeDeclaration Type
hi! link odinPointerType Type
hi! link odinArrayType Type
hi! link odinReturnType Type

hi! link odinTypeSpec Type
hi! link odinConstant Type

hi! link odinAttribute Namespace

