# medical-paper-slides

医学論文のPDFから、日本語の学会発表スライド（pptx）を作るClaude用スキル。

## できること
- 聴衆が短時間で理解でき、発表者がそのまま説明できる**学会発表スライド**（pptx）を作る
- 1枚ごとに「論点 → 答え → 裏付け」が成立する構成にする

## 前提
- pptxファイルの組み立てはAnthropic標準の **pptxスキル** に委譲するため、pptxスキルが使える環境が前提
  （claude.ai では標準で利用可。Claude Code では pptx スキルが導入されているか確認すること）

## 導入
### Claude Code で使う場合
```
git clone https://github.com/tsushima6010/medical-paper-slides.git $HOME/.claude/skills/medical-paper-slides
```
新しいセッションで `/medical-paper-slides` と入力して候補に出れば導入完了。

更新があったときは次のコマンドで最新版を取り込む。
```
git -C $HOME/.claude/skills/medical-paper-slides pull
```

### claude.ai で使う場合
1. このリポジトリをダウンロード（Code → Download ZIP）
2. claude.ai の設定画面からスキルとしてzipをアップロードする

## 使い方
論文PDFを渡して「スライドにして」と依頼する。

## 注意
- 患者情報・未発表データを含むファイルは使用しない
- 数値・統計値・引用は必ず原著と照合する

## ライセンス
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.ja)（全文は [LICENSE](LICENSE)）

- 個人・業務での利用、改変、商用利用は自由。このスキルで作成したスライドに表示義務はない
- スキル自体（原版・改変版）を再配布・公開する場合は、次のように出典を表示すること
  > 本スキルは tsushima6010「medical-paper-slides」（https://github.com/tsushima6010/medical-paper-slides 、CC BY 4.0）を改変したものです。
- 無保証。本スキルを用いて作成したスライドの内容の正確性は利用者が確認すること
