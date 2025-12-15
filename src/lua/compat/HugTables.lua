if not CFFC_Characters
    rawset(_G, "CFFC_Characters", {})
end
CFFC_Characters["notsoap"] = SKINCOLOR_RED
CFFC_Characters["nottakis"] = SKINCOLOR_SALMON
CFFC_Characters["shampoo"] = SKINCOLOR_RED

freeslot("spr2_panc","S_NOTSOAP_PANIC")
states[S_NOTSOAP_PANIC] = {SPR_PLAY, SPR2_PANC, 2, nil, 0, 0, S_NOTSOAP_PANIC}
rawset(_G, "Allhugs", {})
rawset(_G, "Hugbutton", {})
rawset(_G, "Heartbutton", {})
rawset(_G, "Hugsound", {})
rawset(_G, "Yelpsound", {})
rawset(_G, "Tailshug", {})
rawset(_G, "Hearticon", {})
rawset(_G, "Loveparticle", {})
rawset(_G, "InvalidState", {})

Allhugs["notsoap"] = true
Allhugs["nottakis"] = true
Allhugs["shampoo"] = true
Tailshug["nottakis"] = true

freeslot("sfx_syike")
sfxinfo[sfx_ohhoh].caption = "Oh-hoh, no!"
sfxinfo[sfx_syike].caption = "Yikes!"
Yelpsound["notsoap"] = sfx_ohhoh
Yelpsound["shampoo"] = sfx_syike
Hugsound["nottakis"] = sfx_ntwin1
Yelpsound["nottakis"] = sfx_ntkow2

if not(kirbyabilitytable)
    rawset(_G, "kirbyabilitytable", {})
end
kirbyabilitytable["notsoap"] = 8
kirbyabilitytable["nottakis"] = 9
kirbyabilitytable["shampoo"] = 11

local function IsPanicSprite(player) //i stole this from ntopp
	return (PTSR and PTSR.pizzatime)
		or (PizzaTime and PizzaTime.sync and PizzaTime.sync.PizzaTime)
end

addHook("PlayerThink", function(player) // Make sure that it runs
	if (player and player.mo and player.mo.valid) then
		if (player.mo.skin == "notsoap") or (player.mo.skin == "nottakis") or (player.mo.skin == "shampoo") then
			if IsPanicSprite(player)
			and P_IsObjectOnGround(player.mo) then
				if player.mo.momx == 0
				and player.mo.momy == 0
				and player.mo.state ~= S_NOTSOAP_PANIC then
					player.mo.state = S_NOTSOAP_PANIC
					player.panim = PA_IDLE
				elseif not (player.mo.momx == 0
				and player.mo.momy == 0)
				and player.mo.state == S_NOTSOAP_PANIC then
					player.mo.state = S_PLAY_STND
				end
			end
		end
	end
end)

addHook("MusicChange", function(old, new, ...)
    if not (displayplayer
    and displayplayer.mo
	and displayplayer.mo.valid
	and displayplayer.mo.health
    and displayplayer.mo.skin == "notsoap") then return end

    if new == "PIZTIM" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "_INTER" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "VSRSLT" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "DEAOLI" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "PIJORE" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "OTMUSA" then
        if old ~= "NSPT4" then
            return "NSPT4", ...
        else            
            return true
        end
    elseif new == "OTMUSB" then
        if old ~= "NSPT5" then
            return "NSPT5", ...
        else            
            return true
        end
    end
end)

addHook("MusicChange", function(old, new, ...)
    if not (displayplayer
    and displayplayer.mo
	and displayplayer.mo.valid
	and displayplayer.mo.health
    and displayplayer.mo.skin == "nottakis") then return end

    if new == "PIZTIM" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "_INTER" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "VSRSLT" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "DEAOLI" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "PIJORE" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "OTMUSA" then
        if old ~= "NSPT4" then
            return "NSPT4", ...
        else            
            return true
        end
    elseif new == "OTMUSB" then
        if old ~= "NSPT5" then
            return "NSPT5", ...
        else            
            return true
        end
    end
end)

addHook("MusicChange", function(old, new, ...)
    if not (displayplayer
    and displayplayer.mo
	and displayplayer.mo.valid
	and displayplayer.mo.health
    and displayplayer.mo.skin == "shampoo") then return end

    if new == "PIZTIM" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "_INTER" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "VSRSLT" then
        if old ~= "NSRSLT" then
            return "NSRSLT", ...
        else            
            return true
        end
    elseif new == "DEAOLI" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "PIJORE" then
        if old ~= "NSPT1" then
            return "NSPT1", ...
        else            
            return true
        end
    elseif new == "OTMUSA" then
        if old ~= "NSPT4" then
            return "NSPT4", ...
        else            
            return true
        end
    elseif new == "OTMUSB" then
        if old ~= "NSPT5" then
            return "NSPT5", ...
        else            
            return true
        end
    end
end)