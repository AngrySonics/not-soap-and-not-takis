local MIN_SUBVERSION = 15
freeslot("sfx_ohhoh")
if MODID == 18 // only check version for vanilla SRB2, you're on your own if you're using an exe mod
and SUBVERSION < MIN_SUBVERSION
	S_StartSound(nil, sfx_ohhoh)
	print("update your version to v2.2.15 please, your experience will suffer horribly as a result of not updating")
	dofile("LoadScripts.lua")
else
	S_StartSound(nil, sfx_ohhoh)
	print("loading the best mod ever")
	dofile("LoadScripts.lua")
end