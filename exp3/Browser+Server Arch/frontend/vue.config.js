// CORS
module.exports = {
    devServer: {
      port: 8080, // Frontend port
      proxy: {
        '/api': { // Map backend api URL
          target: 'http://127.0.0.1:8081',
          changeOrigin: true, // Solve CORS
          pathRewrite: {
            '^/api': ''
          }
        }
      },
      public: '127.0.0.1:8080' // WDS config, for recompile-on-change
    },
    chainWebpack: config => {
      config
        .plugin('html')
        .tap(args => {
          args[0].title= 'SQLQuery - B/S'
          return args
        })
    }
  }
  