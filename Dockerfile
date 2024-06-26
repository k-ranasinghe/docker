    #stage 1 
    FROM node:19-alpine3.15 as node 
    WORKDIR /app 
    COPY . . 
    RUN npm install 
    RUN npm run build --prod 

    #stage 2 
    FROM nginx:alpine 
    COPY --from=node /app/dist/app /usr/share/nginx/html
