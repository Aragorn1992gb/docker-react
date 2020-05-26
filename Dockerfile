# Multi-step dockerfile

# Fase iniziale
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build


# Fase finale
FROM nginx

# Copio sul risultato di "npm run build" deployato in /app/build nella cartella del server nginx
COPY --from=builder /app/build /usr/share/nginx/html