local status_ok, leap = pcall(require, "leap")
if not status_ok then
    return
end

-- Example config: https://github.com/kohane27/nvim-config/blob/main/lua/plugins/leap.lua

leap.set_default_keymaps(true)

