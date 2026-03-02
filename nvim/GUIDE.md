# nvim-config v1.0 — краткий гайд

## Главное
- Leader: `Space`
- Меню: `Space m`
- Гайд: `Space h` или кнопка `g` в меню

## Поиск (Telescope)
- `Space ff` — файлы
- `Space fg` — grep по проекту (нужен `rg`)
- `Space fb` — буферы
- `Space fr` — недавние файлы
- `Space fh` — help

## Файлы (Oil)
- `-` или `Space e` — проводник
- `Space E` — проводник (float)
- В Oil изменения применяются через `:w`

## Ошибки (Trouble)
- `Space xx` — diagnostics
- `Space xq` — quickfix

## LSP (Neovim 0.11+)
- `K` — подсказка (hover)
- `grn` — rename
- `gra` — code action
- `grr` — references
- `[d` / `]d` — диагностика по файлу

## Буферы
- `Space bd` — закрыть буфер (если последний — вернёт в меню)
