/obj/mecha/combat/phazon
	name = "Phazon"
	desc = "Экспериментальный экзокостюм разработанный Nanotrasen, обладающий способностью фазового сдвига."
	icon_state = "phazon"
	initial_icon = "phazon"
	step_in = 2
	dir_in = 2 //Facing south.
	step_energy_drain = 3
	normal_step_energy_drain = 3
	max_integrity = 200
	deflect_chance = 30
	armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 30, RAD = 50, FIRE = 100, ACID = 75)
	max_temperature = 25000
	infra_luminosity = 3
	wreckage = /obj/structure/mecha_wreckage/phazon
	add_req_access = 1
	//operation_req_access = list()
	internal_damage_threshold = 25
	force = 15
	phase_state = "phazon-phase"
	max_equip = 3

/obj/mecha/combat/phazon/GrantActions(mob/living/user, human_occupant = 0)
	..()
	phasing_action.Grant(user, src)
	switch_damtype_action.Grant(user, src)

/obj/mecha/combat/phazon/RemoveActions(mob/living/user, human_occupant = 0)
	..()
	phasing_action.Remove(user)
	switch_damtype_action.Remove(user)

/obj/mecha/combat/phazon/Initialize(mapload)
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/rcd
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/gravcatapult
	ME.attach(src)

/obj/mecha/combat/phazon/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='byond://?src=[UID()];switch_damtype=1'>Change melee damage type</a><br>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/phazon/examine_more(mob/user)
	. = ..()
	. += "<i>Фазон — это экспериментальный боевой экзокостюм Nanotrasen, в основе которого лежит ядро блюспейс-аномалии. \
	Это странное ядро обеспечивает механизму частичный выход из реальности, позволяя ему проходить сквозь стены и другие препятствия, как если бы их вообще не существовало. \
	Будучи разработанным исследовательской группой Nanotrasen, проект недавно был отправлен на их научные станции для тестирования и предварительного производства.</i>"
	. += ""
	. += "<i>Из-за особенностей обнаружения ядер блюспейс-аномалий Фазоны встречаются чрезвычайно редко. \
	Кажется, что он гудит от накопленной энергии, а края его корпуса размыты для глаз окружающих, даже в состоянии покоя. \
	Первые пилоты-испытатели сообщали о странных галлюцинациях и видениях после интенсивного использования способности фазирования.</i>"
