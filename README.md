Docker spring maraidb RESTAPI
spring簡易RESTAPI程式碼範例-docker

## 如何增加Sonarqube掃描(用預設的QualiyGate)
在`app/pom.xml`的檔案內plugins新增如下段落後pipeline即可運行Sonarqube掃描
```
	<build>
		<plugins>
			<plugin>
          		<groupId>org.sonarsource.scanner.maven</groupId>
          		<artifactId>sonar-maven-plugin</artifactId>
          		<version>3.7.0.1746</version>
        	</plugin>
        	<plugin>
          		<groupId>org.jacoco</groupId>
          		<artifactId>jacoco-maven-plugin</artifactId>
          		<version>0.8.6</version>
        	</plugin>
		</plugins>
	</build>
```   
若要設定其他額外的細節也可寫在`app/pom.xml`，例如排除特定資料夾(與程式碼無關的)、指定的QualityGate、Rule等等  
相關可用額外參數說明可參考[sonarscanner-for-maven](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-maven/)

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

## iiidevops
* 專案內`.rancher-pipeline.yml`請勿更動，產品系統設計上不支援pipeline修改
* 目前系統pipeline限制，因此寫的服務請一定要在port:`8080`，資料庫類型無法更改。
* `iiidevops`資料夾內`pipeline_settings.json`請勿更動
* `postman`資料夾內則是您在devops管理網頁上的Postman-collection(newman)自動測試檔案，devops系統會以`postman`資料夾內檔案做自動測試
* `Dockerfile`內可能會看到很多本地端`Dockerfile.local`都加上前墜dockerhub，此為必須需求，為使image能從harbor上擷取出Docker Hub的image來源

## 教學參考來源:
[spring-boot-mariadb-crud-example-tutorial](https://www.javaguides.net/2020/01/spring-boot-mariadb-crud-example-tutorial.html)

| API URL | Method | 說明 |
| --- | --- | --- | 
| /api/v1/employees | POST | 建立員工身分資料 |
| /api/v1/employees | GET | 取得員工身分資料 |
| /api/v1/employees/{id} | GET | 取得id是{id}的員工身分資料 |
| /api/v1/employees/{id} | PUT | 更新id是{id}的員工身分資料 |
| /api/v1/employees/{id} | GET | 刪除id是{id}的員工身分資料 |

## reference
https://www.javaguides.net/2020/01/spring-boot-mariadb-crud-example-tutorial.html

JDK15
