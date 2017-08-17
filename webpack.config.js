module: {
    loaders: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'react-hot!babel?plugins[]=react-require'
    }, {
        test: /\.css$/,
        loader: 'style!css!autoprefixer?browsers=last 2 versions'
    }]
}