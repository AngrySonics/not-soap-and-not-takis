local UNCURL_LOCKTIME = 8

COM_AddCommand("notsoap_uncurltoggle", function(player, value)
	if not(player and player.valid and player.mo)
		CONS_Printf(player,"GO TO A LEVEL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		return
	end
	if value == "0" or value == "no" or value == "off"
		player.uncurltoggle = 0
		CONS_Printf(player,"You can now release spin to uncurl.")
	elseif value == "1" or value == "yes" or value == "on"
		player.uncurltoggle = 1
		CONS_Printf(player,"You can now re-press spin to uncurl.")
	else
		if player.uncurltoggle == 1
			CONS_Printf(player,"uncurltoggle is on. Default is on.")
		else
			CONS_Printf(player,"uncurltoggle is off. Default is on.")
		end
	end
end,0)

addHook("ThinkFrame", function(player)
	for player in players.iterate()
		//Init
		if player.init == nil
			player.init = true
			player.prevbuttons = player.cmd.buttons
			if player.uncurltoggle == nil player.uncurltoggle = 1 end
			return
		end
		
		if player.mo and player.mo and player.mo.valid and player.mo.skin == "notsoap" and player.playerstate == PST_LIVE and not player.exiting and not player.powers[pw_nocontrol] and not P_PlayerInPain(player)
			local pbtn = player.prevbuttons
			local btn = player.cmd.buttons
			local mo = player.mo
			
			//print(mo.uncurl_lock)
			//print(mo.will_uncurl)
			//Uncurl
			if mo.state == S_PLAY_ROLL and P_IsObjectOnGround(mo)
				local uncurlinput = false
				local recurlinput = false
				if player.uncurltoggle == 1
					uncurlinput = (btn & BT_USE) and not (pbtn & BT_USE)
				else
					uncurlinput = (pbtn & BT_USE) and not (btn & BT_USE)
					recurlinput = (btn & BT_USE) and not (pbtn & BT_USE)
				end
				
				if mo.uncurl_lock == UNCURL_LOCKTIME and uncurlinput
					uncurlinput = false
				end
				
				if uncurlinput
					mo.will_uncurl = true
				end
				if recurlinput
					mo.will_uncurl = false
				end
				
				if mo.uncurl_lock
					mo.uncurl_lock = max(0, $ - 1)
					
				elseif mo.will_uncurl
					mo.uncurl_lock = UNCURL_LOCKTIME
					mo.uncurlready = false
					if FixedHypot(mo.momx, mo.momy) >= player.runspeed
						mo.state = S_PLAY_RUN
					else
						mo.state = S_PLAY_WALK
					end
					if player.pflags & PF_SPINNING
						player.pflags = $1 & ~PF_SPINNING
					end
					S_StopSoundByID(mo,sfx_spin)
				end
			else
				mo.uncurl_lock = UNCURL_LOCKTIME
				mo.will_uncurl = false
			end
			player.prevbuttons = btn
		end
	end
end)