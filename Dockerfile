FROM evoapicloud/evolution-api:v2.2.3

# Remover o .env embutido para que as env vars do Render sejam usadas pelo Prisma/dotenv
RUN rm -f /evolution/.env && touch /evolution/.env.empty

# Volume para persistir instancias do WhatsApp entre deploys
RUN mkdir -p /evolution/instances
VOLUME ["/evolution/instances"]

# Render injeta $PORT
EXPOSE 8080

# Usar o start:prod oficial que roda db:deploy + server
CMD ["sh", "-c", "cd /evolution && npm run db:deploy && node dist/main.js"]
