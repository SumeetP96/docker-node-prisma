FROM node:18

RUN npm install -g pnpm

WORKDIR /usr/src/app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

RUN mkdir -p prisma
COPY prisma/schema.prisma ./prisma/
RUN pnpx prisma generate

COPY . .

EXPOSE 8080
CMD [ "pnpm", "start" ]