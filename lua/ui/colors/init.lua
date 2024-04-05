local X = {}

X.kimbox = {
    setup = require 'ui.colors.themes.kimmy'.setup
}

X.gruvbox = {
    setup = require 'ui.colors.themes.gruvbox'.config
}

X.osaka = {
    setup = require 'ui.colors.themes.osaka'.setup
}

return X
