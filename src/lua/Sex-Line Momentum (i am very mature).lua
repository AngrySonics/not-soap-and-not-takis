local gooningoption = CV_RegisterVar({
	name = "notsoap_momentum",
	defaultvalue = "On",
	PossibleValue = {Off = 0, On = 1,},
	flags = CV_NETVAR|CV_SHOWMODIF,
})
addHook("PlayerThink", function(player) // Make sure that it runs
	if (player and player.mo and player.mo.valid) then
		if (player.mo.skin == "notsoap") or (player.mo.skin == "nottakis") or (player.mo.skin == "shampoo") then
			if gooningoption.value == 1 then
				if not player.notsoapnottakiskartcompatidk then
					if FixedHypot(player.mo.momx, player.mo.momy) >= FixedMul(player.runspeed, player.mo.scale) // Check if the player is moving faster than their run (now scaled depending on their size)
						player.mo.friction = FRACUNIT // Make the momentum happen
					end
				end
			end
		end
	end // Finish this if statement
end) // Close this hook