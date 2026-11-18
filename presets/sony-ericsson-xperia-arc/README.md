# Sony Ericsson Xperia Arc (LT15i)

**EN:** FFmpeg preset for converting video for the Sony Ericsson Xperia Arc (LT15i) running Android 4.0 (Ice Cream Sandwich).

**RU:** Пресет FFmpeg для конвертации видео под Sony Ericsson Xperia Arc (LT15i) на Android 4.0 (Ice Cream Sandwich).

---

## Device Specs / Характеристики устройства

| Parameter / Параметр | Value / Значение |
|---|---|
| Display / Экран | 854×480, 4.2" |
| SoC / Платформа | Snapdragon S2 MSM8255, 1 ГГц, single-core |
| GPU / Графика | Adreno 205 |
| Video codec / Видеокодек | H.264 High, Level 3.1 |
| Audio codec / Аудиокодек | AAC-LC, stereo |
| Container / Контейнер | MP4 |
| Max video bitrate / Макс. битрейт видео | 6000 kbps |
| Target resolution / Целевое разрешение | 1280×720 (HD) |

---

## Usage / Использование

```bash
./convert.sh input.mp4 output.mp4
```

Or run FFmpeg directly / Или запустите FFmpeg напрямую:

```bash
ffmpeg -i input.mp4 \
    -c:v libx264 -crf 25 -preset medium \
    -profile:v high -level 3.1 \
    -maxrate 6000k -bufsize 10000k \
    -vf scale=1280:720:force_original_aspect_ratio=decrease:force_divisible_by=2 \
    -pix_fmt yuv420p \
    -g 96 -bf 2 \
    -movflags +faststart \
    -c:a aac -b:a 160k -ac 2 \
    output.mp4
```

---

## What the preset does / Что делает пресет

**EN:**
- **`-profile:v high -level 3.1`** — the Adreno 205 hardware decoder handles High profile up to level 3.1 (720p30). If playback stutters on your unit, switch to `-profile:v main`.
- **`-crf 25 -maxrate 6000k -bufsize 10000k`** — targets ~4–6 Mbps, a safe ceiling for the single-core S2 decoder. CRF 25 trades a bit of quality for noticeably smaller files.
- **`-g 96 -bf 2`** — GOP of 96 (~4 s at 24 fps), B-frames on. If seeking misbehaves, lower `-g` to 48.
- **`-movflags +faststart`** — moves the moov atom to the file start so playback can begin before the file is fully copied to the device.
- **`-pix_fmt yuv420p`** — the only pixel format the hardware decoder accepts.
- **Audio 160 kbps AAC stereo** — standard for Android 4.0.

**RU:**
- **`-profile:v high -level 3.1`** — аппаратный декодер Adreno 205 тянет High profile до уровня 3.1 (720p30). Если на вашем экземпляре дёргается — переключите на `-profile:v main`.
- **`-crf 25 -maxrate 6000k -bufsize 10000k`** — целевые ~4–6 Мбит/с, безопасный потолок для одноядерного Snapdragon S2. CRF 25 жертвует небольшим качеством ради заметно меньшего размера файлов.
- **`-g 96 -bf 2`** — GOP 96 кадров (~4 с при 24 fps), B-фреймы включены. Если перемотка глючит, уменьшите `-g` до 48.
- **`-movflags +faststart`** — переносит moov-атом в начало файла, чтобы воспроизведение начиналось до завершения копирования на устройство.
- **`-pix_fmt yuv420p`** — единственный пиксельный формат, который принимает аппаратный декодер.
- **Аудио AAC 160 кбит/с стерео** — стандарт для Android 4.0.

---

## Notes / Примечания

**EN:**
- The screen is 854×480, so 720p is downscaled by the player — use it for maximum source fidelity, not because the panel shows every pixel.
- On heavy 60 fps sources, converting to 30 fps (`-r 30`) noticeably improves playback smoothness.

**RU:**
- Экран 854×480, поэтому 720p плеер даунскейлит — используем его ради максимальной детализации исходника, а не потому что экран показывает каждый пиксель.
- Для тяжёлых 60 fps исходников переход на 30 fps (`-r 30`) заметно улучшает плавность.

---

## Tested / Протестировано

- [x] Playback on Xperia Arc (LT15i), Android 4.0.4 / Воспроизведение на Xperia Arc (LT15i), Android 4.0.4

Report issues in the [main repo](../../README.md).
О проблемах сообщайте в [основном репозитории](../../README.md).
