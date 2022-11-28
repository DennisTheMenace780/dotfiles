local status_ok, buffer_manager = pcall(require, "buffer_manager")
if not status_ok then
    return
end


buffer_manager.setup({
  line_keys = "",  -- deactivate line keybindings
  select_menu_item_commands = {
    v = {
      key = "V",
      command = "vsplit"
    },
    h = {
      key = "H",
      command = "split"
    }
  }
})
