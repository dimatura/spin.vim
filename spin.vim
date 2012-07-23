" Vim syntax file
" Language:	Spin
" Maintainer:	Daniel Maturana <dimatura@puc.cl>
" Last Change:	Wed Dec 29 12:00:00 CST 2010

" Syntax file for the Spin language, a language designed by Parallax Inc
" for its line of Propeller microcontrollers.
"
" This is a first and still incomplete attempt. It was heavily based on
" various other syntax files, mainly those for Python, Jal, C and BASIC.
" Suggestions are welcome.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

" Wed, Dec 29, 2010
" Gordon Child
" gordon@gordonchild.com
" Corrected comment problem with brackets that open and close
" on the same line {{ }}

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword spinStatement	return abort result next
syn keyword spinStatement	quit reboot
syn keyword spinConditional	if ifnot elseif elseifnot else
syn keyword spinConditional	case other
syn keyword spinRepeat		repeat from to until while step

syn keyword spinBlock		obj var con dat

syn keyword spinOperator	and not or
syn match   spinOperator	"[\^.]"

" TODO some of these don't work. 
" syn match spinOperator "--"
" syn match spinOperator "++"
" syn match spinOperator "~"
" syn match spinOperator "~~"
" syn match spinOperator "?"
" syn match spinOperator "@"
" syn match spinOperator "@@"
" syn match spinOperator "+"
" syn match spinOperator "-"
" syn match spinOperator "^^"
" syn match spinOperator "||"
" syn match spinOperator "|<"
" syn match spinOperator ">|"
" syn match spinOperator "!"
" syn match spinOperator "<-=\="
" syn match spinOperator "->=\="
" syn match spinOperator "<<=\="
" syn match spinOperator ">>=\="
" syn match spinOperator "~>=\="
" syn match spinOperator "><=\="
" syn match spinOperator "&=\="
" syn match spinOperator "|=\="
" syn match spinOperator "^=\="
" syn match spinOperator "*=\="
" syn match spinOperator "**=\="
" syn match spinOperator "/=\="
" syn match spinOperator "//\="
" syn match spinOperator "+=\="
" syn match spinOperator "-=\="
" syn match spinOperator "#>=\="
" syn match spinOperator "<#=\="
syn match spinOperator "<\="
syn match spinOperator ">\="
syn match spinOperator "<>\="
syn match spinOperator "==\="
syn match spinOperator "=<\="
syn match spinOperator "=>\="
syn match spinOperator ":="

syn keyword spinRegister	ina inb outa outb dira dirb 
syn keyword spinRegister 	vcfg vscl
syn keyword spinRegister 	cnt 
syn keyword spinRegister 	ctra ctrb frqa frqb phsa phsb
syn keyword spinRegister 	par spr

syn keyword spinBuiltin	 	coginit cognew cogstop cogid
syn keyword spinBuiltin	 	waitcnt waitpeq waitpne waitvid
syn keyword spinBuiltin	 	string strcomp strsize
syn keyword spinBuiltin		chipver clkfreq clkmode clkset
syn keyword spinBuiltin	 	wordfill wordmove
syn keyword spinBuiltin	 	bytefill bytemove
syn keyword spinBuiltin	 	longfill longmove
syn keyword spinBuiltin	 	trunc round
syn keyword spinBuiltin	 	lockclr locknew lockret lockset
syn keyword spinBuiltin	 	lookup lookdown lookupz lookdownz
syn keyword spinBuiltin	 	constant file

syn keyword spinType		byte word long float

syn keyword spinStatement	pub pri nextgroup=spinFunction skipwhite
syn match   spinFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained

syn keyword spinTodo		TODO FIXME XXX contained
syn region  spinCommentL	start="'" end="$" contains=spinTodo
syn region  spinComment 	start="{{" skip="'" end="}}" contains=spinTodo

syn keyword spinConstant	true false 
syn keyword spinConstant	posx negx
syn keyword spinConstant	pi 
syn keyword spinConstant	rcslow rcfast
syn keyword spinConstant	xinput xtal1 xtal2 xtal3
syn keyword spinConstant	pll1x pll2x pll4x pll8x pll16x
syn keyword spinConstant	_clkfreq _clkmode 
syn keyword spinConstant	_xinfreq _free _stack

" strings
" syn region  spinString    	start=+"+ end=+"+
syn region  spinString 		start=/"/ end=/"/

syn match   spinBinary "%[01_]\+\>"
syn match   spinQuaternary "%%[0123_]\+\>"
syn match   spinHexadecimal "$[0-9A-Fa-f_]\+\>"
syn match   spinDecimal	"-\=\<\d[0-9_]\+\>"


if version >= 508 || !exists("did_spin_syn_inits")
  if version <= 508
    let did_spin_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink spinBinary		Number
  HiLink spinHexadecimal	Number
  HiLink spinQuaternary		Number
  HiLink spinDecimal		Number
  HiLink spinRegister		Special
  HiLink spinConstant		Constant
  HiLink spinBlock		Statement
  HiLink spinType		Type
  HiLink spinStatement		Statement
  HiLink spinFunction		Function
  HiLink spinConditional	Conditional
  HiLink spinRepeat		Repeat
  HiLink spinString		String
  HiLink spinEscape		Special
  HiLink spinOperator		Operator
  HiLink spinComment		Comment
  HiLink spinCommentL		Comment
  HiLink spinTodo		Todo
  HiLink spinBuiltin		Function
  delcommand HiLink
endif

let b:current_syntax = "spin"

" vim: ts=8
