/datum/advclass/combat/dredge
	name = "Dredge"
	tutorial = "Peasants and nobles. Saints, sinners, madmen and thieves - who you once were is now irrelevant. \
	Cast from your home for what is undoubtedly a heinous act of violence, your travels have washed you up upon this \
	shiteheap. All you have are your possessions from your former life. Make some coin for yourself, lest you end up dead and gone."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	outfit = /datum/outfit/job/roguetown/adventurer/dredge
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 7
	min_pq = 0

/datum/outfit/job/roguetown/adventurer/dredge/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, pick (1,2), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, pick (1,2), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/knives, pick(0,0,0,0,0,1,1,1,1,2,), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/shields, pick(1,2,3), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/swimming, pick(0,1,2), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/climbing, pick(0,0,1,2,3), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/riding, pick(0,1,1,2), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/reading, pick(0,0,1), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/polearms, pick(0,0,0,0,0,0,0,1,1,1,1,2,), TRUE) // Weapon rolls include the relevant skill. Rolling 'expert' or 'master' should be rare.
	H.mind?.adjust_skillrank(/datum/skill/combat/swords, pick(0,0,0,0,0,0,0,1,1,1,1,2,), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/whipsflails, pick(0,0,0,0,0,0,0,1,1,1,1,2,), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, pick(0,0,0,0,0,0,0,1,1,1,1,2,), TRUE)

	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	pants = /obj/item/clothing/pants/tights/black
	backl = /obj/item/storage/backpack/satchel
	var/armortype = pickweight(list("Warrior" = 4, "Splint" = 4, "HeavyG" = 4, "Hide" = 3, "Jacket" = 3, "Sailor" = 3, "Peon" = 3, "Ironplate" = 2, "Freak" = 3, "Psy" = 2, "Destitute" = 2, "Berserker" = 2, "Copper" = 1, "Noble" = 1, "BKnight" = 1)) // Armor / Armortype roll. It varies heavily. The more gimmicky / best stuff is generally the rarest
	var/weapontype = pickweight(list("Axe" = 4, "BigAxe" = 3, "Mace" = 4, "Mage" = 1, "Shield" = 2, "BigMace" = 3, "Spear" = 3, "Messer" = 3, "LSword" = 3, "GSword" = 1, "Shovel" = 3, "Scythe" = 2, "Cutlass" = 3, "Falx" = 3, "Rapier" = 2, "Sword" = 4, "Sword2" = 3, "Flail" = 2, "Bow" = 1, "Fist" = 2, "Daggers" = 3, "MFlail" = 3, "Gun" = 1,)) // Weapon roll
	var/randomjob = pickweight (list("Farmer" = 3, "Sailor" = 2, "Pickpocket" = 2, "Smith" = 2, "Fisher" = 3, "Doctor" = 2, "Steppes" = 2, "Smart" = 1, "Grappler" = 1, "Lumber" = 2, "Guard" = 2, "Bard" = 2, "Paranoiac" = 1, "Alch" = 2, "Torturer" = 1,)) // 'Job' roll, gives small skill benefits
	var/randomperk = pickweight (list("Fat" = 3, "Normal" = 3, "Smartish" = 3, "Speedy" = 3, "Lucky" = 3, "Abyssor" = 2, "Packrat" = 2, "Strong" = 1, "Zizo" = 2, "Atheist" = 1, "Graggar" = 1, "Stupid" = 1, "Lockpicks" = 2, "Traps" = 2, "Ring" = 2, "Knives" = 2, "Heel" = 1, "Meek" = 2, "Invisible" = 2, "Zigs" = 2, "Ozium" = 2, "Bomb" = 1,)) // A random trait or a couple of items
	switch(armortype)
		if("Warrior")
			armor = /obj/item/clothing/armor/chainmail/iron
			shirt = /obj/item/clothing/armor/gambeson
			gloves = /obj/item/clothing/gloves/leather
			pants = /obj/item/clothing/pants/tights/uncolored
			head = /obj/item/clothing/head/roguehood
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I am a sellsword. A greenhorn, but a sellsword nonetheless.")
			)
		if("Ironplate")
			armor = /obj/item/clothing/armor/cuirass/iron
			shirt = /obj/item/clothing/armor/gambeson/heavy
			neck = /obj/item/clothing/neck/gorget
			pants = /obj/item/clothing/pants/tights/black
			head = /obj/item/clothing/head/roguehood
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_END, -1)
			H.change_stat(STATKEY_STR, -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I am a sellsword by trade. I've held a weapon in my hand for longer than I can remember.")
			)
		if("Splint")
			armor = /obj/item/clothing/armor/leather/splint
			shirt = /obj/item/clothing/shirt/tunic/black
			wrists = /obj/item/clothing/wrists/bracers/leather
			pants = /obj/item/clothing/pants/tights/uncolored
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.change_stat(STATKEY_END, 1)
			to_chat(H,span_info("\
			I am a sellsword. Heavier armors do not suit my line of work.")
			)
		if("Jacket")
			armor = /obj/item/clothing/armor/leather/vest/winterjacket
			neck = /obj/item/clothing/neck/coif
			shirt = /obj/item/clothing/shirt/tunic/red
			wrists = /obj/item/clothing/wrists/bracers/leather
			gloves = /obj/item/clothing/gloves/angle
			head = /obj/item/clothing/head/roguehood
			pants = /obj/item/clothing/pants/trou/leather
			H.change_stat(STATKEY_LCK, 1)
			H.change_stat(STATKEY_SPD, 1)
			H.change_stat(STATKEY_CON, -1)
			H.change_stat(STATKEY_STR, -1)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'm a stone-cold motherfucker, nothing fazes me anymore.")
			)
		if("Sailor")
			armor = /obj/item/clothing/armor/leather/jacket/sea
			shirt = /obj/item/clothing/shirt/tunic/red
			head = /obj/item/clothing/head/helmet/leather/headscarf
			mask = /obj/item/clothing/face/shepherd/clothmask
			pants = /obj/item/clothing/pants/tights/sailor
			H.change_stat(STATKEY_LCK, 1)
			H.change_stat(STATKEY_SPD, 2)
			H.change_stat(STATKEY_CON, -1)
			H.change_stat(STATKEY_STR, -2)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'm used to the wooden floorboards of ships. Long stretches of road grant me boundless energy.")
			)
		if("HeavyG")
			shirt = /obj/item/clothing/armor/gambeson/heavy
			neck = /obj/item/clothing/neck/chaincoif/iron
			gloves = /obj/item/clothing/gloves/leather/advanced
			wrists = /obj/item/clothing/wrists/bracers/leather
			pants = /obj/item/clothing/pants/trou/leather
			H.change_stat(STATKEY_STR, -1)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'm light on my feet, I dare somebody try and hit me.")
			)
		if("Peon")
			head = /obj/item/clothing/head/armingcap
			shirt = /obj/item/clothing/shirt/undershirt/random
			armor = /obj/item/clothing/armor/gambeson/light/striped
			gloves = /obj/item/clothing/gloves/leather/advanced
			wrists = /obj/item/clothing/wrists/bracers/leather
			pants = /obj/item/clothing/pants/trou/leather
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_SPD, -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'm just a humble peasant. My upbringing has left me ill-equipped for the journey ahead, but sturdier than most.")
			)
		if("Berserker")
			head = /obj/item/clothing/head/helmet/leather/headscarf
			gloves = /obj/item/clothing/gloves/leather/advanced
			wrists = /obj/item/clothing/wrists/bracers/leather
			pants = /obj/item/clothing/pants/tights/black
			H.change_stat(STATKEY_STR, -2)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_SPD, 1)
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			to_chat(H,span_info("\
			Like a raging current, I am unrelenting. My attacks will chip at my enemy until their skin sloughs, and their bones litter the dry, sandy shores.")
			)
		if("Psy")
			neck = /obj/item/clothing/neck/psycross
			head = /obj/item/clothing/head/brimmed
			shirt = /obj/item/clothing/shirt/undershirt/puritan
			gloves = /obj/item/clothing/gloves/leather/advanced
			wrists = /obj/item/clothing/wrists/bracers/leather
			armor = /obj/item/clothing/armor/leather/vest
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			pants = /obj/item/clothing/pants/tights/black
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			if(!H.has_language(/datum/language/oldpsydonic))
				H.grant_language(/datum/language/oldpsydonic)
				to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")
			H.set_patron(/datum/patron/psydon)
			to_chat(H,span_info("\
			The Ten are false gods, and I loathe those that worship the true corpse god, Necra. Psydon lives, my life for Psydon.")
			)
		if("Hide")
			shirt = /obj/item/clothing/shirt/undershirt/uncolored
			armor = /obj/item/clothing/armor/leather/hide
			cloak = /obj/item/clothing/cloak/raincloak/brown
			gloves = /obj/item/clothing/gloves/leather/advanced
			pants = /obj/item/clothing/pants/tights/black
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			H.change_stat(STATKEY_SPD, 1)
			H.change_stat(STATKEY_CON, 1)
			to_chat(H,span_info("\
			Dendor provides. The only armor I need are hides taken from the backs of his beasts.")
			)
		if("Freak")
			head = /obj/item/clothing/head/menacing
			neck = /obj/item/clothing/neck/chaincoif/iron
			pants = /obj/item/clothing/pants/tights/black
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_INT, -2)
			H.change_stat(STATKEY_SPD, -2)
			to_chat(H,span_info("\
			I like the pain. My calloused hide protects me from critical strikes.")
			)
		if("Destitute") // Fuck you, die. Welcome to Heartcrit. Dark souls challenge run.
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
			neck = /obj/item/clothing/neck/gorget
			mask = /obj/item/clothing/face/facemask
			pants = /obj/item/clothing/pants/loincloth/black
			H.change_stat(STATKEY_CON, -2)
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_END, -2)
			H.change_stat(STATKEY_INT, -3)
			H.change_stat(STATKEY_PER, -2)
			H.change_stat(STATKEY_SPD, 2)
			H.change_stat(STATKEY_LCK, -1)
			to_chat(H,span_info("\
			God won't let me die. My life is a momentary lapse of reason. All will fall to ruin, even me.")
			)
		if("Noble") // Congratulations, you're important! Or were, rather.
			armor = /obj/item/clothing/armor/cuirass/iron
			shirt = /obj/item/clothing/shirt/tunic/ucolored
			cloak = /obj/item/clothing/cloak/raincloak/furcloak
			pants = /obj/item/clothing/pants/tights/black
			neck = /obj/item/clothing/neck/chaincoif/iron
			head = /obj/item/clothing/head/fancyhat
			id = /obj/item/clothing/ring/silver
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, pick(2,3), TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
			H.change_stat(STATKEY_INT, 2)
			H.change_stat(STATKEY_END, -2)
			H.change_stat(STATKEY_CON, -1)
			H.change_stat(STATKEY_SPD, 1)
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'm an unloved bastard child. Calloused hands do not suit me.")
			)
		if("Copper") // Heavy Copper Armor. The fattest fuck.
			head = /obj/item/clothing/head/helmet/coppercap
			neck = /obj/item/clothing/neck/gorget/copper
			armor = /obj/item/clothing/armor/cuirass/copperchest
			mask = /obj/item/clothing/face/facemask/copper
			wrists = /obj/item/clothing/wrists/bracers/copper
			neck = /obj/item/clothing/neck/gorget/copper
			shirt = /obj/item/clothing/armor/gambeson
			pants = /obj/item/clothing/pants/chainlegs
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) // fat
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_PER, -3)
			H.change_stat(STATKEY_SPD, -4)
			to_chat(H,span_info("\
			I'm a champion amongst my people. Grab me, see what happens.")
			)
		if("BKnight") // RARE. DO NOT GIVE THEM BLACKSTEEL SHIT.
			head = /obj/item/clothing/head/menacing
			armor = /obj/item/clothing/armor/cuirass/grenzelhoft
			wrists = /obj/item/clothing/wrists/bracers
			neck = /obj/item/clothing/neck/chaincoif
			shirt = /obj/item/clothing/armor/gambeson
			pants = /obj/item/clothing/pants/tights/black
			backpack_contents = list(/obj/item/clothing/gloves/rare/grenzelplate = 1, /obj/item/clothing/shoes/boots/rare/grenzelplate,)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE) // heavy armor user
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC) // Keep this rare. Only a handful of armor users get this.
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_PER, -4)
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_SPD, -6)
			var/prev_real_name = H.real_name
			var/prev_name = H.name
			var/honorary = "Black Knight"
			H.real_name = "[honorary] [prev_real_name]"
			H.name = "[honorary] [prev_name]"
			to_chat(H,span_info("\
			Forgive me majesty for intruding unannounced. Todae I tilted with a Black Knight from a far land, and unseated him roundly with my lances' blow. I take no credit, because I was sneakily attacked by his ally, and soon dumped in the dirt myself.")
			)
	switch(weapontype)
		if("Axe")
			beltl = /obj/item/weapon/axe/iron
			beltr = /obj/item/weapon/knife/dagger
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
			to_chat(H,span_info("\
			I prefer a practical instrument of war.")
			)
		if("BigAxe")
			backr = /obj/item/weapon/polearm/halberd/bardiche/woodcutter
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat(STATKEY_SPD, -1) // big boy
			H.cmode_music = 'sound/music/cmode/adventurer/CombatIntense.ogg'
			to_chat(H,span_info("\
			Only the strong can survive in the wilds, Dendor fears my axe.")
			)
		if("Mace")
			beltl = /obj/item/weapon/mace
			beltr = /obj/item/weapon/knife/dagger
			wrists = /obj/item/rope/chain
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'
			to_chat(H,span_info("\
			I do not need skill to win a fight, only raw strength. Clubs are my tool of war.")
			)
		if("Shovel") // Rare roll, might as well get some stat benefits
			beltr = /obj/item/flashlight/flare/torch/lantern
			backr = /obj/item/weapon/shovel
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_LCK, 1)
			H.change_stat(STATKEY_SPD, 1)
			H.change_stat(STATKEY_END, 2)
			H.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
			to_chat(H,span_info("\
			Fools underestimate the might of the shovel, for it is the great communicator, and shepherd of the dead.")
			)
		if("BigMace")
			backr =	/obj/item/weapon/hammer/sledgehammer
			beltl = /obj/item/weapon/knife/dagger
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat(STATKEY_SPD, -1) // big boy
			H.cmode_music = 'sound/music/cmode/nobility/CombatKnight.ogg'
			to_chat(H,span_info("\
			I've known nobody who can stop the might of my hammer. My might shall carve mountains in twain.")
			)
		if("Messer") // Nobody uses these goddamn things.
			beltl = /obj/item/weapon/sword/scimitar/messer
			beltr = /obj/item/weapon/sword/scimitar/messer
			r_hand = /obj/item/weapon/sword/scimitar/messer
			l_hand = /obj/item/weapon/sword/scimitar/messer
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_SPD, -2)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'
			to_chat(H,span_info("\
			I dare a motherfucker try and disarm me.")
			)
		if("Daggers")
			beltl = /obj/item/weapon/knife/dagger
			beltr = /obj/item/weapon/knife/dagger
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_STR, -1)
			H.change_stat(STATKEY_SPD, 2)
			H.cmode_music = 'sound/music/cmode/nobility/CombatSpymaster.ogg'
			to_chat(H,span_info("\
			I'm a whirlwind of chaos. Walk into me and die.")
			)
		if("Scythe")
			beltl = /obj/item/weapon/knife/dagger
			backr = /obj/item/weapon/sickle/scythe
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_END, 1)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
			to_chat(H,span_info("\
			I'm the lord of the harvest. I will shepherd the damned to Necra herself.")
			)
		if("MFlail")
			r_hand = /obj/item/weapon/flail/towner
			H.mind?.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_STR, 1)
			H.change_stat(STATKEY_END, 1)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'
			to_chat(H,span_info("\
			The flail is an ancient weapon. If it's good enough for my ancestors, it's good enough for me.")
			)
		if("Shield") // THE WALL
			beltl = /obj/item/weapon/shield/tower/buckleriron
			r_hand = /obj/item/weapon/shield/tower
			H.mind?.adjust_skillrank(/datum/skill/combat/shields, pick(2,2,3), TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.change_stat(STATKEY_CON, 2)
			H.change_stat(STATKEY_SPD, -3)
			H.change_stat(STATKEY_PER, -3)
			H.change_stat(STATKEY_END, 4)
			H.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
			to_chat(H,span_info("\
			No man on earth can make me fall. I am a bulwark, my offense is my defense.")
			)
		if("Spear")
			backr = /obj/item/weapon/polearm/spear
			beltr = /obj/item/weapon/shield/tower/buckleriron
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/towner/CombatInn.ogg'
			to_chat(H,span_info("\
			I'm a cautious sort, I prefer to keep my enemies at range.")
			)
		if("Rapier")
			beltl = /obj/item/weapon/sword/rapier
			beltr = /obj/item/weapon/shield/tower/buckleriron
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			to_chat(H,span_info("\
			Fighting is an art, and I am an artist.")
			)
		if("Cutlass")
			beltl = /obj/item/weapon/sword/sabre/cutlass
			beltr = /obj/item/weapon/knife/dagger/steel
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/antag/CombatLich.ogg'
			to_chat(H,span_info("\
			There's nothing more intimidating than someone with a weapon in each hand.")
			)
		if("Falx")
			backr = /obj/item/weapon/sword/coppermesser
			beltl = /obj/item/weapon/mace/copperbludgeon
			beltr = /obj/item/flashlight/flare/torch/lantern
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			to_chat(H,span_info("\
			I prefer the weaponry of a bygone age.")
			)
		if("Sword")
			beltl = /obj/item/weapon/sword/iron
			backr = /obj/item/weapon/shield/wood
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'
			to_chat(H,span_info("\
			I'm a practical person, the sword is my weapon of choice.")
			)
		if("LSword")
			backr = /obj/item/weapon/sword/long
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
			to_chat(H,span_info("\
			I've brought my father's sword with me on my journey to the grave. Come forth and die.")
			)
		if("GSword")
			backr = /obj/item/weapon/sword/long/greatsword
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat(STATKEY_SPD, -1)
			H.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
			to_chat(H,span_info("\
			Like a wounded bird, I endure the rain with grace. With my sword I take fate into my own hands and strangle it.")
			)
		if("Mage")
			H.mana_pool.set_intrinsic_recharge(MANA_ALL_LEYLINES)
			r_hand = /obj/item/weapon/polearm/woodstaff
			head = /obj/item/clothing/head/roguehood/mage
			armor = /obj/item/clothing/shirt/robe/mage
			beltl = /obj/item/reagent_containers/glass/bottle/manapot
			beltr = /obj/item/book/granter/spellbook/apprentice
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			H.change_stat(STATKEY_INT, 3)
			H.change_stat(STATKEY_CON, -2)
			H.change_stat(STATKEY_SPD, -2)
			H.mind.adjust_spellpoints(6)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/learnspell)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatSorcerer.ogg'
			to_chat(H,span_info("\
			I've studied the arcane, those who step to me shall perish.")
			)
		if("Sword2")
			beltl = /obj/item/weapon/sword/short
			beltr = /obj/item/weapon/sword/short
			H.change_stat(STATKEY_END, 1)
			H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'
			to_chat(H,span_info("\
			Two swords, nothing beats that!")
			)
		if("Flail")
			beltl = /obj/item/weapon/flail/militia
			beltr = /obj/item/weapon/whip
			wrists = /obj/item/rope/chain
			armor = /obj/item/clothing/armor/leather/vest
			shirt = /obj/item/clothing/shirt/undershirt/black
			head = /obj/item/clothing/head/menacing
			H.mind?.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_END, 2)
			H.change_stat(STATKEY_SPD, -1)
			H.change_stat(STATKEY_PER, -2)
			H.cmode_music = 'sound/music/cmode/towner/CombatInn.ogg'
			to_chat(H,span_info("\
			I am an instrument of pain. The humen body is my canvas.")
			)
		if("Fist")
			wrists = /obj/item/clothing/wrists/bracers/leather
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat(STATKEY_SPD, 1)
			H.change_stat(STATKEY_STR, 1)
			H.cmode_music = 'sound/music/cmode/Adventurer/CombatMonk.ogg'
			to_chat(H,span_info("\
			My mind is a temple, and my body is a weapon of war. I can parry any attack sent my way.")
			)
		if("Gun")
			beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/pistol
			beltr = /obj/item/ammo_holder/bullet
			r_hand = /obj/item/reagent_containers/glass/bottle/aflask
			backpack_contents = list(/obj/item/reagent_containers/glass/bottle/aflask = 2)
			H.mind?.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			H.change_stat(STATKEY_PER, 3)
			ADD_TRAIT(H, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
			to_chat(H,span_info("\
			In this world, there are two kinds of people. Those with loaded guns, and those who dig.")
			)
	switch(randomjob)
		if("Farmer")
			H.mind?.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/labor/taming, 1, TRUE)
			ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I toiled the fields in my youth. Farmwork makes me hungry.")
			)
		if("Sailor")
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			H.change_stat(STATKEY_STR, -1)
			to_chat(H,span_info("\
			I've worked on ships defending their cargo. I am no stranger to Abyssor's wrath.")
			)
		if("Pickpocket")
			H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
			H.change_stat(STATKEY_STR, -2)
			to_chat(H,span_info("\
			Some people in this city are too rich for their own good. Luckily they have me to give them a hand.")
			)
		if("Smith")
			H.mind?.adjust_skillrank(/datum/skill/labor/mining, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE)
			H.change_stat(STATKEY_INT, -1)
			H.change_stat(STATKEY_CON, 1)
			to_chat(H,span_info("\
			The heat of the forge yet warms my body. I yearn for the mines.")
			)
		if("Cook")
			H.mind?.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
			r_hand = /obj/item/reagent_containers/glass/bucket/pot
			l_hand = /obj/item/cooking/pan
			to_chat(H,span_info("\
			I'm a natural in the kitchen!")
			)
		if("Fisher")
			H.mind?.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.change_stat(STATKEY_PER, 2)
			to_chat(H,span_info("\
			Fish fear me. I've lived off Abyssor's bounty, both salt-and-freshwater.")
			)
		if("Doctor")
			H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.change_stat(STATKEY_INT, 1)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I've studied anatomy, and used to practice medicine.")
			)
		if("Grappler")
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.change_stat(STATKEY_INT, -1)
			to_chat(H,span_info("\
			I'm a professional grappler. I made money beating the snot out of idiots.")
			)
		if("Guard")
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.change_stat(STATKEY_INT, -1)
			H.verbs |= /mob/proc/haltyell
			to_chat(H,span_info("\
			I was once part of a town militia. I'm used to apprehending unsavory sorts.")
			)
		if("Lumber")
			H.mind?.adjust_skillrank(/datum/skill/labor/lumberjacking, 3, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
			H.change_stat(STATKEY_INT, 1)
			to_chat(H,span_info("\
			I was a lumberjack once, wise as an oak too.")
			)
		if("Paranoiac")
			l_hand = /obj/item/flashlight/flare/torch/lantern
			H.change_stat(STATKEY_PER, 3)
			H.change_stat(STATKEY_CON, -2)
			ADD_TRAIT(H, TRAIT_FASTSLEEP, TRAIT_GENERIC)
			to_chat(H,span_info("\
			In the dark corners of every room I see him. I can't sleep without a light-source.")
			)
		if("Bard")
			H.mind?.adjust_skillrank(/datum/skill/misc/music, 3, TRUE)
			H.change_stat(STATKEY_INT, 1)
			H.change_stat(STATKEY_END, 1)
			l_hand = /obj/item/instrument/guitar
			ADD_TRAIT(H, TRAIT_BARDIC_TRAINING, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I used to be a bard, the skills never left me. I'm a silver-tongued devil!")
			)
		if("Smart")
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/music, rand(2,3), TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
			l_hand = /obj/item/clothing/face/spectacles
			H.change_stat(STATKEY_INT, 3)
			H.change_stat(STATKEY_CON, -1)
			H.change_stat(STATKEY_PER, -2)
			H.virginity = TRUE
			H.grant_language(/datum/language/elvish)
			H.grant_language(/datum/language/celestial)
			H.grant_language(/datum/language/oldpsydonic)
			to_chat(H,span_info("\
			I was a scribe in my former years. I'm well-educated and can speak a couple languages.")
			)
		if("Steppes")
			H.mind?.adjust_skillrank(/datum/skill/labor/taming, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.change_stat(STATKEY_PER, 1)
			H.change_stat(STATKEY_INT, -2)
			H.change_stat(STATKEY_END, 1)
			to_chat(H,span_info("\
			I'm from the steppes. Civilized society is unbeknownst to me.")
			)
		if("Alch")
			H.mind?.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/magic/arcane, pick(1,2), TRUE)
			H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat(STATKEY_PER, 1)
			H.change_stat(STATKEY_INT, 1)
			H.change_stat(STATKEY_END, -1)
			to_chat(H,span_info("\
			I'm knowledgeable about potions. Concoctions and tinctures were once my livelihood.")
			)
		if("Torturer")
			H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
			H.verbs |= /mob/living/carbon/human/proc/torture_victim
			H.change_stat(STATKEY_INT, -1)
			to_chat(H,span_info("\
			I like to collect teeth. Torturing people was once my livelihood.")
			)
	switch(randomperk)
		if("Fat")
			backpack_contents = list(/obj/item/reagent_containers/glass/bottle/wine = 1, /obj/item/reagent_containers/food/snacks/hardtack = 2)
			H.change_stat(STATKEY_SPD, -1)
			to_chat(H,span_info("\
			I packed enough supplies to last the week. I like to eat well.")
			)
		if("Lockpicks")
			backpack_contents = list(/obj/item/lockpick = 2, /obj/item/weapon/knife/dagger = 1)
			H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
			to_chat(H,span_info("\
			Who am I, and how did I get here? Well, I'm a locksmith, and I'm a locksmith, that's how.")
			)
		if("Traps")
			backpack_contents = list(/obj/item/restraints/legcuffs/beartrap/crafted = 2)
			H.mind?.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
			to_chat(H,span_info("\
			I'm paranoid. I don't leave home without some traps, and I never sleep without a knife on my person.")
			)
		if("Ring")
			backpack_contents = list(/obj/item/clothing/ring/gold = 1)
			H.mind?.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
			to_chat(H,span_info("\
			I was married once. I don't want to talk about it. There's a hole in my heart even the gods cannot mend.")
			)
		if("Knives")
			backpack_contents = list(/obj/item/weapon/knife/dagger= 6)
			H.mind?.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			to_chat(H,span_info("\
			You want my weapons? Go on, take them from me.")
			)
		if("Normal")
			to_chat(H,span_info("\
			There's nothing too odd with me. I'm mostly normal... Mostly.")
			)
		if("Packrat")
			ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I'll sell anything not nailed down. Anything that's nailed down is still being sold, even the floorboards, even the nails.")
			)
		if("Strong")
			H.change_stat(STATKEY_STR, 4)
			H.change_stat(STATKEY_SPD, -3)
			H.change_stat(STATKEY_INT, -2)
			to_chat(H,span_info("\
			YOU ARE UP AGAINST THE WALL, AND I AM THE FUCKING WALL! I'm more muscle than man!")
			)
		if("Zizo")
			H.change_stat(STATKEY_INT, 1)
			H.set_patron(/datum/patron/inhumen/zizo)
			to_chat(H,span_info("\
			CHAOS REIGNS! HAIL ZIZO!")
			)
		if("Abyssor")
			H.change_stat(STATKEY_END, 1)
			H.set_patron(/datum/patron/divine/abyssor)
			to_chat(H,span_info("\
			Abyssor swallows my soul, his wrath will never be quenched!")
			)
		if("Graggar")
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_CON, 1)
			H.set_patron(/datum/patron/inhumen/graggar)
			l_hand = /obj/item/clothing/head/helmet/heavy/sinistar
			to_chat(H,span_info("\
			FOR ALL WHO DENY THE STRUGGLE, THE TRIUMPHANT OVERCOME! GRAGGAR IS THE BEAST I WORSHIP!")
			)
		if("Speedy")
			H.change_stat(STATKEY_SPD, 2)
			to_chat(H,span_info("\
			I'm quick on my feet! I move slightly faster than others.")
			)
		if("Lucky")
			H.change_stat(STATKEY_LCK, 1)
			to_chat(H,span_info("\
			I'm naturally lucky. Things just seem to go my way!")
			)
		if("Smartish")
			H.change_stat(STATKEY_INT, 2)
			to_chat(H,span_info("\
			I'm a little smarter than other folks, but not by much.")
			)
		if("Atheist")
			H.change_stat(STATKEY_INT, 4)
			H.change_stat(STATKEY_END, -2)
			H.change_stat(STATKEY_STR, -1)
			H.set_patron(/datum/faith/godless)
			to_chat(H,span_info("\
			In this moment, I am euphoric. Not because of any phony god's blessing, but because I am englightened by my intelligence. No gods, no masters.")
			)
		if("Stupid")
			H.change_stat(STATKEY_INT, -4)
			H.change_stat(STATKEY_CON, 4)
			H.change_stat(STATKEY_SPD, -4)
			H.set_patron(/datum/faith/godless)
			to_chat(H,span_info("\
			If I'm going to be dumb, I'm going to be tough. I dare a motherfucker try to end my life.")
			)
		if("Heel")
			H.change_stat(STATKEY_CON, 3)
			H.change_stat(STATKEY_STR, 2)
			ADD_TRAIT(H, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I was born under a dark star. Any victory of mine shall be pyrrhic. Todae marks the last week of my life.")
			)
		if("Meek")
			H.change_stat(STATKEY_LCK, -1)
			H.change_stat(STATKEY_END, 1)
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			to_chat(H,span_info("\
			Nobody knows how capable I am of great violence. Anyone who accosts me shall regret it.")
			)
		if("Invisible") // METAL GEAR SOLID V?!!
			H.change_stat(STATKEY_LCK, -1)
			H.change_stat(STATKEY_CON, -2)
			H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			r_hand = /obj/item/clothing/face/facemask
			ADD_TRAIT(H, TRAIT_DISFIGURED, TRAIT_GENERIC)
			to_chat(H,span_info("\
			I forgot to remember to forget. I don't know who I am anymore.")
			)
		if("Bomb")
			backpack_contents = list(/obj/item/bomb = 1, /obj/item/flint = 1)
			to_chat(H,span_info("\
			If ever I am struck down, my last act of defiance shall be sending me and my enemy straight to the depths of hell.")
			)
		if("Zigs")
			backpack_contents = list(/obj/item/storage/fancy/cigarettes/zig = 1, /obj/item/flint = 1)
			to_chat(H,span_info("\
			I like to relax with the puff of a zig.")
			)
		if("Ozium")
			backpack_contents = list(/obj/item/reagent_containers/powder/ozium = 2, /datum/supply_pack/tools/wpipe = 1, /obj/item/flint = 1)
			to_chat(H,span_info("\
			I smoke ozium.")
			)
