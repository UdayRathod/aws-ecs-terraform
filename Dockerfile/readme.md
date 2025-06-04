This repo demonstrates how to host your Resume on a container.

Files in this repo:
1) index.html : This is the html file for the ngnix configuration, with soruce as our resume.pdf & type as application/pdf.

2) Dockerfile: Takes Alpine image as light weight based base image, then we copy the index.html & resume in location: /usr/share/nginx/html/ & then expose our app on port 80.

3) Uday-Rathod-Resume is my resume which will be used by index.html to render it as pdf.