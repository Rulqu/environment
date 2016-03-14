" disable the current htmlLink syntax
highlight link htmlLink text

" enable a new htmlLink syntax
syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 keepend contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLinkText,javaScript,@htmlPreproc
syn match htmlLinkText contained contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLinkText,javaScript,@htmlPreproc "^\s*\zs.\{-}\ze\s*$"
syn match htmlLinkText contained contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLinkText,javaScript,@htmlPreproc "\S.\{-}\ze\s*$"

" enable the new syntax
hi def link htmlLinkText                Underlined
