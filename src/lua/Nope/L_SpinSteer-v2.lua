addHook("PlayerThink", function(p)
	if not (p and p.mo and p.mo.valid)
		return false
	end

	if (p.mo.skin == "notsoap") and (p.pflags & PF_SPINNING) and not (p.pflags & PF_STARTDASH) and P_IsObjectOnGround(p.mo)
		p.thrustfactor = skins[p.mo.skin].thrustfactor * 20
	else
		p.thrustfactor = skins[p.mo.skin].thrustfactor
	end
end)


-- addHook("MobjThinker", function(mo)
-- 	if mo.lastuse == nil
-- 		return
-- 	end
-- 	local player = mo.player
-- 	if (mo.skin == "notsoap")
-- 		if (mo.lastuse and not (player.cmd.buttons & BT_SPIN)) and mo.state == S_PLAY_ROLL and P_IsObjectOnGround(mo)
-- 			mo.state = S_PLAY_STND
-- 			if player.pflags & ~PF_SPINNING
-- 				player.pflags = $1 & ~PF_SPINNING
-- 			end
-- 		end
-- 	end
-- 	mo.lastuse = (player.cmd.buttons & BT_SPIN)
-- end, MT_PLAYER)

-- addHook("MobjSpawn", function(mo)
-- 	mo.lastuse = false
-- end, MT_PLAYER)