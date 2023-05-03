# Настройка VS Code

Основная визуальная тема
```
One Dark Pro
```

Исправить smoot text на экране (После команды выполнить перезагрузку компьютера)
```
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
```

Чтобы reactjs понимал HTML теги

Prefference => Settings => Ищем emmet через поиск => Открывает setting.json => добавлять строки:
```
"emmet.includeLanguages": {
    "javascript": "javascriptreact"
}
```
