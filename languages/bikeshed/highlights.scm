; Port of Bikeshed.tmLanguage's scope names to tree-sitter highlight
; captures. Comments show the original TextMate scope each capture stands
; in for.

; ---- Simple inline constructs -----------------------------------------

(production) @string                ; string.quoted.double.csswg
(element_attr_link) @string         ; string.quoted.double.csswg
(idl_link) @string                  ; string.quoted.double.csswg
(dfn_autolink) @string              ; string.quoted.double.csswg
(maybe_autolink) @string            ; string.quoted.double.csswg
(property_name) @string.special     ; string.quoted.single.csswg

(biblio_link) @constant             ; constant.other.biblioLink.csswg
(text_macro) @constant.builtin      ; constant.language.csswg

; ---- Generic HTML tags --------------------------------------------------

(html_tag) @tag                     ; entity.name.tag.csswg

; ---- Opaque elements (tag delimiters only; content is unstyled) --------

(heading_element (tag_open) @error) ; invalid.illegal.heading.csswg
(heading_element (tag_close) @error)

(dfn_element (tag_open) @variable.parameter)   ; variable.parameter.definition.csswg
(dfn_element (tag_close) @variable.parameter)

(anchor_element (tag_open) @string)  ; string.quoted.double.csswg (link)
(anchor_element (tag_close) @string)

; ---- <pre> block wrappers, styled like generic tags ---------------------

(prod_block (tag_open) @tag)
(prod_block (tag_close) @tag)
(metadata_block (tag_open) @tag)
(metadata_block (tag_close) @tag)
(propdef_block (tag_open) @tag)
(propdef_block (tag_close) @tag)

; ---- Metadata block Key: Value lines ------------------------------------

(known_key_line (key_name) @keyword)             ; keyword.other.knownKeyName.csswg
(known_key_line (value) @string)                 ; string.unquoted.csswg

(custom_key_line (custom_key_name) @variable)    ; variable.other.customKeyName.csswg
(custom_key_line (value) @string)

(unknown_key_line (unknown_key_name) @error)     ; invalid.illegal.unknownKeyName.csswg

; ---- propdef/descdef block Key: Value lines ------------------------------

(propdef_known_key_line (key_name) @keyword)             ; keyword.other.keyName.csswg
(propdef_known_key_line (value) @string)

(propdef_unknown_key_line (unknown_key_name) @variable)  ; variable.other.unknownKeyName.csswg
(propdef_unknown_key_line (value) @string)
