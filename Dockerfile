# Gunakan base image Node.js untuk build tahap pertama
FROM node:18 AS build-stage

# Tentukan direktori kerja dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh kode proyek ke dalam container
COPY . .

# Build proyek Vue.js
RUN npm run build

# Gunakan Nginx sebagai server web untuk tahap produksi
FROM nginx:alpine

# Copy hasil build ke direktori yang digunakan oleh Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Ekspos port 80 untuk akses web
EXPOSE 80

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
