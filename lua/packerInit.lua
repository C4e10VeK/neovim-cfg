local noerr, packer = pcall(require, 'packer')

if not noerr then
    local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    end

    vim.api.nvim_exec(
        [[
            augroup Packer
                autocmd!
                autocmd BufWritePost init.lua PackerCompile
            augroup end
        ]],
        false
    )

    noerr, packer = pcall(require, 'packer')

    if noerr then
        print('Packer installed')
    else
        error("Packer doesn't installed! Path: " .. install_path)
    end

end

return packer.init{
    auto_clean = true,
    compile_on_sync = true
}