local X = {}

function X.kimbox()
    require 'ui.colors.themes.kimmy'.setup{}
end

function X.gruvbox()
    require 'ui.colors.themes.gruvbox'.config()
end

function X.osaka()
    require 'ui.colors.themes.osaka'.setup{}
end

return X
