# Router MVP

## Что это
Мини-продукт для работы с AI Router.

# AI Router MVP

Turn raw conversations into structured files using AI + PowerShell.

No folders. No chaos. Just memory.

## Файлы
- router_prompt.txt
- quickstart.md
- examples.md
- README.md
- launch_router.ps1

## Смысл
Router получает сырой текст, определяет смысл, раскладывает по контейнерам Hermes
и выдаёт PowerShell-команды для сохранения.

## Быстрый запуск

```powershell
powershell -ExecutionPolicy Bypass -File "E:\Hermes\Product\Router_MVP\launch_router.ps1"
```