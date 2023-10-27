import { FastifyRequest, FastifyReply, HookHandlerDoneFunction } from "fastify";

export type THook = (req: FastifyRequest,res: FastifyReply, done: HookHandlerDoneFunction) =>{}