# Bikeshed for Zed

A [Zed](https://zed.dev) extension that adds syntax highlighting for
[Bikeshed](https://speced.github.io/bikeshed/) spec source files (`.bs`).

Bikeshed is the preprocessor used to author W3C and WHATWG style
specifications. Its source format is HTML mixed with Markdown, a metadata
block, and a set of Bikeshed specific shorthands such as autolinks, biblio
references, and text macros. Plain HTML highlighting does not understand any of
that, so this extension ships a dedicated grammar and highlight queries
instead.

## What gets highlighted

* Metadata blocks (`<pre class=metadata>`), with known keys, custom keys
  (`!Foo:`), and unknown keys flagged separately
* `propdef` and `descdef` blocks, again splitting known from unknown keys
* Grammar productions in `<pre class=prod>` blocks
* Autolink shorthands: dfn autolinks (`[=foo=]`), maybe autolinks (`''foo''`),
  IDL links (`{{Foo}}`), element attribute links, property names, and biblio
  links (`[[FOO]]`)
* Text macros (`[FOO]`)
* `<dfn>`, `<a>`, and heading elements, along with generic HTML tags

The highlight captures are a port of the scope names from
`Bikeshed.tmLanguage`, so the colours should feel familiar if you have used the
TextMate or VS Code grammar. Each query in
[`languages/bikeshed/highlights.scm`](languages/bikeshed/highlights.scm)
carries a comment naming the original scope it stands in for.

## Installation

The extension is not yet published to the Zed extension registry, so install it
as a dev extension:

1. Clone this repository.
2. In Zed, open the command palette and run `zed: extensions`.
3. Click **Install Dev Extension** and select the cloned directory.

Zed will build the grammar on first install. Open any `.bs` file afterwards and
highlighting should apply automatically.

To pick up later changes, run `zed: reload extensions` from the command
palette.

## Grammar

Parsing is handled by
[tree-sitter-bikeshed](https://github.com/jasonwilliams/tree-sitter-bikeshed).
The pinned revision lives in [`extension.toml`](extension.toml); bump the `rev`
there to take a newer grammar build.

## Layout

```
extension.toml                      extension manifest and grammar pin
languages/bikeshed/config.toml      language name, grammar, and .bs suffix
languages/bikeshed/highlights.scm   tree-sitter highlight queries
```

## Status

Early days. Syntax highlighting only, with no language server, formatting, or
diagnostics. Issues and pull requests are welcome, particularly for Bikeshed
constructs that are not yet highlighted.

