# Stage 1: Build ứng dụng
FROM node:16-alpine3.17 AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Chạy với Nginx
FROM nginx:stable-alpine
# Copy file đã build từ stage 1 sang thư mục của Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html
# Nginx mặc định chạy port 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
