import { FastifyPluginAsync } from "fastify";
import { PostsService } from "./posts.service";
import { authHook } from "@/hooks/auth.hook";

 const router : FastifyPluginAsync =  async (fastify, opts) =>{

    fastify.get("/",  (req , res)=>{
        return PostsService.getPosts()
    })

    fastify.get<{
        Params: {id: number}
    }>("/:id", {
        preHandler:authHook}, (req, res)=>{
        const { id } = req.params;
        const  post = PostsService.getPost(id)
        if (!post) return res.code(400).send("POST NOT FOUND")
        return post
    })
}
export default router