" Vim syntax file
" Language: IAD Level

if exists("b:current_syntax")
  finish
endif

syntax match lvlCharacter "\\."
syntax match lvlCharacter "\\o\%([0-3]\o\{2\}\|\o\{1,2\}\)"
syntax match lvlCharacter "\\u\x\{4\}"
syntax match lvlCharacter "\\space"
syntax match lvlCharacter "\\tab"
syntax match lvlCharacter "\\newline"
syntax match lvlCharacter "\\return"
syntax match lvlCharacter "\\backspace"

syntax keyword lvlCommentTodo contained FIXME TODO FIXME: TODO:

syntax match lvlComment ";.*$" contains=lvlCommentTodo,@Spell
syntax match lvlStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained

syntax cluster lvlTop contains=@Spell,lvlCharacter,lvlSpecial,lvlComment,lvlMap,lvlNumber,lvlSexp,lvlString,lvlVector
syntax region lvlSexp   matchgroup=lvlParen start="("  matchgroup=lvlParen end=")" contains=@lvlTop fold
syntax region lvlVector matchgroup=lvlParen start="\[" matchgroup=lvlParen end="]" contains=@lvlTop fold
syntax region lvlMap    matchgroup=lvlParen start="{"  matchgroup=lvlParen end="}" contains=@lvlTop fold
syntax region lvlString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=lvlStringEscape,@Spell
syntax match clojureKeyword "\v<:{1,2}%([^ \n\r\t()\[\]{}";@^`~\\%/]+/)*[^ \n\r\t()\[\]{}";@^`~\\%/]+:@<!>"

syntax match lvlNumber "\v<[-+]?%(0\o*|0x\x+|[1-9]\d*)N?>"
syntax match lvlNumber "\v<[-+]?%(0|[1-9]\d*|%(0|[1-9]\d*)\.\d*)%(M|[eE][-+]?\d+)?>"
syntax match lvlNumber "\v<[-+]?%(0|[1-9]\d*)/%(0|[1-9]\d*)>"

syntax match lvlError "]\|}\|)"

syntax sync fromstart

syntax keyword lvlSpecial deflvl import

highlight default link lvlConstant			Constant
highlight default link lvlCharacter			Character
highlight default link lvlNumber			Number
highlight default link lvlString			String
highlight default link lvlStringEscape		Character

highlight default link lvlComment			Comment
highlight default link lvlCommentTodo		Todo
highlight default link lvlString			String

highlight default link lvlSpecial			Define

"TODO map keys


let b:current_syntax = "lvl"
