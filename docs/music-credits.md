# 演示音乐版权说明（Demo Music Credits）

「空空音乐」App 内置的演示曲目全部来自 [Jamendo](https://www.jamendo.com/) 的 **CC BY**（署名）授权作品，
允许商业使用、修改与再分发，**前提是保留署名**。以下为逐曲署名信息，最后更新：2026-11-04。

| # | 曲名 | 作者 | 许可 | 来源 |
|---|------|------|------|------|
| 01 | Ambiental Abstract | Doxent Zsigmond | CC BY 3.0 | [jamendo.com/track/1058132](https://www.jamendo.com/track/1058132) |
| 02 | Urawa Ambient Music Part 1 | Ambient Samurai - Ichiro NAKAGAWA | CC BY 3.0 | [jamendo.com/track/1189633](https://www.jamendo.com/track/1189633) |
| 03 | Equilibrium | Hardcore Scm | CC BY 3.0 | [jamendo.com/track/1196245](https://www.jamendo.com/track/1196245) |
| 04 | The crossroads of change | zero-project | CC BY 3.0 | [jamendo.com/track/1195819](https://www.jamendo.com/track/1195819) |
| 05 | Oasis | zero-project | CC BY 3.0 | [jamendo.com/track/1196206](https://www.jamendo.com/track/1196206) |
| 06 | (exp) Gone Jazz | Flex Blur | CC BY 3.0 | [jamendo.com/track/1036133](https://www.jamendo.com/track/1036133) |
| 07 | Chilling Down 1 | CazZ | CC BY 3.0 | [jamendo.com/track/1123605](https://www.jamendo.com/track/1123605) |
| 08 | 05. Hip-Hop Jazz | Prospect Of Idiots | CC BY 3.0 | [jamendo.com/track/1199610](https://www.jamendo.com/track/1199610) |
| 09 | Electronic Vibrations | No Control | CC BY 2.0 | [jamendo.com/track/1014174](https://www.jamendo.com/track/1014174) |
| 10 | Dark Matter - Dark Electronic Asian | Eddy J | CC BY 3.0 | [jamendo.com/track/1182871](https://www.jamendo.com/track/1182871) |
| 11 | Madly, Deeply (Acoustic) | Melanie Ungar | CC BY 3.0 | [jamendo.com/track/1204668](https://www.jamendo.com/track/1204668) |
| 12 | Morar | Hardcore Scm | CC BY 3.0 | [jamendo.com/track/1196390](https://www.jamendo.com/track/1196390) |

许可全文：

- CC BY 3.0 — <https://creativecommons.org/licenses/by/3.0/>
- CC BY 2.0 — <https://creativecommons.org/licenses/by/2.0/>

## 使用与合规

- 上述曲目**允许商业使用**，但必须保留「曲名 + 作者 + 许可 + 来源链接」的署名。
- 应用内已把署名写入每首歌的 ID3 `comment` 字段（`CC BY 3.0 · Jamendo · 署名：<作者>`），
  并在「设置 → 关于」的版权说明中列出本页。
- 如果后续替换为 CC0 / Public Domain 曲目，可去掉署名要求，但仍建议保留来源记录。
- 演示曲目仅用于产品展示，不代表平台已获得任何艺人的商业授权。

## 下载与写入方式

```bash
# 1. 下载（示例，Jamendo 直链）
curl -L "https://prod-1.storage.jamendo.com/?trackid=1058132&format=mp32" -o 01.mp3

# 2. 写入元数据与封面
ffmpeg -i 01.mp3 -i cover.png -map 0:a -map 1:v -c:a copy -c:v png \
  -id3v2_version 3 \
  -metadata title="Ambiental Abstract" \
  -metadata artist="Doxent Zsigmond" \
  -metadata album="空空音乐 · 开源曲库" \
  -metadata comment="CC BY 3.0 · Jamendo · 署名：Doxent Zsigmond" \
  -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" out.mp3

# 3. 推到设备并重新扫描
adb push out.mp3 /sdcard/Music/
```
