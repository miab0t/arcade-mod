arcade = arcade or {}
local S = arcade.gettext
local placeholder_node = "arcade:expansion_placeholder"

function arcade.register(name, original_def)
	local def = table.copy(original_def)

	def.drawtype = def.drawtype
		or (def.mesh and "mesh")
		or (def.node_box and "nodebox")

	def.paramtype = def.paramtype or "light"

	if not (def.drawtype == "glasslike_framed"
		or def.drawtype == "raillike"
		or def.drawtype == "plantlike"
		or def.drawtype == "firelike") then

		def.paramtype2 = def.paramtype2 or "facedir"
	end

	arcade.handle_inventory(name, def, original_def)

	local infotext = def.infotext

	if infotext then
		local on_construct = def.on_construct
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", infotext)
			if on_construct then on_construct(pos) end
		end
	end

	minetest.register_node("arcade:" .. name, def)
end
