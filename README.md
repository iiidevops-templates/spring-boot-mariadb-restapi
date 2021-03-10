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

## (local)本地環境隔離快速專案部屬(隨機PORT) + Postman-collection(newman)自動測試
需安裝Docker, 若在Linux環境需額外手動安裝docker-compose, 部屬內容結果應與UI相同
``` 
docker-compose up -d --build 
```
部屬包含spring API網頁 + Postman-collection(newman)自動測試, 自動測試報告結果會自動產生在`app/newman-report.xml`, 驗證後即可上傳程式碼
### 查看部屬結果 `docker-compose ps`
```
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
| docker-spring-maraidb-restapi_web_1 | 0.0.0.0:49355->8080/tcp | 代表網站可透過http://localhost:49355/api/v1/emplyee 連線 | 
| docker-spring-maraidb-restapi_adminer_1 | 0.0.0.0:49353->8080/tcp | 代表網頁資料庫管理可透過http://localhost:49353/api/v1/emplyee 連線 |


JDK15
