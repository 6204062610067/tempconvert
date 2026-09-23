FROM nginx:alpine

# The platform runs this with a read-only root filesystem as uid 10001 with all
# capabilities dropped. Stock nginx cannot start under that: it binds port 80,
# writes its pid to /var/run, and creates cache directories under
# /var/cache/nginx. nginx.conf moves all of that to /tmp and port 3000.
COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html/
COPY CSS /usr/share/nginx/html/CSS
COPY Img /usr/share/nginx/html/Img
COPY Js /usr/share/nginx/html/Js

EXPOSE 3000
USER 10001:10001

CMD ["nginx", "-g", "daemon off;"]
