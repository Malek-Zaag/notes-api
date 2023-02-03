FROM node:16

WORKDIR /home/app/
COPY package.json ./
RUN npm install
COPY . .
ENV DB_URI="mongodb+srv://admin:admin@cluster0.gkmmv.mongodb.net/notes-api?retryWrites=true&w=majority"
ENV PORT=3000
EXPOSE 3000
CMD [ "npm","run","start:dev" ,"app.js" ]