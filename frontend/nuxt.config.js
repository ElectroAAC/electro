export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Electro - AAC',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'keywords', content: 'ElectroAAC, Electro AAC, AAC, Electro, opentibia' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'A free and open-source Automatic Account Creator (AAC) written in Javascript Stack;' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.png' }],
  },

  env: {
    version: process.env.VERSION || 'development'
  },
  
  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    `@/assets/css/${process.env.LAYOUT}.css`,
    '@/assets/css/main.css',
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '@plugins/accessor',
    '@plugins/axios'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: [
    {
      path: '@/components/',
      pathPrefix: false
    }
  ],

  device: {
    refreshOnResize: true
  },

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    '@nuxt/typescript-build',
    // https://vuetifyjs.com/en/getting-started/installation/#nuxt-install
    '@nuxtjs/vuetify',
    // https://github.com/nuxt-community/router-module
    [
      '@nuxtjs/router',
      {
        fileName: "nuxt.router.js"
      }
    ],
    '@nuxtjs/dotenv',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    // https://www.npmjs.com/package/cookie-universal-nuxt
    'cookie-universal-nuxt',
    // https://www.npmjs.com/package/@nuxtjs/toast
    '@nuxtjs/toast',
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
    baseURL: 'http://localhost:3333/',
  },

  render: { fallback: false },

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/scss/variables.scss'],
    icons: {
      iconfont: 'mdi'
    },
    theme: {
      dark: false,
      themes: {
        light: {
          primary: '#dd163b',
        }
      }
    }
  },

  toast: {
    position: 'top-right',
    keepOnHover: true,
    duration: 3000,
    theme: "bubble",
    singleton: true,
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    extractCSS: true,
    loaders:  {
      vue: {
        prettify: false
      }
    },
  },

  router: {
    base: process.env.ROUTE || '/'
  },
  
  ssr: true
}
