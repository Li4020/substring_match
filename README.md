### 環境構築メモ

- Ocaml 5.0 以降は使わない方が良さそう
  - re-nfa をビルドする際に Pervasives が見つからないと言われる
- opam install でいれたパッケージ
  - Ocaml 4.14.1
  - ocaml-lsp-server
  - ocamlformat(いるのかよくわからん)
  - dune 3.14
  - ocaml-re-nfa
    - `opam pin add re-nfa https://github.com/terauchi-lab/ocaml-re-nfa.git`← 一応これでやった
    - `opam pin add re-nfa https://github.com/yallop/ocaml-re-nfa.git`← 元はこっち

## 使用法
`./_build/default/bin/main.exe "$(cat <file_name>)" "$(cat <regex>)"`
