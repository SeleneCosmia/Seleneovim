vim.filetype.add({
    pattern = {
        ['.*/hyprland%.conf'] = 'hyprlang',
        ['.*/hypr%.d/.*%.conf'] = 'hyprlang',
    },
})
