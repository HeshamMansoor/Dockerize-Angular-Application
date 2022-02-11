#First stage of building anguler docker image
FROM  node:alpine3.14 as build
RUN mkdir -p /app 
WORKDIR /app

COPY package.json /app/
RUN npm install 

COPY . /app/
Run  npm run build --prod 

###final stage webserver

FROM nginx:alpine

COPY --from=build /app/dist/new-helpdesk /usr/share/nginx/html



