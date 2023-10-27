import { Server } from "socket.io";

export const io = new Server()
io.on("connect", client=>{
    console.log(`${client.id} CONNECTED`)
})