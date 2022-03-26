Config_path = vim.fn.stdpath('config')
function Log(arg) print(vim.inspect(arg)) end
function Map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do t[k] = f(v) end
    return t
end

function Replace_module(old, new)
    Require(old)
    package.loaded[old] = Require(new)
end

Require = function(arg)
    if pcall(require, arg) then
        return require(arg)
    else
        error('Very bad ' .. arg)
    end
end

Cmd = vim.cmd
Join_paths = Require'packer.util'.join_paths

Cmd('set packpath+=' .. Join_paths(Config_path, 'plugins', 'beta', 'packer'))
Cmd('source ' .. Join_paths(Config_path, 'config.vim'))
vim.o.cursorline = true
vim.o.shiftwidth = 4
vim.o.tabstop = vim.o.shiftwidth
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
-- local old = vim.o.runtimepath
-- vim.o.runtimepath = old .. ',' .. Config_path .. '/lua'

Require 'installations'
Require 'import-plugins'
