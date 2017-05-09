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

let b:current_syntax = "lvl"
