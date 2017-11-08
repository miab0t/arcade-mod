-- Arcade Mod by miab0t
-- Special thanks to Karmatized for help with the ramdomization
-- This package started as addendem to the Home Decor Mod written by VanessaEcode 
-- Sound files by: 
-- cmusounddesign https://www.freesound.org/people/cmusounddesign/sounds/84710/ cropped for the game machines



local modpath = minetest.get_modpath("arcade")

arcade = {
	modpath = modpath,

	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,

	expect_infinite_stacks = minetest.setting_getbool("creative_mode") and not minetest.get_modpath("unified_inventory")
}
dofile(modpath.."/coingame.lua")
dofile(modpath.."/clawgame.lua")
dofile(modpath.."/handlers/init.lua")
print("[arcade] " .. moremachines.gettext("Loaded!"))
