freeslot("S_NOTSOAP_UPPERCUT","S_NOTTAKIS_HAMMER","S_NOTTAKIS_BOUNCE")

states[S_NOTSOAP_UPPERCUT] = {
  sprite = SPR_PLAY,
  frame = SPR2_FIRE,
  tics = 1,
  nextstate = S_NOTSOAP_UPPERCUT
}

states[S_NOTTAKIS_HAMMER] = {
  sprite = SPR_PLAY,
  frame = SPR2_BNCE,
  tics = 2,
  nextstate = S_NOTTAKIS_HAMMER
}

states[S_NOTTAKIS_BOUNCE] = {
  sprite = SPR_PLAY,
  frame = SPR2_MLEE,
  tics = 2,
  nextstate = S_NOTTAKIS_BOUNCE
}

addHook("GameQuit",function(goodbye)
	if not goodbye then return end
	print("THANK YE FOR PLAYING NOT SOAP AND NOT TAKIS BY ANGRYSONICS!")
	print("STAY TUNED FOR MORE BUILDS!!!!!!")
end)