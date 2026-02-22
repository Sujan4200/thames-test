
Backup 

docker run --rm -v getting-started-todo-app_todo-mysql-data:/data -v $(pwd):/backup alpine tar czf /backup/mysql.tar.gz -C /data .




Restore 

docker run --rm -v getting-started-todo-app_todo-mysql-data:/data -v $(pwd):/backup alpine tar xzf /backup/mysql.tar.gz -C /data
