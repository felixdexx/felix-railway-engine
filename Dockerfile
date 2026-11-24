FROM node:22-slim
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev \
 && npx playwright install --with-deps chromium \
 && rm -rf /var/lib/apt/lists/*
COPY src ./src
ENV NODE_ENV=production
CMD ["node", "src/index.js"]
