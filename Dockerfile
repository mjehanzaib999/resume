FROM nginx:1.27-alpine

# Every page is served by every instance. ROOT_DOC picks which one answers
# at "/", so the same image runs as the resume, portfolio and case-studies
# services with only an environment variable between them.
ENV ROOT_DOC=resume.html
ENV PORT=8080

COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY site/ /usr/share/nginx/html/

EXPOSE 8080
