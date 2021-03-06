local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
	}

  if server.name == "html" then
	  local html_opts = require("plugins.lsp.settings.html")
	  opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server.name == "sumneko_lua" then
	  local lua_opts = require("plugins.lsp.settings.sumneko_lua")
	  opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  if server.name == "emmet_ls" then
	  local emmet_opts = require("plugins.lsp.settings.emmet_ls")
	  opts = vim.tbl_deep_extend("force", emmet_opts, opts)
  end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
