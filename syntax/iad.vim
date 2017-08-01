" Vim syntax file
" Language: IAD Level

if exists("b:current_syntax")
  finish
endif

syn case ignore

" REFERENCE https://github.com/wlangstroth/vim-racket/blob/master/syntax/racket.vim

syntax match iadCharacter "\\."
syntax match iadCharacter "\\o\%([0-3]\o\{2\}\|\o\{1,2\}\)"
syntax match iadCharacter "\\u\x\{4\}"
syntax match iadCharacter "\\space"
syntax match iadCharacter "\\tab"
syntax match iadCharacter "\\newline"
syntax match iadCharacter "\\return"
syntax match iadCharacter "\\backspace"

syntax match iadDefine "define\(-\w*\)\?"

syntax keyword iadCommentTodo contained FIXME TODO FIXME: TODO:

syntax match iadComment ";.*$" contains=iadCommentTodo,@Spell
syntax match iadStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained

syntax cluster iadTop contains=@Spell,iadCharacter,iadSpecial,iadComment,iadMap,iadNumber,iadSexp,iadString,iadVector
syntax region iadSexp   matchgroup=iadParen start="("  matchgroup=iadParen end=")" contains=@iadTop fold
syntax region iadVector matchgroup=iadParen start="\[" matchgroup=iadParen end="]" contains=@iadTop fold
syntax region iadMap    matchgroup=iadParen start="{"  matchgroup=iadParen end="}" contains=@iadTop fold
syntax region iadString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=iadStringEscape,@Spell
syntax match clojureKeyword "\v<:{1,2}%([^ \n\r\t()\[\]{}";@^`~\\%/]+/)*[^ \n\r\t()\[\]{}";@^`~\\%/]+:@<!>"

syntax match iadNumber "\v<[-+]?%(0\o*|0x\x+|[1-9]\d*)N?>"
syntax match iadNumber "\v<[-+]?%(0|[1-9]\d*|%(0|[1-9]\d*)\.\d*)%(M|[eE][-+]?\d+)?>"
syntax match iadNumber "\v<[-+]?%(0|[1-9]\d*)/%(0|[1-9]\d*)>"

syntax match iadError "]\|}\|)"

syntax sync fromstart

syntax keyword iadForms module import 
syntax keyword iadBoolean true false

highlight default link iadConstant			Constant
highlight default link iadCharacter			Character
highlight default link iadNumber			Number
highlight default link iadString			String
highlight default link iadStringEscape		Character

highlight default link iadComment			Comment
highlight default link iadCommentTodo		Todo
highlight default link iadString			String

highlight default link iadDefine			Define
highlight default link iadForms			Define
highlight default link iadKeys			Special
highlight default link iadBoolean		Boolean

"TODO map keys


let b:current_syntax = "iad"
