(number) @constant.numeric

(string) @string

(char) @constant.character

(esc_seq) @constant.character.escape

(comment) @comment

(nil) @constant.builtin

((symbol) @constant.builtin
    (#match? @constant.builtin "^@"))

(bool) @constant.builtin.boolean

(fn name: (symbol) @function
    args: (vector (symbol) @parameter))

"fn" @keyword

(lambda args: (vector (symbol) @parameter))

"lambda" @keyword

"λ" @keyword

((symbol) @keyword
    (#match? @keyword "^(if|and|or|not|quote|const|let)$"))

((symbol) @operator
    (#match? @operator "^([+*\\-/=]|[<>]=?)$"))

((symbol) @function.builtin
    (#match? @function.builtin "^(str|println|chars|join|list|vec|vector|parse-num)$"))

(list . (symbol) @function.call)

[(keyword) (symbol)] @constant

["(" ")" "[" "]"] @punctuation.delimiter
