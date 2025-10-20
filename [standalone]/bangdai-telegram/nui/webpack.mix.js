const mix = require('laravel-mix');
const path = require('path');

mix.js('src/app.js', 'dist')
    .vue({
        version: 3,
        options: {
            compilerOptions: {
                isCustomElement: tag => tag.startsWith('nui-')
            }
        }
    })
    .sass('src/app.scss', 'dist')
    .copy('src/assets/fonts', 'dist/assets/fonts')
    .copy('src/assets/img', 'dist/assets/img')
    .copy('src/assets/audio', 'dist/assets/audio')
    .tailwind('./tailwind.config.js')
    .webpackConfig({
        resolve: {
            alias: {
                '@': path.resolve(__dirname, 'src')
            },
            extensions: ['.js', '.vue', '.json']
        },
        devServer: {
            static: {
                directory: path.join(__dirname, 'dist'),
            },
            hot: true,
            compress: true,
            port: 3001,
            headers: {
                'Access-Control-Allow-Origin': '*'
            }
        }
    })
    .sourceMaps();

// Development specific configuration
if (!mix.inProduction()) {
    mix.webpackConfig({
        devtool: 'source-map'
    });

    // Enable hot reloading
    mix.options({
        hmrOptions: {
            host: 'localhost',
            port: 3001
        }
    });
}