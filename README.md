# nvim-config v1.0

Минимальный конфиг Neovim для учебной/серверной среды с упором на C:
- onedark (тёмная база), Alpha-меню, lualine
- Telescope (поиск), Oil (файловые операции)
- LSP: clangd + bashls
- nvim-cmp (completion)
- vim-illuminate (подсветка повторов), trouble.nvim (диагностика)

## Установка (быстро)
1) Склонировать репозиторий в `~/repos/nvim-config`
2) Сделать симлинк:
   ```bash
   rm -rf ~/.config/nvim
   ln -s ~/repos/nvim-config/nvim ~/.config/nvim
   ```
3) Запустить nvim, выполнить :Lazy sync, перезапустить.

## Зависимости (минимум)

`rg (ripgrep)` — для поиска

`clangd` — для C/C++

`node` + `npm` и `bash-language-server` (опционально, для `bashls`)

Debian:

`apt install ripgrep clangd nodejs npm`

`npm i -g bash-language-server`

## Гайд по использованию

Открыть из меню кнопкой g или командой `:Guide` / `Space h`.
