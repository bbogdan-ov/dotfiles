local list = require "plugins.list"

---@class MyPlugin : LazyPluginSpec
---@field config? fun(self:LazyPlugin, opts:table) | true | string
---@field deps? string | string[] | LazyPluginSpec[]

for _, plugin in ipairs(list) do
	local plugin_conf = plugin.config

	if type(plugin.deps) == "table" then
		plugin.dependencies = plugin.deps
		plugin.deps = nil
	end
	if type(plugin_conf) == "string" then
		plugin.config = function()
			local is_ok, err = pcall(require, "plugins.configs." .. plugin_conf)

			if not is_ok then
				local is_abs_ok, module = pcall(require, plugin_conf)

				if is_abs_ok then
					module.setup {}
				else
					local msg = string.format(
						'Cannot load plugin config "%s"!\n\nFIRST ATTEMPT ERROR:\n%s;\n\nSECOND ATTEMPT ERROR:\n%s',
						plugin_conf, err, module
					)
					vim.api.nvim_err_writeln(msg)
				end
			end
		end
	end
end

require("lazy").setup(list, {
	dev = {
		path = "~/projects/nvim"
	}
})

