# HTML
### How the web works.
When you type a web address (which is technically part of a URL) into your browser address bar, the following steps occur:
1. The browser goes to the DNS server and finds the real address of the server that the website lives on
1. The browser sends an HTTP request message to the server, asking it to send a copy of the website to the client. This message, and all other data sent between the client and the server, is sent across your internet connection using TCP/IP.
1. If the server approves the client's request, the server sends the client a "200 OK" message,  and then starts sending the website's files to the browser as a series of small chunks called data packets.
1. The browser assembles the small chunks into a complete web page and displays it to you

### HTTP VS HTTPS.
HTTP | HTTPS
|:------- |:-------
Hypertext Transfer Protocol | Hypertext Transfer Protocol Secure
No additional security features | 	Uses SSL certificates for public-key encryption
Made communication over the internet possible | 	Improves website authority, trust, and search engine rankings

### Web servers.
Servers are computers that store webpages, sites, or apps. When a client wants to access a webpage, a copy of the webpage code is downloaded from the server onto the client machine to rendered by the browser and displayed to the user.

### DNS.
The Domain Name System (DNS) is like an address book for websites. When you type a web address in your browser, the browser looks at the DNS to find the website's IP address. This system uses special servers that match up a web address you type into your browser.

#### Resources
- [MDN_web_docs](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works#dns_explained)

- [AWS](https://aws.amazon.com/compare/the-difference-between-https-and-http/#:~:tAext=HTTP%20messages%20are%20plaintext%2C%20which,the%20data%20over%20the%20network.)
