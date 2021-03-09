
# ZAP Scanning Report

Generated on Tue, 9 Mar 2021 04:56:46


## Summary of Alerts

| Risk Level | Number of Alerts |
| --- | --- |
| High | 0 |
| Medium | 1 |
| Low | 0 |
| Informational | 1 |

## Alerts

| Name | Risk Level | Number of Instances |
| --- | --- | --- | 
| HTTP Only Site | Medium | 1 | 
| User Agent Fuzzer | Informational | 28 | 

## Alert Detail


  
  
  
  
### HTTP Only Site
##### Medium (Medium)
  
  
  
  
#### Description
<p>The site is only served under HTTP and not HTTPS.</p>
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  
  
Instances: 1
  
### Solution
<p>Configure your web or application server to use SSL (https).</p>
  
### Other information
<p>Failed to connect.</p><p>ZAP attempted to connect via: https://web:443</p>
  
### Reference
* https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html
* https://letsencrypt.org/

  
#### CWE Id : 311
  
#### WASC Id : 4
  
#### Source ID : 1

  
  
  
  
### User Agent Fuzzer
##### Informational (Medium)
  
  
  
  
#### Description
<p>Check for differences in response based on fuzzed User Agent (eg. mobile sites, access as a Search Engine Crawler). Compares the response statuscode and the hashcode of the response body with the original response.</p>
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  
  
  
  
* URL: [http://web:8080/sitemap.xml](http://web:8080/sitemap.xml)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `msnbot/1.1 (+http://search.msn.com/msnbot.htm)`
  
  
  
  
* URL: [http://web:8080/robots.txt](http://web:8080/robots.txt)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)`
  
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `msnbot/1.1 (+http://search.msn.com/msnbot.htm)`
  
  
  
  
* URL: [http://web:8080/sitemap.xml](http://web:8080/sitemap.xml)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)`
  
  
  
  
* URL: [http://web:8080/sitemap.xml](http://web:8080/sitemap.xml)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `msnbot/1.1 (+http://search.msn.com/msnbot.htm)`
  
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)`
  
  
  
  
* URL: [http://web:8080/robots.txt](http://web:8080/robots.txt)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `msnbot/1.1 (+http://search.msn.com/msnbot.htm)`
  
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)`
  
  
  
  
* URL: [http://web:8080/robots.txt](http://web:8080/robots.txt)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16`
  
  
  
  
* URL: [http://web:8080/robots.txt](http://web:8080/robots.txt)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)`
  
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)`
  
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)`
  
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  
  
  
  
* URL: [http://web:8080](http://web:8080)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16`
  
  
  
  
* URL: [http://web:8080/](http://web:8080/)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16`
  
  
  
  
* URL: [http://web:8080/sitemap.xml](http://web:8080/sitemap.xml)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)`
  
  
  
  
* URL: [http://web:8080/sitemap.xml](http://web:8080/sitemap.xml)
  
  
  * Method: `GET`
  
  
  * Parameter: `Header User-Agent`
  
  
  * Attack: `Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)`
  
  
  
  
Instances: 28
  
### Solution
<p></p>
  
### Reference
* https://owasp.org/wstg

  
#### Source ID : 1
