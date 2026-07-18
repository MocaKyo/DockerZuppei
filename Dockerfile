FROM evoapicloud/evolution-api:v2.2.3

# Remover o .env embutido da imagem para que as env vars do Render sejam usadas
RUN rm -f /evolution/.env

# Volume para persistir instancias do WhatsApp entre deploys
RUN mkdir -p /evolution/instances
VOLUME ["/evolution/instances"]

# Render injeta $PORT
EXPOSE 8080

# O entrypoint da imagem oficial ja inicia a API
CMD ["node", "/evolution/server.js"]
