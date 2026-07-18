FROM evoapicloud/evolution-api:v2.2.3

# Render injeta PORT e RENDER_EXTERNAL_URL em runtime, nao em build.
# Nao definimos aqui — esses valores sao passados via Environment Variables no dashboard do Render.
# A Evolution API le SERVER_PORT e SERVER_URL do ambiente automaticamente.

# Volume para persistir instancias do WhatsApp entre deploys
RUN mkdir -p /evolution/instances
VOLUME ["/evolution/instances"]

# Render injeta $PORT — precisamos expor a porta dinamica
EXPOSE 8080

# O entrypoint da imagem oficial ja inicia a API
CMD ["node", "/evolution/server.js"]