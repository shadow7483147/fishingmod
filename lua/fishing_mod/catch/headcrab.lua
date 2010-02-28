local size = 10
local rareness = 700
local yank = 500
local force = 0
local mindepth = 200
local maxdepth = 20000
local remove_on_release = false
local expgain = 100
local levelrequired = 7
local value = 100
local bait = {
	"models/props/cs_office/Snowman_head.mdl",
	"models/Gibs/HGIBS.mdl",
}

fishingmod.AddCatch{
	friendly = "Normal Headcrab",
	type = "npc_headcrab",
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	value = value,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
}

fishingmod.AddCatch{
	friendly = "Black Headcrab",
	type = "npc_headcrab_black",
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
	value = value,
}

fishingmod.AddCatch{
	friendly = "Fast Headcrab",
	type = "npc_headcrab_fast",
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
	value = value,
}

fishingmod.AddCatch{
	friendly = "Dead Normal Headcrab",
	type = "prop_ragdoll",
	models = {"models/headcrabclassic.mdl"},
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
	value = value,
}

fishingmod.AddCatch{
	friendly = "Dead Black Headcrab",
	type = "prop_ragdoll",
	models = {"models/headcrabblack.mdl"},
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
	value = value,
}

fishingmod.AddCatch{
	friendly = "Dead Fast Headcrab",
	models = {"models/headcrab.mdl"},
	size = size,
	rareness = rareness, 
	yank = yank, 
	mindepth = mindepth, 
	maxdepth = maxdepth,
	expgain = expgain,
	levelrequired = levelrequired,
	remove_on_release = remove_on_release,
	bait = bait,
	value = value,
}