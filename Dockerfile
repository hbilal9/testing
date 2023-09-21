FROM node:18-alpine

# Create app directory
WORKDIR /var/www/frontend

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run generate


# nginx

FROM nginx:1.21-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]