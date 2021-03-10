Docker spring maraidb RESTAPI
spring簡易RESTAPI程式碼範例-docker

## 教學參考來源:

## 專案資料夾與檔案格式說明
檔案可按照需求做修改，`postman_collection_local.json`是要快速部屬時進行Postman collection測試的的檔案，測試結果會自動產生`newman-report.xml`。`openapi_local.yaml`主要是透過owasp ZAP來進行安全掃描，測試報告會自動產生`owasp-report.md`，內包含詳細的掃描內容與建議。
| 型態 | 名稱 | 說明 | 路徑 |
| --- | --- | --- | --- |
| 資料夾 | app | 專案主要程式碼 | 根目錄 |
| 檔案 | Dockerfile.local | 本地端部屬使用 | 根目錄 |
| 檔案 | docker-compose.yaml | 本地端快速部屬使用 | 根目錄 |
| 檔案 | postman_collection_local.json | 本地端快速部屬使用(Postman collection) | 在app資料夾內 |
| 檔案 | openapi_local.yaml | 本地端快速部屬使用(openAPI文件) | 在app資料夾內 | 
| 檔案 | newman-report.xml | (自動產生)Postman collection本地端測試報告 | 在app資料夾內 |
| 檔案 | owasp-report.md | (自動產生)owasp ZAP-本地端掃描測試報告 | 在app資料夾內 |

## (local)本地環境隔離快速專案部屬(隨機PORT) + Postman-collection(newman)自動測試 + owasp ZAP掃描
需安裝Docker, 若在Linux環境需額外手動安裝docker-compose, 部屬內容結果應與UI相同，但不會清空資料庫資料  
:warning: 這個專案部屬的時間會比較久，最快大約也需要3~5分鐘請慢慢等候
``` 
docker-compose up -d --build 
```
部屬包含spring API網頁 + Postman-collection(newman)自動測試, 自動測試報告結果會自動產生在`app/newman-report.xml`, 驗證後即可上傳程式碼
### 查看部屬結果 `docker-compose ps`
```sh
                       Name                                     Command                  State                    Ports
------------------------------------------------------------------------------------------------------------------------------------
docker-spring-maraidb-restapi_adminer_1              entrypoint.sh docker-php-e ...   Up             0.0.0.0:49353->8080/tcp
docker-spring-maraidb-restapi_db_1                   /opt/bitnami/scripts/maria ...   Up (healthy)   3306/tcp
docker-spring-maraidb-restapi_owasp_1                bash -c  sleep 30 && zap-a ...   Exit 2
docker-spring-maraidb-restapi_postman_collection_1   newman run /etc/postman/po ...   Exit 0
docker-spring-maraidb-restapi_swaggereditor_1        /docker-entrypoint.sh sh / ...   Up             80/tcp, 0.0.0.0:49352->8080/tcp
docker-spring-maraidb-restapi_web_1                  java -jar /usr/local/tomca ...   Up (healthy)   0.0.0.0:49355->8080/tcp
```
由上述結果(Name與Ports)可以查詢出部屬的網站位置(localhost可換成主機IP)
| Name | Ports | 說明 |
| --- | --- | --- |
| docker-spring-maraidb-restapi_web_1 | 0.0.0.0:49355->8080/tcp | 代表網站可透過http://localhost:49355/api/v1/employees 連線 | 
| docker-spring-maraidb-restapi_adminer_1 | 0.0.0.0:49353->8080/tcp | 代表網頁資料庫管理可透過http://localhost:49353/api/v1/employees 連線 |
### 查看與追蹤部屬的網頁伺服器紀錄Log `docker-compose logs -f web`
可用`Ctrl+V`來離開Log追蹤
```sh
web_1                 |
web_1                 |   .   ____          _            __ _ _
web_1                 |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
web_1                 | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
web_1                 |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
web_1                 |   '  |____| .__|_| |_|_| |_\__, | / / / /
web_1                 |  =========|_|==============|___/=/_/_/_/
web_1                 |  :: Spring Boot ::                (v2.4.3)
web_1                 |
web_1                 | 2021-03-10 03:29:38.117  INFO 1 --- [           main] com.example.demo.DemoApplication         : Starting DemoApplication v0.0.1-SNAPSHOT using Java 11.0.10 on 2aedcf197dc3 with PID 1 (/usr/local/tomcat/webapps/ROOT.jar started by root in /usr/local/tomcat)
web_1                 | 2021-03-10 03:29:38.123  INFO 1 --- [           main] com.example.demo.DemoApplication         : No active profile set, falling back to default profiles: default
web_1                 | 2021-03-10 03:29:39.484  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Bootstrapping Spring Data JPA repositories in DEFAULT mode.
web_1                 | 2021-03-10 03:29:39.588  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Finished Spring Data repository scanning in 88 ms. Found 1 JPA repository interfaces.
web_1                 | 2021-03-10 03:29:40.573  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
web_1                 | 2021-03-10 03:29:40.596  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
web_1                 | 2021-03-10 03:29:40.596  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.43]
web_1                 | 2021-03-10 03:29:40.599  INFO 1 --- [           main] o.a.catalina.core.AprLifecycleListener   : Loaded Apache Tomcat Native library [1.2.26] using APR path ''
web_1                 | 2021-03-10 03:29:44.519  INFO 1 --- [           main] com.example.demo.DemoApplication         : Started DemoApplication in 7.437 seconds (JVM running for 8.386)
...................................................
web_1                 | 2021-03-10 03:32:36.464  INFO 1 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
web_1                 | 2021-03-10 03:32:36.465  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
web_1                 | 2021-03-10 03:32:36.471  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 5 ms
```
### 查看與追蹤部屬的資料庫紀錄Log `docker-compose logs -f db`
可用`Ctrl+V`來離開Log追蹤
```sh
db_1                  | mariadb 09:14:16.70
db_1                  | mariadb 09:14:16.71 Welcome to the Bitnami mariadb container
db_1                  | mariadb 09:14:16.71 Subscribe to project updates by watching https://github.com/bitnami/bitnami-docker-mariadb
db_1                  | mariadb 09:14:16.71 Submit issues and feature requests at https://github.com/bitnami/bitnami-docker-mariadb/issues
db_1                  | mariadb 09:14:16.71
db_1                  | mariadb 09:14:16.72 INFO  ==> ** Starting MariaDB setup **
db_1                  | mariadb 09:14:16.74 INFO  ==> Validating settings in MYSQL_*/MARIADB_* env vars
db_1                  | mariadb 09:14:16.75 INFO  ==> Initializing mariadb database
db_1                  | mariadb 09:14:16.77 INFO  ==> Updating 'my.cnf' with custom configuration
db_1                  | mariadb 09:14:16.78 INFO  ==> Installing database
db_1                  | mariadb 09:14:27.30 INFO  ==> Starting mariadb in background
db_1                  | mariadb 09:14:29.33 INFO  ==> Configuring authentication
db_1                  | mariadb 09:14:30.27 INFO  ==> Running mysql_upgrade
db_1                  | mariadb 09:14:43.74 INFO  ==> Stopping mariadb
db_1                  | mariadb 09:14:44.75 INFO  ==> ** MariaDB setup finished! **
db_1                  |
db_1                  | mariadb 09:14:44.79 INFO  ==> ** Starting MariaDB **

```
### 網頁資料庫管理說明
| 資料庫系統 | 伺服器 | 帳號 | 密碼 | 資料庫 |
| --- | --- | --- | --- | --- |
| Mysql | db | root | mypassword | springboot_demo |
### 清除快速部屬
| 清除儲存資料(包含資料庫資料等) | 僅關閉掉快速部屬 |
| --- | --- |
| docker-compose down | docker-compose down -v | 

JDK15
