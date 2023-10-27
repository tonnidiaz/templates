import fastify from "fastify";
export {}
declare module 'fastify' {
     interface FastifyInstance{
    }
      interface FastifyRequest {
        user: string | null
    }
  }

