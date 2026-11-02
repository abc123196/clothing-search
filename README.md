# 服飾資料庫連結應用（clothing-search）

TiDB Cloud（MySQL）→ Colab 匯出 `products.json` → GitHub Pages dashboard

```
sql/     01_schema → 02_data → 03_image_url(新增 image_url + product_images) → 04_verify
colab/   clothing_db.ipynb
docs/    index.html、data/products.json、data/image_manifest.csv、images/products/<分類>/<P0001>.jpg
```

## 操作順序
1. **GitHub**：建立 repo `clothing-search`，把整個資料夾上傳 → Settings → Pages → Branch `main`、資料夾 `/docs`。網址：`https://<帳號>.github.io/clothing-search/`
2. **TiDB Cloud**：建立 Starter cluster → Connect 取得 Host / User / Password（Port 4000）。（可在 Data Service 連結 GitHub 做版本控管）
3. **Colab**：上傳 `colab/clothing_db.ipynb`，由上而下執行；第 2 步上傳 4 個 SQL 檔。
4. **更新 dashboard**：Colab 第 7 步推送 `products.json`，網頁按 F5 即更新。

## 圖片管理
- 檔名 = 商品編號，依分類放資料夾：`tops / bottoms / skirts / outerwear / dresses / sportswear`
- `clothing.image_url` 存相對路徑；`product_images` 記錄來源檔 `source_file` 與吻合度 `match_level`：
  `exact` 款式相符、`close` 相近款、`sample` 示意圖（網頁會標「示意圖」）
- 原始照片依款式排列（洋裝10、襯衫10、針織10、裙7、短褲3、長褲8、外套與西裝12），
  與 CSV 各分類各 10 款不同；**沒有運動服照片、裙子少 3 張**，共 28 exact / 24 close / 8 sample。
  補齊後只需替換 `docs/images/products/<分類>/<商品編號>.jpg`，再把 `match_level` 改為 `exact`。
