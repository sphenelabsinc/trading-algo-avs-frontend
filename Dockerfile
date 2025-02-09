FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN cd blockchain
RUN npm install
RUN cd ..

RUN npm run build


EXPOSE 8080

CMD ["npm", "run", "start"]