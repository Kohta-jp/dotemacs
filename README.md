# dotemacs（Emacs 設定）

このリポジトリは `~/.emacs.d/` 配下で使う Emacs 設定です。  
設定本体は `.emacs.d/init.el` にまとまっており、主に **leaf** を使ってパッケージや設定を宣言的に管理しています。

---

## 使い方

### ローカルへ配置
一般的には以下のどちらかで配置します。

- `~/.emacs.d/` としてこのリポジトリを配置する
- 既存の `~/.emacs.d/` がある場合は、必要なファイルのみシンボリックリンクする（例: `ln -s $(pwd)/.emacs.d/init.el ~/.emacs.d/init.el`）

### デバッグ起動
`init.el` 冒頭に「別ディレクトリの init を読み込む」用途の処理が入っているため、例えば次のような起動方法ができます。

```sh
emacs -q -l ~/.debug.emacs.d/init.el
```

※ `load-file-name` / `byte-compile-current-file` を見て `user-emacs-directory` を適切に設定することで、`init.el` のある場所を基準に各種ファイルを探せるようにしています。

---

## パッケージ管理の方針（leaf + package.el）

### 1. package-archives の設定
`package.el` のアーカイブとして以下を登録しています。

- GNU ELPA: `https://elpa.gnu.org/packages/`
- MELPA: `https://melpa.org/packages/`
- Org ELPA: `https://orgmode.org/elpa/`

### 2. leaf をブートストラップ（自動インストール）
起動時に `leaf` が未インストールなら、`package-refresh-contents` → `package-install` で自動導入します。  
初回セットアップ時も手動作業を減らす狙いです。

### 3. leaf-keywords と周辺（hydra / el-get / blackout）
`leaf-keywords` を `:ensure t` で導入し、`leaf-keywords-init` を実行して leaf のキーワード群を有効化します。  
また、leaf の拡張的な用途に備えて `hydra`, `el-get`, `blackout` も合わせて `:ensure t` しています。

### 4. パッケージ設定は (leaf ...) で宣言的に管理
各パッケージは基本的に以下で統一しています。

- `:ensure t` でインストール
- `:custom` / `:setq` / `:bind` / `:hook` / `:after` などで設定を整理
- built-in（標準同梱）も `leaf` でまとめて見通しを良くする

---

## 主な特徴

### Emacs 標準機能の調整（EmacsJP 2020 参考）
- `custom-file` を `custom.el` に分離（設定の汚染防止）
- ロックファイル無効化、ダイアログ無効化などの基本調整
- `yes-or-no-p` を `y-or-n-p` に短縮
- `C-h` をバックスペースとして使うためのキー変換（`keyboard-translate` + `leaf-keys`）

### 自動リロード
- `global-auto-revert-mode` 有効化（ファイル更新を自動反映）
- `auto-revert-interval` は 1 秒

### UI / 表示
- フレームを最大化（`default-frame-alist` に `fullscreen . maximized`）
- 行番号表示（`global-display-line-numbers-mode`）
- 行間（`line-spacing`）を 0.3 に調整

### モードライン
- `doom-modeline` を利用（after-init で有効化）
- アイコン・表示要素や高さ等をカスタマイズ

### ミニバッファ補完（Vertico 系）
- `consult` の豊富なキーバインド
- `orderless` による柔軟なマッチング
- `vertico` + `marginalia` による補完 UI 強化

### 開発支援
- `flycheck` をグローバル有効化（エラー移動のキーバインドあり）
- `company` をグローバル有効化（即時補完、キー操作を調整）
- `copilot` を `prog-mode` で有効化（TAB 受け入れ、候補移動などを設定）

### ファイル/バックアップ運用
- auto-save/backup の出力先を `~/.emacs.d/backup/` に寄せる
- バージョン管理や古い世代の削除も有効化

### ターミナル
- `multi-term` を導入（Windows では無効）
- 既存 terminal バッファ再利用/新規作成を切り替える自作関数 `namn/open-shell*`

### Markdown
- `markdown-mode`（`.md` に関連付け）
- `markdown-command` を `multimarkdown` に設定
- `markdown-preview-mode` を導入（CSS/JS はコメント例あり）

### パスの引き継ぎ（macOS など想定）
- `exec-path-from-shell` を初期化して PATH 等を取り込む

### アイコン・ファイラ
- `nerd-icons` + `neotree`（F8 でトグル、隠しファイル表示など）

---

## 依存/前提（環境により必要）
- `multimarkdown`（Markdown の変換コマンドとして指定しているため）
- Nerd Font 系フォント（`HackGen Console NF` を指定）
- GitHub Copilot for Emacs の利用には別途認証や環境準備が必要

---

## 今後の課題（レイアウト例）

> ここは運用しながら更新していく想定の TODO 欄です。  
> 優先度・状況が分かるようにテンプレート化しています。

### 課題一覧
- [ ] **（高）** init.el の分割（用途別に `lisp/` へ切り出し）
  - 現状: 1 ファイルに集約
  - ゴール: 可読性と変更容易性の改善
- [ ] **（中）** パッケージの読み込み最適化（起動時間短縮）
  - 例: 遅延ロードの整理、hook の見直し
- [ ] **（中）** OS 別設定（macOS / Linux / Windows）を整理
  - 例: フォント、shell、キー設定の条件分岐
- [ ] **（低）** 見た目（テーマ/モデルライン）の統一方針を固める
  - 例: `iceberg-theme` の使い方の明文化、他テーマ候補の整理

### メモ
- 気づいたこと：
- 参考リンク：
- 変更履歴（簡易）：

---

## License

本リポジトリは `.emacs.d/init.el` のヘッダコメントに記載の通り、GNU General Public License v3.0 以降（GPL-3.0-or-later）の条件で利用できます。

- This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
- You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

---

## Thanks

この設定のベースとなった `init.el` の著者であり、最も貢献度の高い **Naoya Yamashita（@conao3）** さんに感謝します。