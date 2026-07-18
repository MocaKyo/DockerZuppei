FROM evoapicloud/evolution-api:v2.2.3

RUN mkdir -p /evolution/instances
VOLUME ["/evolution/instances"]

EXPOSE 8080

# Esvaziar o .env embutido em RUNTIME (nao em build) pra que dotenv.config() nao sobrescreva as env vars do Render
# DATABASE_PROVIDER vem do ambiente do Render (env var configurada la)
CMD ["sh", "-c", "echo '' > /evolution/.env && cd /evolution && npm run db:deploy && node dist/main.js"]
