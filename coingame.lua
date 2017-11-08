local S = arcade.gettext

------ coinpushgame Prizes List


local coinpushgameprize =  {"arcade:coinprize_0",
                        "homedecor:coin 10",
                        "homedecor:coin 5",
                        "homedecor:coin 25",
                        "homedecor:coin",
                        "homedecor:coin 50"
                        }
   
local randomnumberfail =  {
                        1,
			2,
                        3,
                        4,
                        5,
                        6
                        }


--Coinpush Game Machine
minetest.register_node("arcade:coinpushgame", {
	description = "Coin Game",
  drawtype = "mesh",
	mesh = "coinpush_machine.obj",
  inventory_image = "coinpush_machine_inv.png",
  paramtype = "light",
  light_source = 12,
  paramtype2 = "facedir",
  tiles = {"coinpush_machine.png"},
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
      local coinpushgameprizes = coinpushgameprize
      local RndChoice = coinpushgameprizes[math.random( #coinpushgameprizes )]

if RndChoice == "arcade:coinprize_0" then
-- Dont give them shit

	minetest.chat_send_player(puncher:get_player_name(), ("You lost."))
else

      local numberfail = randomnumberfail
      local failnumber = randomnumberfail[math.random( #numberfail )]


if failnumber >=5   then



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
