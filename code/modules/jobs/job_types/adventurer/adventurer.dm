GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 30 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/adventurer
	title = "Adventurer"
	tutorial = "Hero of nothing, adventurer by trade. \
	Whatever led you to this fate is up to the wind to decide, \
	and you've never fancied yourself for much other than the thrill. \
	Someday your pride is going to catch up to you, \
	and you're going to find out why most men don't end up in the annals of history."
	flag = ADVENTURER
	department_flag = PEASANTS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_NEW_PLAYER_JOINABLE | JOB_EQUIP_RANK)
	display_order = JDO_ADVENTURER
	faction = FACTION_STATION
	total_positions = 14
	spawn_positions = 14
	min_pq = 2
	bypass_lastclass = TRUE

	allowed_races = ALL_PLAYER_RACES_BY_NAME

	outfit = null
	outfit_female = null
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 15 MINUTES
	advclass_cat_rolls = list(CTAG_ADVENTURER = 15)
	is_foreigner = TRUE
	can_have_apprentices = FALSE


/datum/job/adventurer/after_spawn(mob/living/spawned, client/player_client)
	..()
	if(advclass_cat_rolls)
		hugboxify_for_class_selection(spawned)
