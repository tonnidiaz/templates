import { THook } from "../@types/common.types"
import { sleep } from "@/utils/methods"

export const authHook : THook  = async (req  , res)=>{
    console.log('Auth middleware')
}