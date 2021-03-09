
# ZAP Scanning Report

Generated on Tue, 9 Mar 2021 06:24:42


## Summary of Alerts

| Risk Level | Number of Alerts |
| --- | --- |
| High | 0 |
| Medium | 1 |
| Low | 2 |
| Informational | 1 |

## Alerts

| Name | Risk Level | Number of Instances |
| --- | --- | --- | 
| Buffer Overflow | Medium | 2 | 
| A Server Error response code was returned by the server | Low | 2 | 
| X-Content-Type-Options Header Missing | Low | 2 | 
| A Client Error response code was returned by the server | Informational | 18 | 

## Alert Detail


  
  
  
  
### Buffer Overflow
##### Medium (Medium)
  
  
  
  
#### Description
<p>Buffer overflow errors are characterized by the overwriting of memory spaces of the background web process, which should have never been modified intentionally or unintentionally. Overwriting values of the IP (Instruction Pointer), BP (Base Pointer) and other registers causes exceptions, segmentation faults, and other process errors to occur. Usually these errors end execution of the application in an unexpected way. </p>
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees](http://10.20.0.78:10080/api/v1/employees)
  
  
  * Method: `POST`
  
  
  * Parameter: `lastName`
  
  
  * Evidence: `POST http://10.20.0.78:10080/api/v1/employees HTTP/1.1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0
Pragma: no-cache
Cache-Control: no-cache
Content-Length: 2166
Accept: */*
Content-Type: application/json
Host: 10.20.0.78:10080

`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees](http://10.20.0.78:10080/api/v1/employees)
  
  
  * Method: `POST`
  
  
  * Parameter: `emailId`
  
  
  * Evidence: `POST http://10.20.0.78:10080/api/v1/employees HTTP/1.1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0
Pragma: no-cache
Cache-Control: no-cache
Content-Length: 2149
Accept: */*
Content-Type: application/json
Host: 10.20.0.78:10080

`
  
  
  
  
Instances: 2
  
### Solution
<p>Rewrite the background program using proper return length checking.  This will require a recompile of the background executable.</p>
  
### Other information
<p>Potential Buffer Overflow.  The script closed the connection and threw a 500 Internal Server Error</p>
  
### Reference
* https://owasp.org/www-community/attacks/Buffer_overflow_attack

  
#### CWE Id : 120
  
#### WASC Id : 7
  
#### Source ID : 1

  
  
  
  
### A Server Error response code was returned by the server
##### Low (High)
  
  
  
  
#### Description
<p>A response code of 500 was returned by the server.</p><p>This may indicate that the application is failing to handle unexpected input correctly.</p><p>Raised by the 'Alert on HTTP Response Code Error' script</p>
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/.htaccess](http://10.20.0.78:10080/api/v1/employees/.htaccess)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 500`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees](http://10.20.0.78:10080/api/v1/employees)
  
  
  * Method: `POST`
  
  
  * Evidence: `HTTP/1.1 500`
  
  
  
  
Instances: 2
  
### Solution
<p></p>
  
### Reference
* 

  
#### CWE Id : 388
  
#### WASC Id : 20
  
#### Source ID : 4

  
  
  
  
### X-Content-Type-Options Header Missing
##### Low (Medium)
  
  
  
  
#### Description
<p>The Anti-MIME-Sniffing header X-Content-Type-Options was not set to 'nosniff'. This allows older versions of Internet Explorer and Chrome to perform MIME-sniffing on the response body, potentially causing the response body to be interpreted and displayed as a content type other than the declared content type. Current (early 2014) and legacy versions of Firefox will use the declared content type (if one is set), rather than performing MIME-sniffing.</p>
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees](http://10.20.0.78:10080/api/v1/employees)
  
  
  * Method: `GET`
  
  
  * Parameter: `X-Content-Type-Options`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees](http://10.20.0.78:10080/api/v1/employees)
  
  
  * Method: `POST`
  
  
  * Parameter: `X-Content-Type-Options`
  
  
  
  
Instances: 2
  
### Solution
<p>Ensure that the application/web server sets the Content-Type header appropriately, and that it sets the X-Content-Type-Options header to 'nosniff' for all web pages.</p><p>If possible, ensure that the end user uses a standards-compliant and modern web browser that does not perform MIME-sniffing at all, or that can be directed by the web application/web server to not perform MIME-sniffing.</p>
  
### Other information
<p>This issue still applies to error type pages (401, 403, 500, etc.) as those pages are often still affected by injection issues, in which case there is still concern for browsers sniffing pages away from their actual content type.</p><p>At "High" threshold this scan rule will not alert on client or server error responses.</p>
  
### Reference
* http://msdn.microsoft.com/en-us/library/ie/gg622941%28v=vs.85%29.aspx
* https://owasp.org/www-community/Security_Headers

  
#### CWE Id : 16
  
#### WASC Id : 15
  
#### Source ID : 3

  
  
  
  
### A Client Error response code was returned by the server
##### Informational (High)
  
  
  
  
#### Description
<p>A response code of 404 was returned by the server.</p><p>This may indicate that the application is failing to handle unexpected input correctly.</p><p>Raised by the 'Alert on HTTP Response Code Error' script</p>
  
  
  
* URL: [http://10.20.0.78:10080](http://10.20.0.78:10080)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/.htaccess](http://10.20.0.78:10080/.htaccess)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/10](http://10.20.0.78:10080/api/v1/employees/10)
  
  
  * Method: `DELETE`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1](http://10.20.0.78:10080/api/v1)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/](http://10.20.0.78:10080/)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/10](http://10.20.0.78:10080/api/v1/employees/10)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/8251644184734161722](http://10.20.0.78:10080/8251644184734161722)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/](http://10.20.0.78:10080/api/v1/)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/.htaccess](http://10.20.0.78:10080/api/.htaccess)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/.htaccess](http://10.20.0.78:10080/api/v1/.htaccess)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/7814092365558931886](http://10.20.0.78:10080/api/v1/employees/7814092365558931886)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/10](http://10.20.0.78:10080/api/v1/employees/10)
  
  
  * Method: `PUT`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/5119862881606790229](http://10.20.0.78:10080/api/v1/5119862881606790229)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/elmah.axd](http://10.20.0.78:10080/elmah.axd)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/](http://10.20.0.78:10080/api/)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/2779927754770138684](http://10.20.0.78:10080/api/2779927754770138684)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api/v1/employees/10/](http://10.20.0.78:10080/api/v1/employees/10/)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
* URL: [http://10.20.0.78:10080/api](http://10.20.0.78:10080/api)
  
  
  * Method: `GET`
  
  
  * Evidence: `HTTP/1.1 404`
  
  
  
  
Instances: 18
  
### Solution
<p></p>
  
### Reference
* 

  
#### CWE Id : 388
  
#### WASC Id : 20
  
#### Source ID : 4
