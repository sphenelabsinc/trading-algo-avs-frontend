FROM node:20

ARG NEXT_PUBLIC_ONCHAINKIT_API_KEY
ENV NEXT_PUBLIC_ONCHAINKIT_API_KEY=$NEXT_PUBLIC_ONCHAINKIT_API_KEY

ARG NEXT_PUBLIC_USE_TESTNET
ENV NEXT_PUBLIC_USE_TESTNET=$NEXT_PUBLIC_USE_TESTNET

ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL

ARG NEXT_PUBLIC_CONTRACT_ADDRESS
ENV NEXT_PUBLIC_CONTRACT_ADDRESS=$NEXT_PUBLIC_CONTRACT_ADDRESS

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN NEXT_PUBLIC_ONCHAINKIT_API_KEY=${NEXT_PUBLIC_ONCHAINKIT_API_KEY} \
  NEXT_PUBLIC_USE_TESTNET=${NEXT_PUBLIC_USE_TESTNET} \
  NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL} \
  NEXT_PUBLIC_CONTRACT_ADDRESS=${NEXT_PUBLIC_CONTRACT_ADDRESS} \
  npm run build

EXPOSE 8080

CMD ["npm", "run", "start"]