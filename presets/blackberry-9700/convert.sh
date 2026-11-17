#!/usr/bin/env bash
# BlackBerry 9700 (Bold) video conversion preset
# Пресет конвертации видео для BlackBerry 9700 (Bold)
#
# Usage / Использование:
#   ./convert.sh input.mp4 [output.mp4]
# If output is omitted, writes <input>.bb9700.mp4
# Если выходной файл не указан, создаётся <input>.bb9700.mp4

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: ./convert.sh input.mp4 [output.mp4]"
    exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.*}.bb9700.mp4}"

if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "Error: ffmpeg is not installed / Ошибка: ffmpeg не установлен"
    exit 1
fi

ffmpeg -i "$INPUT" \
    -c:v libx264 -crf 24 -profile:v baseline -level 3.0 \
    -maxrate 1500k -bufsize 2000k \
    -vf scale=480:360:force_original_aspect_ratio=decrease:force_divisible_by=2 \
    -pix_fmt yuv420p \
    -c:a aac -b:a 128k -ac 2 \
    "$OUTPUT"

echo "Done / Готово: $OUTPUT"
