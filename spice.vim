" Vim syntax file
" Language:     Spice circuit simulator input netlist
" Maintainer:   Hussian
"
" This is based on https://github.com/ftorres16/spice.vim
" also https://github.com/leoheck/sublime-spice and
" https://github.com/lxTHU/vscode-spice

if exists("b:current_syntax")
    finish
endif

" spice syntax is case INsensitive
syn case ignore

syn keyword spiceTodo contained TODO

" syn match spiceComment  "\*.*$" contains=@Spell,spiceTodo
syn match spiceComment  "\/\/.*$" contains=@Spell,spiceTodo
syn match spiceComment  "\$.*$" contains=@Spell
syn match spiceComment  "\;.*$" contains=@Spell


" Numbers, all with engineering suffixes and optional units
" floating point number, with dot, optional exponent
syn match spiceNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" floating point number, starting with a dot, optional exponent
syn match spiceNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
" integer number with optional exponent
syn match spiceNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="


" Elements (Device)
syn match spiceElement "\v^(\s)*r[a-zA-Z0-9_@]+" " Resistors
syn match spiceElement "\v^(\s)*c[a-zA-Z0-9_@]+" " Capacitor
syn match spiceElement "\v^(\s)*l[a-zA-Z0-9_@]+" " Inductor
syn match spiceElement "\v^(\s)*m[a-zA-Z0-9_@]+" " MOSFET
syn match spiceElement "\v^(\s)*q[a-zA-Z0-9_@]+" " BJT
syn match spiceElement "\v^(\s)*d[a-zA-Z0-9_@]+" " Diode

syn match spiceElement "\v^(\s)*j[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*k[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*n[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*o[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*p[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*s[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*t[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*u[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*w[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*y[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*x[a-zA-Z0-9_@]+"

" Elements (Source)
syn match spiceElement "\v^(\s)*v[a-zA-Z0-9_@]+" " Independent voltage source
syn match spiceElement "\v^(\s)*i[a-zA-Z0-9_@]+" " Independent current source
syn match spiceElement "\v^(\s)*E[a-zA-Z0-9_@]+" " Voltage-controlled voltage source
syn match spiceElement "\v^(\s)*H[a-zA-Z0-9_@]+" " Current-controlled voltage source
syn match spiceElement "\v^(\s)*G[a-zA-Z0-9_@]+" " Voltage-controlled current source
syn match spiceElement "\v^(\s)*F[a-zA-Z0-9_@]+" " Current-controlled current source
syn match spiceElement "\v^(\s)*B[a-zA-Z0-9_@]+"

" Elements (Sub circuits)
syn match spiceElement "\v^(\s)*a[a-zA-Z0-9_@]+"
syn match spiceElement "\v^(\s)*x[a-zA-Z0-9_@]+"

" Models
"  syn match spiceModel "\.model\>"
syn match spiceModel "\.malias\>"

" maybe unnecessary due to D
syn keyword spiceModelType nmos pmos NPN PNP diode njf pjf

" Library Management
syn match spiceLibManagement "\.del lib\>"
"  syn match spiceLibManagement "\.endl\>"
"  syn match spiceLibManagement "\.include\>"
syn match spiceLibManagement "\.lib\>"
syn match spiceLibManagement "\.protect\>"
syn match spiceLibManagement "\.unprotect\>"

syn region spiceFunc matchgroup=spiceAnal start="\v^\.?ends\s" end="\v\s"
syn region spiceFunc matchgroup=spiceAnal start="\v^\.?endl\s" end="\v$"
syn region spiceFunc matchgroup=spiceAnal start="\v^\.?endc\s" end="\v$"
syn region spiceFunc matchgroup=spiceAnal start="\v^\.?end\s" end="\v$"

" Subckt name
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?model\s" end="\v\s"

syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?subckt\s"  end="\v\s"
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?ends\s" end="\v$"

" Subcircuits
syn match spiceSubCkt "\.eom\>"
syn match spiceSubCkt "\.macro\>"

" Section
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?section\s" end="\v$"
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?endsection\s" end="\v$"
syn region spiceCkt matchgroup=spiceSubCkt start="\vsection\=" end="\v(\s|$)"

" Library
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?library\s" end="\v$"
syn region spiceCkt matchgroup=spiceSubCkt start="\v^\.?endlibrary\s" end="\v$"

" INCLUDE
syn region spiceInclude matchgroup=spiceLibManagement start="\v(ahdl_|.)?include\s" end="\v\s|$"
syn region spiceInclude matchgroup=spiceLibManagement start="\v(.)?title\s" end="\v$"

" Analysis
syn match spiceAnal "\v^\.?save>"

syn match spiceAnal "\v^\.?ac>"
syn match spiceAnal "\v^\.?dc>"
syn match spiceAnal "\v^\.?dcmatch>"
syn match spiceAnal "\v^\.?disto>"
syn match spiceAnal "\v^\.?fft>"
syn match spiceAnal "\v^\.?four>"
syn match spiceAnal "\v^\.?lin>"
syn match spiceAnal "\v^\.?net>"
syn match spiceAnal "\v^\.?pat>"
syn match spiceAnal "\v^\.?pz>"
syn match spiceAnal "\v^\.?sample>"
syn match spiceAnal "\v^\.?sense>"
syn match spiceAnal "\v^\.?temp>"
syn match spiceAnal "\v^\.?tf>"
syn match spiceAnal "\v^\.?tran>"

syn match spiceAnal "\v^\.?load>"
syn match spiceAnal "\v^\.?to>"
syn match spiceAnal "\v^\.?connect>"
syn match spiceAnal "\v^\.?statistics>"
syn match spiceAnal "\v^\.?set>"
syn match spiceAnal "\v^\.?process>"
syn match spiceAnal "\v^\.?probe>"
syn match spiceAnal "\v^\.?print>"
syn match spiceAnal "\v^\.?option>"
syn match spiceAnal "\v^\.?op>"
syn match spiceAnal "\v^\.?noise>"
syn match spiceAnal "\v^\.?model>"
syn match spiceAnal "\v^\.?measure>"
syn match spiceAnal "\v^\.?meas>"
syn match spiceAnal "\v^\.?lib>"
syn match spiceAnal "\v^\.?let>"
syn match spiceAnal "\v^\.?from>"
syn match spiceAnal "\v^\.?four>"
syn match spiceAnal "\v^\.?disto>"
syn match spiceAnal "\v^\.?control>"
syn match spiceAnal "\v^\.?alter>"

syn region spiceFunc matchgroup=spiceAnal start="\v^\.?global>" end="\v$"

" Output
syn match spiceOutput "\v^\.?biaschk>"
syn match spiceOutput "\v^\.?dout>"
syn match spiceOutput "\v^\.?graph>"
syn match spiceOutput "\v^\.?measure>"
syn match spiceOutput "\v^\.?plot>"
syn match spiceOutput "\v^\.?stim>"
syn match spiceOutput "\v^\.?width>"

" Setup
syn match spiceSetUp "\v^\.?data>"
syn match spiceSetUp "\v^\.?dcvolt>"
syn match spiceSetUp "\v^\.?enddata>"
syn match spiceSetUp "\v^\.?ic>"
syn match spiceSetUp "\v^\.?nodeset>"
syn match spiceSetUp "\v^\.?param>"
"  syn match spiceSetUp "\.title\>"

syn region spiceEng matchgroup=spiceSetUp start="\v^simulator\slang\=" end="\v(\s|$)"


" Conditionals
syn match spiceConditional "\s*\.\?if\>"
syn match spiceConditional "\s*\.\?elseif\>"
syn match spiceConditional "\s*\.\?else\>"
syn match spiceConditional "\s*\.\?endif\>"

" Functions
syn keyword spiceFunc abs acos asin atan cos cosh
syn keyword spiceFunc db dc exp int log log10
syn keyword spiceFunc lv lx max min pow pulse
syn keyword spiceFunc pwl pwr sgn sign sin sinh
syn keyword spiceFunc sqrt tan tanh

" Misc
syn match   spiceWrapLineOperator       "\\$"
syn match   spiceWrapLineOperator       "^+"

" Matching pairs of parentheses
syn region  spiceParen transparent matchgroup=spiceOperator start="(" end=")" contains=ALLBUT,spiceParenError
syn region  spiceCurly transparent matchgroup=spiceOperator start="{" end="}" contains=ALLBUT,spiceCurlyError
syn region  spiceSinglequote matchgroup=spiceOperator start=+'+ end=+'+


" Strings
syn region spiceString start=/\v"/ skip=/\v\\./ end=/\v"/


" Params
syn match spiceType "\vparams:"
syn match spiceType "\vparameters:?"


" Errors
syn match spiceParenError ")"
syn match spiceCurlyError "}"

" Syncs
syn sync minlines=50


" Highlights
highlight link spiceWrapLineOperator    spiceOperator
highlight link spiceSinglequote         spiceExpr

highlight link spiceCkt                 spiceExpr
highlight link spiceInclude             String
highlight link spiceType                spiceAnal
highlight link spiceEng                 spiceAnal

highlight link spiceAnal                Keyword        
highlight link spiceComment             Comment

highlight link spiceConditional         Conditional

highlight link spiceElement             Define
highlight link spiceExpr                Function
highlight link spiceFunc                Function
highlight link spiceLibManagement       Define
highlight link spiceModel               Structure
highlight link spiceModelType           Type
highlight link spiceNumber              Number
highlight link spiceOperator            Operator
highlight link spiceOutput              Statement
highlight link spiceSetUp               Define
highlight link spiceSubCkt              Structure
highlight link spiceStatement           Statement
highlight link spiceString              String
highlight link spiceTodo                Todo
highlight link spiceParenError          Error
highlight link spiceCurlyError          Error


let b:current_syntax = "spice"

" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'spice\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/spice.vim

