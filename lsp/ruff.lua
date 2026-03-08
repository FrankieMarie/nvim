-- Disable hover from ruff (basedpyright handles it)
return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
