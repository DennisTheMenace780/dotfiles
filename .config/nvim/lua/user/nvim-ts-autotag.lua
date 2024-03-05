local status_ok, tsxpairs = pcall(require, "nvim-ts-autotag")
if not status_ok then
    return
end

tsxpairs.setup()
