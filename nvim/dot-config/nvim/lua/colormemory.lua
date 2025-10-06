local M = {}

local file_path = vim.fn.stdpath('data') .. '/colorscheme.txt'

local is_setting = false
function set_scheme(scheme, bg) 
    is_setting = true
    vim.cmd.colorscheme(scheme)
    vim.o.background = bg
    is_setting = false
end

function M.save() 
    local file = io.open(file_path, 'w') 
    if file then
        file:write(vim.g.colors_name .. '\n' .. vim.o.background)
        file:close()
    end
end

function M.load()
    local file = io.open(file_path, 'r')
    if file then
        local scheme = file:read('*line')
        local bg = file:read('*line')
        file:close()
        set_scheme(scheme, bg)
    else
        error('failed to load!')
    end
end

function M.setup(fallback_scheme, fallback_bg)

    -- attempt to load colorscheme if there is one saved
    status, err = pcall(M.load)
    if err then
        -- no scheme saved, set the fallback and save it
        set_scheme(fallback_scheme, fallback_bg)
        M.save()
    end

    -- watch the colorscheme file for changes
    fs_event = vim.loop.new_fs_event()
    fs_event:start(file_path, {}, vim.schedule_wrap(function()
        if not is_setting then
            M.load()
        end
    end))

    -- autocmd to trigger saving colorscheme when scheme is changed
    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function(args)
            if not is_setting then
                M.save(args.match)
            end
        end
    }) 
    
    -- autocmd to trigger saving colorscheme when background is changed
    vim.api.nvim_create_autocmd('OptionSet', {
        pattern = 'background',
        callback = function(args)
            if not is_setting then
                M.save()
            end
        end
    }) 
end

return M
