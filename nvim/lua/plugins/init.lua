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
			local is_ok, _ = pcall(require, "plugins.configs." .. plugin_conf)

			if not is_ok then
				-- TODO: catch missing module
				require(plugin_conf).setup {}
			end
		end
	end
end

require("lazy").setup(list, {
	dev = {
		path = "/mnt/Data/projects/nvim"
	}
})

