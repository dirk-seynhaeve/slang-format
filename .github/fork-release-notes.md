slang-format built from upstream main at a3f530c (13 commits after v0.1.1) with six changes proposed upstream:

- the `maxInlineInstanceConnections` setting (hudson-trading/slang-format#3, PR #4);
- conditional directives that share a line are formatted like separate lines (hudson-trading/slang-format#2, PR #5);
- the `maxEmptyLines` setting, which caps runs of consecutive empty lines (PR #8);
- the `lineEnding` setting: `preserve` (default) keeps the input's line endings, `native`, `lf` and `crlf` force one (PR #9);
- the `directiveIndent` setting: `code` (default) indents conditional directives with the code, `column0` puts them at column 0 (hudson-trading/slang-format#1, PR #10);
- linear-time declaration alignment for long declarator lists, as in large generated netlists (hudson-trading/slang-format#6, PR #7).

Each archive holds the binary, LICENSE, THIRD-PARTY-NOTICES.txt and a README. SHA256SUMS lists the archives.
