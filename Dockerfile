FROM node:12-alpine
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/


# install chromium and clear cache
RUN apk add --update-cache chromium \
 && rm -rf /var/cache/apk/* /tmp/*

COPY ./package.json .
COPY . .

# install npm packages
RUN npm install --no-package-lock
ENV CHROME_LOCATION /usr/bin/chromium-browser
EXPOSE 3000

# Expose Chromium remote debugging port for connecting Puppeteer
EXPOSE 9222

CMD ["node", "server.js"]
