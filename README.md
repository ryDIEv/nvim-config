# nvim-config

Минимальный конфиг Neovim: Lazy + LSP + CMP + стартовый экран (ASCII) + файловый менеджер (Oil) + onedark (warmer).

## Требования
- Neovim 0.11+ (проверка: `nvim --version`)
- git
- Для LSP:
  - clangd: `sudo apt install clangd`
  - bash-language-server: `sudo apt install nodejs npm && sudo npm i -g bash-language-server`

## Установка (Linux/macOS)

1) Сделать бэкап текущего конфига:
```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%F_%H%M%S) 2>/dev/null || true
```
2) Клонировать репозиторий:
```bash
git clone git@github.com:<USER>/<REPO>.git
```
3) Установить конфиг:
```bash
mkdir -p ~/.config
cp -a <REPO>/nvim ~/.config/nvim
```
4) Первый запуск:
- Открой nvim
- Выполни :Lazy sync
- Перезапусти nvim

