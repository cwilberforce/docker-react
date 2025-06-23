# Stage 1: Build React app
FROM node:alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine

COPY --from=builder /app/build /usr/share/nginx/html

# Optional: Custom config for React Router support
# COPY nginx.conf /etc/nginx/conf.d/default.conf
