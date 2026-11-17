# BlackBerry 9700 (Bold)

**EN:** FFmpeg preset for converting video for playback on the BlackBerry 9700 (Bold, 2009).

**RU:** Пресет FFmpeg для конвертации видео под воспроизведение на BlackBerry 9700 (Bold, 2009).

---

## Device Specs / Характеристики устройства

| Parameter / Параметр | Value / Значение |
|---|---|
| Display / Экран | 480×360, 2.44" |
| Video codec / Видеокодек | H.264 Baseline Profile, Level 3.0 |
| Audio codec / Аудиокодек | AAC-LC, stereo |
| Container / Контейнер | MP4 |
| Max video bitrate / Макс. битрейт видео | 2000 kbps |

---

## Usage / Использование

```bash
./convert.sh input.mp4 output.mp4
```

Or run FFmpeg directly / Или запустите FFmpeg напрямую:

```bash
ffmpeg -i input.mp4 \
    -c:v libx264 -crf 24 -profile:v baseline -level 3.0 \
    -maxrate 1500k -bufsize 2000k \
    -vf scale=480:360:force_original_aspect_ratio=decrease:force_divisible_by=2 \
    -pix_fmt yuv420p \
    -c:a aac -b:a 128k -ac 2 \
    output.mp4
```

---

## What the preset does / Что делает пресет

**EN:**
- **`-profile:v baseline -level 3.0`** — the 9700's hardware decoder requires H.264 Baseline; High/Main profiles will not play.
- **`-crf 24 -maxrate 1500k -bufsize 2000k`** — quality/bitrate balance that stays within the device's decoder limits.
- **`scale=480:360:force_original_aspect_ratio=decrease`** — fits the video into the screen while preserving aspect ratio (black bars are added by the player).
- **`force_divisible_by=2`** — keeps dimensions even, required by H.264/yuv420p encoding.
- **`-pix_fmt yuv420p`** — the only pixel format supported by the device's decoder.
- **`-c:a aac -b:a 128k -ac 2`** — stereo AAC at 128 kbps, safe for the device's audio pipeline.

**RU:**
- **`-profile:v baseline -level 3.0`** — аппаратный декодер 9700 требует H.264 Baseline; профили Main/High не воспроизведутся.
- **`-crf 24 -maxrate 1500k -bufsize 2000k`** — баланс качества и битрейта в пределах возможностей декодера.
- **`scale=480:360:force_original_aspect_ratio=decrease`** — видео вписывается в экран с сохранением пропорций (чёрные полосы рисует плеер).
- **`force_divisible_by=2`** — чётные размеры кадра, обязательно для H.264/yuv420p.
- **`-pix_fmt yuv420p`** — единственный пиксельный формат, поддерживаемый декодером устройства.
- **`-c:a aac -b:a 128k -ac 2`** — стерео AAC 128 кбит/с, стабильно работает на устройстве.

---

## Tested / Протестировано

- [x] Playback on BlackBerry 9700 / Воспроизведение на BlackBerry 9700

Report issues in the [main repo](../../README.md).
О проблемах сообщайте в [основном репозитории](../../README.md).
