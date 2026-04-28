# Sử dụng Nginx nhẹ để chạy ứng dụng
FROM nginx:stable-alpine

# Chỉ định thư mục làm việc (tùy chọn)
WORKDIR /usr/share/nginx/html

# Xóa các file mặc định của Nginx
RUN rm -rf ./*

# Copy toàn bộ nội dung thư mục dist (đã được Jenkins build) vào Nginx
# Lưu ý: Đường dẫn 'dist/' phải tương ứng với cấu trúc thư mục trên Jenkins
COPY dist/ .

# Copy cấu hình Nginx tùy chỉnh (để handle Routing của SPA)
COPY default.conf /etc/nginx/conf.d/default.conf

# Nginx chạy ở port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
