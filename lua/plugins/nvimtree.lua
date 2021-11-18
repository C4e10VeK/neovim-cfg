local noerr, nvimTree = pcall(require, 'nvim-tree')

if not (noerr) then
    return
end


nvimTree.setup{}

