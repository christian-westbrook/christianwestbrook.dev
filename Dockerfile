FROM nginx:1.29.1-alpine

COPY . /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/app.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]