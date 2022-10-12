local err, presence = pcall(require, 'presence')

if not err then
    return
end

presence:setup({
    buttons = false,
    neovim_image_text = "Baka Извращюгу",
    main_image = "neovim",

    workspace_text = "Пилю - %s peepoDown",
    editing_text = "Ну смотри сюда"
})
