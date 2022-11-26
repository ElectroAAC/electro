import Env from '@ioc:Adonis/Core/Env'

export default Env.rules({
  HOST: Env.schema.string({ format: 'host' }),
  PORT: Env.schema.number(),
  APP_KEY: Env.schema.string(),
  APP_NAME: Env.schema.string(),
  DRIVE_DISK: Env.schema.enum(['local'] as const),
  NODE_ENV: Env.schema.enum(['development', 'production', 'testing'] as const),
  
  DB_CONNECTION: Env.schema.string(),

  MYSQL_HOST: Env.schema.string({ format: 'host' }),
  MYSQL_PORT: Env.schema.number(),
  MYSQL_USER: Env.schema.string(),
  MYSQL_PASSWORD: Env.schema.string.optional(),
  MYSQL_DB_NAME: Env.schema.string(),

  SMTP_HOST: Env.schema.string({ format: 'host' }),
  SMTP_PORT: Env.schema.number(),
  SMTP_USERNAME: Env.schema.string(),
  SMTP_PASSWORD: Env.schema.string(),

  CHARACTERS_PER_ACCOUNT: Env.schema.number(),
  CHANGE_NAME: Env.schema.boolean(),
  POINTS_TO_CHANGE_NAME: Env.schema.number(),

  PIX_CLIENT_ID: Env.schema.string(),
  PIX_CLIENT_SECRET: Env.schema.string(),
  PIX_ENDPOINT: Env.schema.string(),
  PIX_CERT: Env.schema.string(),
  PIX_TIME_EXPIRATION: Env.schema.number(),
  PIX_KEY: Env.schema.string(),
  PIX_MESSAGE_ON_BILLING: Env.schema.string()
})
