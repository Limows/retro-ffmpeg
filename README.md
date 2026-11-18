# Retro FFmpeg Presets / Ретро-пресеты для FFmpeg

**Community-driven collection of FFmpeg presets for converting video to retro devices.**

**Коллекция ffmpeg-пресетов от сообщества для конвертации видео под ретро-устройства.**

---

## Menu / Меню

| Device / Устройство | Screen / Экран | Format / Формат | Preset / Пресет |
|---|---|---|---|
| 📱 **BlackBerry 9700 (Bold)** | 480×360 | MP4 (H.264 Baseline + AAC) | [presets/blackberry-9700/](presets/blackberry-9700/) |

> 💡 Don't see your device? [Add a preset!](#-how-to-add-your-preset--как-добавить-свой-пресет)

---

## Quick Start / Быстрый старт

Each preset folder contains a ready-to-use script. Example / Пример:

```bash
# Navigate to the preset folder / Перейдите в папку пресета
cd presets/blackberry-9700

# Convert your video / Конвертируйте своё видео
./convert.sh input.mp4 output.mp4
```

Or copy the FFmpeg command directly from the preset's `README.md`.

Или скопируйте команду FFmpeg напрямую из `README.md` в папке пресета.

---

## Repository Structure / Структура репозитория

```
retro-ffmpeg-presets/
├── README.md                  ← this file / этот файл
├── LICENSE                    ← BSD 2-Clause license / лицензия
└── presets/
    └── blackberry-9700/       ← first preset / первый пресет
        ├── README.md          ← usage instructions / инструкция
        └── convert.sh         ← conversion script / скрипт конвертации
```

---

## How to Add Your Preset / Как добавить свой пресет

1. Fork the repo / Сделайте форк
2. Create a folder `presets/<device-name>/` / Создайте папку `presets/<название-устройства>/`
3. Add your working FFmpeg command or script / Добавьте рабочую команду FFmpeg или скрипт
4. Test it on the real device / Протестируйте на реальном устройстве
5. Add a `README.md` with: / Добавьте `README.md` с указанием:
   - device specs (screen, codecs, limits) / характеристик устройства (экран, кодеки, ограничения)
   - usage example / примера использования
6. Add a row to the [menu table](#-menu--меню) above / Добавьте строку в таблицу меню выше
7. Commit / Закоммитьте: `git commit -m "Add preset for <device>"`
8. Open a Pull Request / Откройте Pull Request

---

## Preset Requirements / Требования к пресетам

- ✅ Must work on a real device / Должен работать на реальном устройстве
- ✅ Include source specs (resolution, bitrate, codec limits) / Включайте характеристики устройства
- ✅ Prefer widely compatible codecs (H.264 Baseline, AAC) / Используйте максимально совместимые кодеки
- ❌ No watermarks, no proprietary blobs / Без водяных знаков и проприетарных бинарников

---

## License / Лицензия

Presets are provided under the [BSD 2-Clause License](LICENSE). Use freely, modify, share.

Пресеты распространяются под лицензией [BSD 2-Clause](LICENSE). Используйте свободно, изменяйте, делитесь.
