#!/usr/bin/env bash
# Sony Ericsson Xperia Arc (LT15i, Android 4.0) video conversion preset — 720p
# Пресет конвертации видео для Sony Ericsson Xperia Arc (LT15i, Android 4.0) — 720p
#
# Usage / Использование:
#   ./convert.sh input.mp4 [output.mp4]
# If output is omitted, writes <input>.xperiaarc.mp4
# Если выходной файл не указан, создаётся <input>.xperiaarc.mp4

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: ./convert.sh input.mp4 [output.mp4]"
    exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.*}.xperiaarc.mp4}"

if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "Error: ffmpeg is not installed / Ошибка: ffmpeg не установлен"
    exit 1
fi

ffmpeg -i "$INPUT" \
    -c:v libx264 -crf 25 -preset medium \
    -profile:v high -level 3.1 \
    -maxrate 6000k -bufsize 10000k \
    -vf scale=1280:720:force_original_aspect_ratio=decrease:force_divisible_by=2 \
    -pix_fmt yuv420p \
    -g 96 -bf 2 \
    -movflags +faststart \
    -c:a aac -b:a 160k -ac 2 \
    "$OUTPUT"

echo "Done / Готово: $OUTPUT"
