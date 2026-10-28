FROM nginx:1.27-alpine

# Both pages are served by every instance. ROOT_DOC picks which one answers
# at "/", so the same image runs as the resume service and the portfolio
# service with only an environment variable between them.
ENV ROOT_DOC=resume.html
ENV PORT=8080

COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY site/ /usr/share/nginx/html/

EXPOSE 8080
