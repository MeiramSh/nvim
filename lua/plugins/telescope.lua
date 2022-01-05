local function readOnly(t)
    local proxy = {}
    local mt = { -- create metatable
        __index = t,
        __newindex = function(_, _, _)
            error('attempt to update a read-only table', 2)
        end,
    }
    setmetatable(proxy, mt)
    return proxy
end

local telescope = Require 'telescope'
local builtin = Require 'telescope.builtin' -- Maybe

telescope.setup {
    defaults = { file_ignore_patterns = { 'node_modules', '.git' } },
}

local files_search_dirs = {
    '$HOME/Dev', '$HOME/.config/nvim', '$HOME/.config/alacritty',
}

Find = readOnly {
    files = function()
        builtin.find_files({ hidden = true, search_dirs = files_search_dirs })
    end,
    live_grep = function()
        builtin.live_grep { search_dirs = files_search_dirs }
    end,
    buffers = function() builtin.buffers() end,
    help_tags = function() builtin.help_tags() end,
}

telescope.load_extension('fzf')

Cmd [[
nnoremap <space>ff <cmd>lua Find.files()<cr>
nnoremap <space>fg <cmd>lua Find.live_grep()<cr>
nnoremap <space>fb <cmd>lua Require('telescope.builtin').buffers()<cr>
nnoremap <space>fh <cmd>lua Require('telescope.builtin').help_tags()<cr>
]]

