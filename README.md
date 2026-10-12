# medical-paper-slides

医学論文のPDFから、日本語の学会発表スライド（pptx）を作るClaude用スキル。

## できること
- 聴衆が短時間で理解でき、発表者がそのまま説明できる**学会発表スライド**（pptx）を作る
- 1枚ごとに「論点 → 答え → 裏付け」が成立する構成にする

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
