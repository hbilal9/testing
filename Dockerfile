#Stage 1
FROM node:16.16 as build

# Create app directory
WORKDIR /var/www/frontend

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

# Command to start the Node server
CMD ["node", ".output/server/index.mjs"]


# Stage 2 nginx

# FROM nginx:1.25-alpine

# # COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# COPY --from=build /var/www/frontend/dist .

# # EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]