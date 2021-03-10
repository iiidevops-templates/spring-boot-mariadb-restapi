Docker spring maraidb RESTAPI
spring簡易RESTAPI程式碼範例-docker

## 教學參考來源:
[spring-boot-mariadb-crud-example-tutorial](https://www.javaguides.net/2020/01/spring-boot-mariadb-crud-example-tutorial.html)

| API URL | Method | 說明 |
| --- | --- | --- | 
| /api/v1/employees | POST | 建立員工身分資料 |
| /api/v1/employees | GET | 取得員工身分資料 |
| /api/v1/employees/{id} | GET | 取得id是{id}的員工身分資料 |
| /api/v1/employees/{id} | PUT | 更新id是{id}的員工身分資料 |
| /api/v1/employees/{id} | GET | 刪除id是{id}的員工身分資料 |

## 專案資料夾與檔案格式說明
檔案可按照需求做修改，`postman_collection_local.json`是要快速部屬時進行Postman collection測試的的檔案，測試結果會自動產生`newman-report.xml`。`openapi_local.yaml`主要是透過owasp ZAP來進行安全掃描，測試報告會自動產生`owasp-report.md`，內包含詳細的掃描內容與建議。  

| 型態 | 名稱 | 說明 | 路徑 |
| --- | --- | --- | --- |
| 資料夾 | app | 專案主要程式碼 | 根目錄 |
| 檔案 | Dockerfile.local | (可調整)本地端部屬使用 | 根目錄 |
| 檔案 | docker-compose.yaml | (可調整)本地端快速部屬使用 | 根目錄 |
| 檔案 | postman_collection_local.json | (可調整)本地端快速部屬使用(Postman collection) | 在app資料夾內 |
| 檔案 | openapi_local.yaml | (可調整)本地端快速部屬使用(openAPI文件) | 在app資料夾內 | 
| 檔案 | newman-report.xml | (自動產生)Postman collection本地端測試報告 | 在app資料夾內 |
| 檔案 | owasp-report.md | (自動產生)owasp ZAP-本地端掃描測試報告 | 在app資料夾內 |
| 資料夾 | iiidevops | :warning: devops系統測試所需檔案 | 在根目錄 |
| 檔案 | .rancher-pipeline.yml | :warning: (不可更動)devops系統測試所需檔案 | 在根目錄 |
| 檔案 | pipeline_settings.json | :warning: (不可更動)devops系統測試所需檔案 | 在iiidevops資料夾內 |
| 檔案 | postman_collection.json | (可調整)devops newman部屬測試檔案 | iiidevops/postman資料夾內 |
| 檔案 | postman_environment.json | (可調整)devops newman部屬測試檔案 | iiidevops/postman資料夾內 |
| 檔案 | Dockerfile | (可調整)devops k8s環境部屬檔案 | 根目錄 |

## 開發者注意事項
:warning: 若專案建立後程式碼Pull到local端下來無法執行, 此狀況為正常現象
* 要在local端測試部屬提供兩種方式，透過安裝docker來進行專案快速專案部屬或直接修改我您作業系統的環境變數
* 若非用docker快速部屬想直接採用原本安裝在作業系統上的資料庫的話，請設定環境變數
```env
`db_host`: 指向到您的資料庫，例如localhost或是其他IP
`db_name`: 指向到您的資料庫名稱
`db_username`: 指向到您的資料庫使用者名稱
`db_password`: 指向到您的資料庫密碼
```

## 修改程式碼注意事項
1. 修改資料庫連線  
由於系統採用固定獨特的環境變數作為資料庫連線方法, 因此專案的資料庫連線部分請勿更動`app/src/main/resources/application.properties`內的
```
spring.datasource.url=jdbc:mariadb://${db_host}:3306/${db_name}
spring.datasource.username=${db_username}
spring.datasource.password=${db_password}
```
2. 修改環境版本  
而環境版本若非maven:3.6.3 JDK15, 想要更換環境版本請至`Dockefile`修改為自己想要的版本(如需要本機上做測試則須一併連同`Dockerfile.local`去做修改)
3. 部屬環境額外環境變數
若開發需求上可能有針對專案需要的特別環境變數，由於目前此需求不再系統開發考慮範圍內，因此可能要麻煩使用者透過修改`Dockerfile`的形式去加入
```dockerfile
ENV 環境變數名稱1 值1
ENV 環境變數名稱2 值2
ENV 環境變數名稱3 值3
```

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
| docker-spring-maraidb-restapi_web_1 | 0.0.0.0:49355->8080/tcp | 代表網站可透過 http://localhost:49355/api/v1/employees 連線 | 
| docker-spring-maraidb-restapi_adminer_1 | 0.0.0.0:49353->8080/tcp | 代表網頁資料庫管理可透過 http://localhost:49353/api/v1/employees 連線 |
| docker-spring-maraidb-restapi_swaggereditor_1 | 80/tcp, 0.0.0.0:49352->8080/tcp | 代表OpenAPI線上編輯器可透過 http://localhost:49352/api/v1/employees 連線 |
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
## 修改 Postman-collection(newman)自動測試以及owasp掃描API目標
當執行本地環境快速專案部屬時，會自動將您的網站與資料庫部屬完成後再進行postman測試以及owasp掃描
* Postman自動測試的檔案在`app`資料夾內的`postman_collection_local.json` 使用者可以按照開發上的需求去進行修改
* owasp ZAP自動掃描的檔案在`app`資料夾內的`openapi_local.yaml` 使用者可以按照開發上的需求去進行修改
:warning: 
```
  若您是在本地環境直接開發的話，可能會透過瀏覽器連http://localhost:8080
  而到了json檔案內就將http://localhost:8080改成http://web:8080即可
```
然後執行`docker-compose up -d --build`就會自動產生postman報告與owasp ZAP掃描結果

## iiidevops
* 專案內`.rancher-pipeline.yml`請勿更動，產品系統設計上不支援pipeline修改
* 目前系統pipeline限制，因此寫的服務請一定要在port:`8080`，資料庫類型無法更改。
* `iiidevops`資料夾內`pipeline_settings.json`請勿更動
* `postman`資料夾內則是您在devops管理網頁上的Postman-collection(newman)自動測試檔案，devops系統會以`postman`資料夾內檔案做自動測試
* `Dockerfile`內可能會看到很多本地端`Dockerfile.local`都加上前墜dockerhub，此為必須需求，為使image能從harbor上擷取出Docker Hub的image來源

## reference
https://www.javaguides.net/2020/01/spring-boot-mariadb-crud-example-tutorial.html

JDK15
