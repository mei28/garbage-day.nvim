local M = {}

---Parse user options, or set the defaults.
function M.set(opts)
  M.grace_period = opts.grace_period or (60*15) -- seconds
  M.excluded_lsp_clients = opts.excluded_lsp_clients or { "null-ls", "jdtls" }
  M.stop_invisible = opts.stop_invisible or false
  M.notifications = opts.notifications or false
end

return M

