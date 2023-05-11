## Удалить файл из git, который ранее был в коммите
```
git rm .env --cached
git rm .env.local --cached
git commit -m "Stopped tracking .env"
```
