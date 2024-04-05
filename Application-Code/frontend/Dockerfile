# Stage1: Build the app
FROM node:14-alpine AS builder
WORKDIR /usr/src/app
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage2: Create the Production image
FROM nginx:stable-alpine AS production
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]





