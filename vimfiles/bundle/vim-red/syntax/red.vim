" Vim syntax file
" Language:	Red
" Maintainer:	Gregory Higley <code@revolucent.net>
" Filenames:	*.red
" Last Change:	2014-09-19
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Red is case insensitive
syn case ignore

" As per current users documentation
if version < 600
  set isk=@,48-57,?,!,.,',+,-,*,&,\|,=,_,~,^
else
  setlocal isk=@,48-57,?,!,.,',+,-,*,&,\|,=,_,~,^
endif

syn match redSheBang "\%^#!.*" display

" Numbers
syn match redInteger "\<[+-]\=\d\+\('\d*\)*\>"
" syn match       redDecimal    "[+-]\=\(\d\+\('\d*\)*\)\=[,.]\d\=\(e[+-]\=\d\+\)\="
" syn match       redDecimal    "[+-]\=\d\+\('\d*\)*\(e[+-]\=\d\+\)\="

" Tuples
" syn match	redTuple	"\(\d\+\.\)\{2,}"

" Words predefined by Red at startup.
" This was generated by a script and may have some false positives.
syn keyword redPredefined about abs absolute action action? add ajoin all also alter and~ any any-block? any-function? any-object? any-path? any-string? any-word? append apply aqua arccosine arcsine arctangent array as-pair ascii? ask assert at attempt
syn keyword redPredefined back backslash backspace base-color beige binary? bind bind? bitset? black block? blue body-of boot-print bound? break brick brown browse bs bugs
syn keyword redPredefined call case catch cause-error cd change change-dir changes char? charset chat check checksum clean-path clear clos close closure closure? coal coffee collect collect-words command? comment complement compose compress confirm construct context continue copy cosine cr create crimson crlf cyan
syn keyword redPredefined datatype? datatypes date? debase decimal? decloak decode decode-url decompress default dehex delect delete delete-dir deline delta-profile delta-time demo detab difference dir? dirize divide do do-callback do-codec do-commands docs does dp ds dt dump dump-obj
syn keyword redPredefined echo eighth either email? empty? enbase encloak encode encoding? enline entab equal? equiv? error? escape even? event? evoke exclude exists? exit exp extend extract
syn keyword redPredefined fifth file-type? file? find find-all find-script first first+ for forall foreach forest forever form format forskip found? fourth frame? func funco funct function function?
syn keyword redPredefined get get-env get-path? get-word? gob? gold gray greater-or-equal? greater? green
syn keyword redPredefined halt handle? has head head? help
syn keyword redPredefined if image? import in in-dir index? info? input insert integer? intern intersect invalid-utf? issue? ivory
syn keyword redPredefined join
syn keyword redPredefined khaki
syn keyword redPredefined last last? latin1? launch leaf length? lesser-or-equal? lesser? lf lib library? license limit-usage linen list-dir list-env lit-path? lit-word? load load-extension load-gui log-10 log-2 log-e logic? loop loud-print lowercase ls
syn keyword redPredefined magenta make make-banner make-dir map map-each map-event map-gob-offset map? maroon max maximum maximum-of min minimum minimum-of mint mkdir mod modified? modify module module? modulo mold mold64 money? more move multiply
syn keyword redPredefined native native? navy negate negative? new-line new-line? newline newpage next ninth none none? not not-equal? not-equiv? now null number?
syn keyword redPredefined object object? odd? offset? oldrab olive op? open open? orange or~
syn keyword redPredefined pair? papaya paren? parse past? path? pending percent? pewter pi pick pink poke port? positive? power prin print printf probe protect purple pwd
syn keyword redPredefined q query quit quote
syn keyword redPredefined random read redcode? redlue red.com redor recycle red reduce refinement? reflect reform rejoin remainder remold remove remove-each rename repeat repend replace request-file resolve return reverse reword rm round
syn keyword redPredefined same? save say-browser scalar? script? second secure select selfless? series? set set-env set-path? set-scheme set-word? seventh shift sienna sign? silver sine single? sixth size? skip sky slash snow sort source sp space spec-of speed? split split-path square-root stack stats strict-equal? strict-not-equal? string? struct? subtract suffix? swap switch sys system
syn keyword redPredefined t tab tag? tail tail? take tan tangent task task? teal tenth third throw time? title-of to to-binary to-bitset to-block to-char to-closure to-command to-datatype to-date to-decimal to-email to-error to-event to-file to-function to-get-path to-get-word to-gob to-hex to-image to-integer to-issue to-lit-path to-lit-word to-local-file to-logic to-map to-module to-money to-object to-pair to-paren to-path to-percent to-port to-red-file to-refinement to-relative-file to-set-path to-set-word to-string to-tag to-time to-tuple to-typeset to-url to-vector to-word trace transcode trim true? try tuple? type? types-of typeset?
syn keyword redPredefined unbind undirize union unique unless unprotect unset unset? until update upgrade uppercase url? usage use utf? utype?
syn keyword redPredefined value? values-of vector? violet
syn keyword redPredefined wait wake-up water what what-dir wheat while white why? word? words-of write
syn keyword redPredefined xor~
syn keyword redPredefined yello yellow
syn keyword redPredefined zero zero?
syn keyword redOperator ! != !== & * ** + ++ - -- --- / // < <= <> = == =? > >= ? ?? and or xor |
syn keyword redSpecial false off on no none red self true yes

" Basics
syn match redComment ";.*$"
syn match redType "\K\k*!\>"
syn match redRefinementWord "\K\k*" contained
syn match redRefinement "\/" nextgroup=redRefinementWord
syn match redGetWord "\K\k*" contained
syn match redGet ":" nextgroup=redGetWord
syn match redLitWord "\K\k*" contained
syn match redLit "'" nextgroup=redType,redLitWord
syn match redLocal "\/local\>"
syn match redSet "\K\k*:"

" Strings
syn match redString "\a\+:\/\/[^[:space:]]*" 
syn match redString "%[^[:space:]]*"
syn region redString oneline start=+%\="+ skip=+^"+ end=+"+ contains=redSpecialCharacter
syn region redString start=+[^#]{+ end=+}+ skip=+{[^}]*}+ contains=redSpecialCharacter
syn match redSpecialCharacter contained "\^[^[:space:][]"
syn match redSpecialCharacter contained "%\d\+"

com! -nargs=+ RedHi hi def link <args>

RedHi redComment Comment
RedHi redSheBang Comment
RedHi redOperator Operator
RedHi redLocal Special
RedHi redRefinementWord Constant
RedHi redRefinement Constant
RedHi redSpecial Special
RedHi redLitWord Constant
RedHi redLit Constant
RedHi redPredefined Keyword
RedHi redInteger Number
RedHi redDecimal Number
RedHi redTuple Number
RedHi redSpecialCharacter Special
RedHi redString String
RedHi redType Type
RedHi redGet Identifier
RedHi redGetWord Identifier
RedHi redSet Identifier

delc RedHi

syn sync fromstart
let b:current_syntax = "red"

