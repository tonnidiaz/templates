const SITE = "Tunedbass"
const __DEV__ = process.env.NODE_ENV == 'development'
const ROOT = __DEV__ ?  'http://localhost:3000' : 'https://tstreamz.vercel.app'
export const EMAIL = "tonnidiazed@gmail.com"
export const DEVELOPER = "Tonni Diaz"
export const SITE_SLOGAN = "A Tunedbass site"
export { SITE, __DEV__, ROOT}