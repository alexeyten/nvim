local nvim = {}

nvim.setup = function()
  -- load basic configuration
  local utils = require("core.utils")

  -- Try to call the cache plugin
  pcall(require, "impatient")

  for _, module_name in ipairs({
    "core.options",
    "core.autocmd",
    "core.keymap"
  }) do
    local ok, err = pcall(require, module_name)
    if not ok then
      local msg = "calling module: " .. module_name .. " fail: " .. err
      utils.errorL(msg)
    end
  end

  -- since we have packer compiled, we don't need to load this immediately
  vim.defer_fn(function()
    require("plugins").init()
  end, 0)
end

return nvim
