import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'

export default defineConfig(({ command }) => {
  const config = {
    plugins: [vue()],
    resolve: {
      alias: {
        '@': path.resolve(__dirname, 'src'),
        '@locales': path.resolve(__dirname, '../locales') // Alias untuk folder locales
      }
    },
    server: {
      fs: {
        allow: [
          path.resolve(__dirname, '../') // Allow akses ke parent directory
        ]
      }
    }
  }

  if (command === 'dev') {
    config.base = '/'
    config.server = {
        port: 3001,
        host: true,
        fs: {
            allow: ['..']  // Untuk akses file di luar src
        }
    }
    config.css = {
        postcss: {
            plugins: [
                {
                    postcssPlugin: 'internal:charset-removal',
                    AtRule: {
                        charset: (atRule) => {
                            if (atRule.name === 'charset') {
                                atRule.remove();
                            }
                        }
                    }
                }
            ]
        }
    }
  } else {
    config.base = './'
    config.build = {
      outDir: 'dist',
      assetsDir: 'assets',
      emptyOutDir: true,
      rollupOptions: {
        output: {
          assetFileNames: (assetInfo) => {
            if (/\.(mp3|wav|ogg)$/i.test(assetInfo.name)) {
              return `assets/audio/[name][extname]`
            }
            if (/\.(png|jpe?g|svg|gif|tiff|bmp|ico)$/i.test(assetInfo.name)) {
              return `assets/img/[name][extname]`
            }
            if (/\.(ttf|otf|eot|woff|woff2)$/i.test(assetInfo.name)) {
              return `assets/fonts/[name][extname]`
            }
            return `assets/[name][extname]`
          },
          chunkFileNames: 'assets/js/[name]-[hash].js',
          entryFileNames: 'assets/js/[name]-[hash].js'
        }
      }
    }
  }

  return config
})