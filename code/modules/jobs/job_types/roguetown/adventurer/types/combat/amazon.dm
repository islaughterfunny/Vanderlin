/datum/advclass/combat/amazon
	name = "Amazon"
	tutorial = "A savage and deft warrior-women, you hail from the mysterious isle of Issa. In your youth you learned to partake in the hunts amid the treetops and proved your worth through countless bouts."
	allowed_sexes = list(FEMALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/amazon
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	min_pq = 0
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg'

/datum/outfit/job/roguetown/adventurer/amazon/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	neck = /obj/item/ammo_holder/dartpouch/poisondarts
	backl = /obj/item/rogueweapon/polearm/spear
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	beltr = /obj/item/ammo_holder/quiver/arrows
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	armor = /obj/item/clothing/suit/roguetown/armor/amazon_chainkini
	shoes = /obj/item/clothing/shoes/roguetown/boots
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_INT, -1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, 1)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
