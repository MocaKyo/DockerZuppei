FROM evoapicloud/evolution-api:v2.2.3

# Sobrescrever o .env embutido com valores placeholder
# As env vars reais virao do Render em runtime e terao prioridade
RUN echo 'DATABASE_PROVIDER=postgresql' > /evolution/.env && \
    echo 'DATABASE_CONNECTION_URI=placeholder' >> /evolution/.env && \
    echo 'DATABASE_URL=placeholder' >> /evolution/.env

# Volume para persistir instancias do WhatsApp entre deploys
RUN mkdir -p /evolution/instances
VOLUME ["/evolution/instances"]

EXPOSE 8080

# Usar o start:prod oficial que roda db:deploy + server
CMD ["sh", "-c", "cd /evolution && npm run db:deploy && node dist/main.js"]
