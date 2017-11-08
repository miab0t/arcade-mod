local S = arcade.gettext


------ Clawgame Prizes List


local clawgameprize =  {"arcade:prize_0",
			"arcade:prize_1",
                        "arcade:prize_2", 
                        "arcade:prize_3", 
                        "arcade:prize_4", 
                        "arcade:prize_5",
                        "arcade:prize_6", 
                        "arcade:prize_7", 
                        "arcade:prize_8", 
                        "arcade:prize_9"                 
                        }
                        
                        local randomnumberfail =  {
                        1,
			2,
                        3, 
                        4, 
                        5, 
                        6,
                        7, 
                        8, 
                        9, 
                        10                 
                        }



----- Clawgame Machine

minetest.register_node("arcade:clawgame", {
	description = "Clawgame",
  drawtype = "mesh",
	mesh = "clawgame.obj",
  inventory_image = "clawgame_inv.png",
  paramtype = "light",
  light_source = 12,
  paramtype2 = "facedir",
  tiles = {"clawgame.png"},
  groups = {snappy=3},
  selection_box = {
		 type = "fixed",
     fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
	},
  collision_box = {
		 type = "fixed",
     fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
	},

	expand = { top="placeholder" }, 
	sounds = default.node_sound_glass_defaults(),
	on_rotate = screwdriver.rotate_simple,
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielditem = puncher:get_wielded_item()
		local wieldname = wielditem:get_name()
		local fdir_to_fwd = { {0, -1}, {-1, 0}, {0, 1}, {1, 0} }
		local fdir = node.param2
		local pos_drop = { x=pos.x+fdir_to_fwd[fdir+1][1], y=pos.y, z=pos.z+fdir_to_fwd[fdir+1][2] }
    
    if wieldname == "bitchange:minecoin" or 
       wieldname == "default:gold_lump" or 
       wieldname == "currency:minegeld" or
       wieldname == "currency:minegeld_5" or
       wieldname == "currency:minegeld_10" or
       wieldname == "mint:pences" or
       wieldname == "mint:shillings" or
       wieldname == "mint:pounds" or
       wieldname == "bitchange:mineninth" or
       wieldname == "homedecor:coin" or
       wieldname == "moremachines:dollar"
      then
      wielditem:take_item()
			puncher:set_wielded_item(wielditem)
      local clawgameprizes = clawgameprize
      local RndChoice = clawgameprizes[math.random( #clawgameprizes )]

if RndChoice == "arcade:prize_0" then
-- Dont give them shit

	minetest.chat_send_player(puncher:get_player_name(), ("You lost."))
else

      local numberfail = randomnumberfail
      local failnumber = randomnumberfail[math.random( #numberfail )]


if failnumber >=9   then



	minetest.chat_send_player(puncher:get_player_name(), ("You won a prize!"))
			minetest.spawn_item(pos_drop, RndChoice)
			minetest.sound_play("claw_machine", {
				pos=pos, max_hear_distance = 5
			})
			
			else
				minetest.chat_send_player(puncher:get_player_name(), ("You lost."))
			end
			
end

		else
			minetest.chat_send_player(puncher:get_player_name(), ("Please insert $1 in the machine."))
		end
	end
})


------ Register Prizes



minetest.register_node("arcade:prize_1", {
	description = "Claw Game Prize 1",
        drawtype = "signlike",
        tiles = {"prize_1.png"},
	inventory_image = "prize_1.png",
        wield_image = "prize_1.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_2", {
	description = "Claw Game Prize 2",
        drawtype = "signlike",
        tiles = {"prize_2.png"},
	inventory_image = "prize_2.png",
        wield_image = "prize_2.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_3", {
	description = "Claw Game Prize 3",
        drawtype = "signlike",
        tiles = {"prize_3.png"},
	inventory_image = "prize_3.png",
        wield_image = "prize_3.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_4", {
	description = "Claw Game Prize 4",
        drawtype = "signlike",
        tiles = {"prize_4.png"},
	inventory_image = "prize_4.png",
        wield_image = "prize_4.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_5", {
	description = "Claw Game Prize 5",
        drawtype = "signlike",
        tiles = {"prize_5.png"},
	inventory_image = "prize_5.png",
        wield_image = "prize_5.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_6", {
	description = "Claw Game Prize 6",
        drawtype = "signlike",
        tiles = {"prize_6.png"},
	inventory_image = "prize_6.png",
        wield_image = "prize_6.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_7", {
	description = "Claw Game Prize 7",
        drawtype = "signlike",
        tiles = {"prize_7.png"},
	inventory_image = "prize_7.png",
        wield_image = "prize_7.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("arcade:prize_8", {
	description = "Claw Game Prize 8",
        drawtype = "signlike",
        tiles = {"prize_8.png"},
	inventory_image = "prize_8.png",
        wield_image = "prize_8.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})


minetest.register_node("arcade:prize_9", {
	description = "Claw Game Prize 9",
        drawtype = "signlike",
        tiles = {"prize_9.png"},
	inventory_image = "prize_9.png",
        wield_image = "prize_9.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
        walkable = false,
	groups = {oddly_breakable_by_hand=2},
	selection_box = {type = "wallmounted"},
	sounds = default.node_sound_wood_defaults()
})
