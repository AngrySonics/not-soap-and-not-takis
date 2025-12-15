local function Shampoo_Enemy_MobjDeath(mo, inflictor, source)
	if source and source.valid and source.player and source.skin == "shampoo" and source.player.dashmode >= 3*TICRATE and P_IsObjectOnGround(source) and not (source.player.pflags & PF_SPINNING) and source.player.playerstate ~= PST_DEAD then
		S_StartSound(source.mo, sfx_boomr)
		source.state = S_PLAY_SHAMPOO_BONK
	end
end
/*
╔════════════════════════════╗═════════════════════════════════════════════════════════════════════════════════#
║     	ACTUAL CODE		     ║  Below is the actual core you want to use. Keep your local functions above it!
╚════════════════════════════╝═════════════════════════════════════════════════════════════════════════════════#
Legend:
type = The object type number. So MT_PLAYER, MT_THOK, MT_RING, etc.
INFO = The mobjinfo field. Same as if you were accessing mo.info.
SemiGlobal = A local table keeping track of which objects got hooks assigned already. Prevent duplication!
*/
local SemiGlobal = {}
local function GSAddonLoad(_)
	for type = 1,max(1, (#mobjinfo)-1) local INFO=mobjinfo[type] if INFO==nil or (SemiGlobal[type]) continue end --
	
		--For all enemies, or some exceptions that don't have the flag, do this!
		if (INFO.flags & MF_ENEMY)
			SemiGlobal[type] = true --Adding this is crucial!
			addHook("MobjDeath", Shampoo_Enemy_MobjDeath, type)		
		end
	end
end

addHook("AddonLoaded", GSAddonLoad) --This hook makes sure to scan for new objects everytime a new mod is added.
GSAddonLoad(_) --Run the function once on initial load.

addHook("NetVars", function(network)
	SemiGlobal = network($) --Sync what's been added so far for netgame sanity.
end)