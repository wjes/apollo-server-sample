FROM node:24-alpine
WORKDIR /app
COPY package.json pnpm-lock.yaml tsconfig.json ./
RUN mkdir src 
COPY src ./src
RUN ls -la && corepack enable && pnpm i
RUN pnpm run build
# ENV NODE_ENV=production
USER node
CMD ["node", "dist/index.js"]
