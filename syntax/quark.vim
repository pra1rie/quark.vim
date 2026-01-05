" ==============================================================================
" Vim syntax file
" Language:        Quark syntax highlight
" Original Author: Rumi <https://github.com/pra1rie>
" URL:             https://github.com/pra1rie/quark.vim
" Last Change:     January 5, 2026
"
" quark (https://github.com/richardhbtz/quark) syntax for (neo)vim
" ==============================================================================

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syn keyword quarkKeyword   import module fn in if elif else while ret
syn keyword quarkKeyword   extern var struct impl data extend this
syn keyword quarkKeyword   match break continue for

syn keyword quarkType      bool int str float double char void
syn keyword quarkBoolean   true false null

syn match   quarkVariable  '\h\w*'
syn match   quarkFunction  '\<\h\w*\>\(\s\|\n\)*\ze('
syn match   quarkOperator  '[><!=\|\&\+\-\*\/\^%\.\:]'

if get(g:, 'quark_highlight_separators', 0)
  syn match quarkOperator '[\,\;]'
endif

if get(g:, 'quark_highlight_brackets', 0)
  syn match quarkOperator '[(){}\[\]]'
endif

syn match  quarkNumber '\d\+\(\.\d\+\)\?'
syn match  quarkNumber '\d\+\(\.\d\+\)\?[fF]\?'
syn match  quarkNumber '0[xX]\(\x\+\)'
syn region quarkString start=+"+ end=+"+ contains=quarkEscape,@Spell
syn region quarkString start=+'+ end=+'+ contains=quarkEscape,@Spell
syn match  quarkEscape +\\[ntrbfav\\"'0]+ contained

syn region  quarkComment  start=+//+  end=+$+   contains=quarkTodo,@Spell
syn region  quarkComment  start=+/\*+ end=+\*/+ contains=quarkTodo,@Spell
syn keyword quarkTodo     TODO NOTE FIXME XXX contained

hi def link quarkKeyword  Keyword
hi def link quarkType     Type
hi def link quarkFunction Function
hi def link quarkVariable Variable
hi def link quarkBoolean  Boolean
hi def link quarkNumber   Number
hi def link quarkString   String
hi def link quarkEscape   Special
hi def link quarkOperator Operator
hi def link quarkComment  Comment
hi def link quarkTodo     Todo

let b:current_syntax = 'quark'
