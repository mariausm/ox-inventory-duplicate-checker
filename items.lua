return {
    ['testburger'] = {
        label = 'Test Burger',
        weight = 220,
        degrade = 60,
        client = {
            image = 'burger_chicken.png',
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            export = 'ox_inventory_examples.testburger'
        },
        server = {
            export = 'ox_inventory_examples.testburger',
            test = 'what an amazingly delicious burger, amirite?'
        },
        buttons = {
            {
                label = 'Lick it',
                action = function(slot)
                    print('You licked the burger')
                end
            },
            {
                label = 'Squeeze it',
                action = function(slot)
                    print('You squeezed the burger :(')
                end
            },
            {
                label = 'What do you call a vegan burger?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('A misteak.')
                end
            },
            {
                label = 'What do frogs like to eat with their hamburgers?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('French flies.')
                end
            },
            {
                label = 'Why were the burger and fries running?',
                group = 'Hamburger Puns',
                action = function(slot)
                    print('Because they\'re fast food.')
                end
            }
        },
        consume = 0.3
    },

    ['bandage'] = {
        label = 'Bandage',
        weight = 115,
    },

    ['burger'] = {
        label = 'Burger',
        weight = 220,
        client = {
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            notification = 'You ate a delicious burger'
        },
    },

    ['sprunk'] = {
        label = 'Sprunk',
        weight = 350,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 2500,
            notification = 'You quenched your thirst with a sprunk'
        }
    },

    ['parachute'] = {
        label = 'Parachute',
        weight = 8000,
        stack = false,
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

    ['garbage'] = {
        label = 'Garbage',
    },

    ['paperbag'] = {
        label = 'Paper Bag',
        weight = 1,
        stack = false,
        close = false,
        consume = 0
    },

    ['panties'] = {
        label = 'Knickers',
        weight = 10,
        consume = 0,
        client = {
            status = { thirst = -100000, stress = -25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
            usetime = 2500,
        }
    },

    ['lockpick'] = {
        label = 'Lockpick',
        weight = 160,
    },

    ['phone'] = {
        label = 'Phone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function() return exports.npwd:setPhoneDisabled(false) end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function() return exports.npwd:setPhoneDisabled(true) end)
                end
            end
        }
    },

    ['mustard'] = {
        label = 'Mustard',
        weight = 500,
        client = {
            status = { hunger = 25000, thirst = 25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
            usetime = 2500,
            notification = 'You... drank mustard'
        }
    },

    ['water'] = {
        label = 'Water',
        weight = 500,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
            usetime = 2500,
            cancel = true,
            notification = 'You drank some refreshing water'
        }
    },

    ['armour'] = {
        label = 'Bulletproof Vest',
        weight = 3000,
        stack = false,
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
        }
    },

    ['clothing'] = {
        label = 'Clothing',
        consume = 0,
    },

    ['money'] = {
        label = 'Money',
    },

    ['black_money'] = {
        label = 'Dirty Money',
    },

    ['id_card'] = {
        label = 'Identification Card',
    },

    ['driver_license'] = {
        label = 'Drivers License',
    },

    ['weaponlicense'] = {
        label = 'Weapon License',
    },

    ['lawyerpass'] = {
        label = 'Lawyer Pass',
    },

    ['radio'] = {
        label = 'Radio',
        weight = 1000,
        allowArmed = true,
        consume = 0,
        client = {
            event = 'mm_radio:client:use'
        }
    },

    ['jammer'] = {
        label = 'Radio Jammer',
        weight = 10000,
        allowArmed = true,
        client = {
            event = 'mm_radio:client:usejammer'
        }
    },

    ['radiocell'] = {
        label = 'AAA Cells',
        weight = 1000,
        stack = true,
        allowArmed = true,
        client = {
            event = 'mm_radio:client:recharge'
        }
    },

    ['advancedlockpick'] = {
        label = 'Advanced Lockpick',
        weight = 500,
    },

    ['screwdriverset'] = {
        label = 'Screwdriver Set',
        weight = 500,
    },

    ['electronickit'] = {
        label = 'Electronic Kit',
        weight = 500,
    },

    ['cleaningkit'] = {
        label = 'Cleaning Kit',
        weight = 500,
    },

    ['repairkit'] = {
        label = 'Repair Kit',
        weight = 2500,
    },

    ['advancedrepairkit'] = {
        label = 'Advanced Repair Kit',
        weight = 4000,
    },

    ['diamond_ring'] = {
        label = 'Diamond',
        weight = 1500,
    },

    ['rolex'] = {
        label = 'Golden Watch',
        weight = 1500,
    },

    ['goldbar'] = {
        label = 'Gold Bar',
        weight = 1500,
    },

    ['goldchain'] = {
        label = 'Golden Chain',
        weight = 1500,
    },

    ['crack_baggy'] = {
        label = 'Crack Baggy',
        weight = 100,
    },

    ['cokebaggy'] = {
        label = 'Bag of Coke',
        weight = 100,
    },

    ['coke_small_brick'] = {
        label = 'Coke Package',
        weight = 1000,
    },

    ['xtcbaggy'] = {
        label = 'Bag of Ecstasy',
        weight = 100,
    },

    ['oxy'] = {
        label = 'Oxycodone',
        weight = 100,
    },

    ['weed_ak47'] = {
        label = 'AK47 2g',
        weight = 200,
    },

    ['weed_ak47_seed'] = {
        label = 'AK47 Seed',
        weight = 1,
    },

    ['weed_skunk'] = {
        label = 'Skunk 2g',
        weight = 200,
    },

    ['weed_skunk_seed'] = {
        label = 'Skunk Seed',
        weight = 1,
    },

    ['weed_amnesia'] = {
        label = 'Amnesia 2g',
        weight = 200,
    },

    ['weed_amnesia_seed'] = {
        label = 'Amnesia Seed',
        weight = 1,
    },

    ['weed_og-kush'] = {
        label = 'OGKush 2g',
        weight = 200,
    },

    ['weed_og-kush_seed'] = {
        label = 'OGKush Seed',
        weight = 1,
    },

    ['weed_white-widow'] = {
        label = 'OGKush 2g',
        weight = 200,
    },

    ['weed_white-widow_seed'] = {
        label = 'White Widow Seed',
        weight = 1,
    },

    ['weed_purple-haze'] = {
        label = 'Purple Haze 2g',
        weight = 200,
    },

    ['weed_purple-haze_seed'] = {
        label = 'Purple Haze Seed',
        weight = 1,
    },

    ['weed_brick'] = {
        label = 'Weed Brick',
        weight = 2000,
    },

    ['weed_nutrition'] = {
        label = 'Plant Fertilizer',
        weight = 2000,
    },

    ['joint'] = {
        label = 'Joint',
        weight = 200,
    },

    ['rolling_paper'] = {
        label = 'Rolling Paper',
        weight = 0,
    },

    ['empty_weed_bag'] = {
        label = 'Empty Weed Bag',
        weight = 0,
    },

    ['firstaid'] = {
        label = 'First Aid',
        weight = 2500,
    },

    ['ifaks'] = {
        label = 'Individual First Aid Kit',
        weight = 2500,
    },

    ['painkillers'] = {
        label = 'Painkillers',
        weight = 400,
    },

    ['firework1'] = {
        label = '2Brothers',
        weight = 1000,
    },

    ['firework2'] = {
        label = 'Poppelers',
        weight = 1000,
    },

    ['firework3'] = {
        label = 'WipeOut',
        weight = 1000,
    },

    ['firework4'] = {
        label = 'Weeping Willow',
        weight = 1000,
    },

    ['steel'] = {
        label = 'Steel',
        weight = 100,
    },

    ['rubber'] = {
        label = 'Rubber',
        weight = 100,
    },

    ['metalscrap'] = {
        label = 'Metal Scrap',
        weight = 100,
    },

    ['iron'] = {
        label = 'Iron',
        weight = 100,
    },

    ['copper'] = {
        label = 'Copper',
        weight = 100,
    },

    ['aluminium'] = {
        label = 'Aluminium',
        weight = 100,
    },

    ['plastic'] = {
        label = 'Plastic',
        weight = 100,
    },

    ['glass'] = {
        label = 'Glass',
        weight = 100,
    },

    ['gatecrack'] = {
        label = 'Gatecrack',
        weight = 1000,
    },

    ['cryptostick'] = {
        label = 'Crypto Stick',
        weight = 100,
    },

    ['trojan_usb'] = {
        label = 'Trojan USB',
        weight = 100,
    },

    ['toaster'] = {
        label = 'Toaster',
        weight = 5000,
    },

    ['small_tv'] = {
        label = 'Small TV',
        weight = 100,
    },

    ['security_card_01'] = {
        label = 'Security Card A',
        weight = 100,
    },

    ['security_card_02'] = {
        label = 'Security Card B',
        weight = 100,
    },

    ['drill'] = {
        label = 'Drill',
        weight = 5000,
    },

    ['thermite'] = {
        label = 'Thermite',
        weight = 1000,
    },

    ['diving_gear'] = {
        label = 'Diving Gear',
        weight = 30000,
    },

    ['diving_fill'] = {
        label = 'Diving Tube',
        weight = 3000,
    },

    ['antipatharia_coral'] = {
        label = 'Antipatharia',
        weight = 1000,
    },

    ['dendrogyra_coral'] = {
        label = 'Dendrogyra',
        weight = 1000,
    },

    ['jerry_can'] = {
        label = 'Jerrycan',
        weight = 3000,
    },

    ['nitrous'] = {
        label = 'Nitrous',
        weight = 1000,
    },

    ['wine'] = {
        label = 'Wine',
        weight = 500,
    },

    ['grape'] = {
        label = 'Grape',
        weight = 10,
    },

    ['grapejuice'] = {
        label = 'Grape Juice',
        weight = 200,
    },

    ['coffee'] = {
        label = 'Coffee',
        weight = 200,
    },

    ['whiskey'] = {
        label = 'Whiskey',
        weight = 200,
    },

    ['beer'] = {
        label = 'beer',
        weight = 200,
    },

    ['sandwich'] = {
        label = 'beer',
        weight = 200,
    },

    ['walking_stick'] = {
        label = 'Walking Stick',
        weight = 1000,
    },

    ['lighter'] = {
        label = 'Lighter',
        weight = 200,
    },

    ['binoculars'] = {
        label = 'Binoculars',
        weight = 800,
    },

    ['stickynote'] = {
        label = 'Sticky Note',
        weight = 0,
    },

    ['empty_evidence_bag'] = {
        label = 'Empty Evidence Bag',
        weight = 200,
    },

    ['filled_evidence_bag'] = {
        label = 'Filled Evidence Bag',
        weight = 200,
    },

    ['harness'] = {
        label = 'Harness',
        weight = 200,
    },

--- rcore_casino ---

	['casino_beer'] = {
		label = 'Casino Beer',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_burger'] = {
		label = 'casino burger',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_chips'] = {
		label = 'casino chips',
		weight = 0,
		close = true,
		consume = 0,
		stack = true,
	},

	['casino_coffee'] = {
		label = 'casino coffee',
		weight = 0,
		close = true,
		consume = 0,
	},


	['casino_donut'] = {
		label = 'casino donut',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_ego_chaser'] = {
		label = 'casino ego chaser',
		weight = 0,
		close = true,
		consume = 0,
	},
	['casino_luckypotion'] = {
		label = 'casino luckypotion',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_psqs'] = {
		label = 'Casino Ps & Qs',
		weight = 0,
		close = true,
		consume = 0,
	},
	

	['casino_sandwitch'] = {
		label = 'casino sandwitch',
		weight = 0,
		close = true,
		consume = 0,
	},
		['casino_sandwitch'] = {
		label = 'casino sandwitch',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_sprite'] = {
		label = 'casino sprite',
		weight = 0,
		close = true,
		consume = 0,
	},
	['casino_luckypotion'] = {
		label = 'casino luckypotion',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_psqs'] = {
		label = 'Casino Ps & Qs',
		weight = 0,
		close = true,
		consume = 0,
	},
	

	['casino_sandwitch'] = {
		label = 'casino sandwitch',
		weight = 0,
		close = true,
		consume = 0,
	},
		['casino_sandwitch'] = {
		label = 'casino sandwitch',
		weight = 0,
		close = true,
		consume = 0,
	},

	['casino_sprite'] = {
		label = 'casino sprite',
		weight = 0,
		close = true,
		consume = 0,
	},
	
--- lunar_jobscreator ---

	['handcuffs'] = {
		label = 'Handcuffs',
		weight = 200,
		stack = true,
	},

	['zipties'] = {
		label = 'Zipties',
		weight = 20,
		stack = true,
	},

	['blueprint_advancedrifle'] = {
		label = 'Blueprint - Advanced Rifle',
		description = 'Blueprint for the advanced rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_appistol'] = {
		label = 'Blueprint - APPistol',
		description = 'Blueprint for the APPistol.',
		weight = 100,
		stack = false
	},

	['blueprint_assaultrifle'] = {
		label = 'Blueprint - Assault Rifle',
		description = 'Blueprint for the Assault Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_assaultrifle_mk2'] = {
		label = 'Blueprint - Assault Rifle MK2',
		description = 'Blueprint for the Assault Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_assaultshotgun'] = {
		label = 'Blueprint - Assault Shotgun',
		description = 'Blueprint for the Assault Shotgun.',
		weight = 100,
		stack = false
	},
	['blueprint_assaultsmg'] = {
		label = 'Blueprint - Assault SMG',
		description = 'Blueprint for the Assault SMG.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpuprifle'] = {
		label = 'Blueprint - Bullpup Rifle',
		description = 'Blueprint for the Bullpup Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpuprifle_mk2'] = {
		label = 'Blueprint - Bullpup Rifle MK2',
		description = 'Blueprint for the Bullpup Rifle MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpupshotgun'] = {
		label = 'Blueprint - Bullpup Shotgun',
		description = 'Blueprint for the Bullpup Shotgun.',
		weight = 100,
		stack = false
	},
	
		['casino_coke'] = {
		label = 'casino coke',
		weight = 0,
		close = true,
		consume = 0,
	},
	['blueprint_assaultsmg'] = {
		label = 'Blueprint - Assault SMG',
		description = 'Blueprint for the Assault SMG.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpuprifle'] = {
		label = 'Blueprint - Bullpup Rifle',
		description = 'Blueprint for the Bullpup Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpuprifle_mk2'] = {
		label = 'Blueprint - Bullpup Rifle MK2',
		description = 'Blueprint for the Bullpup Rifle MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_bullpupshotgun'] = {
		label = 'Blueprint - Bullpup Shotgun',
		description = 'Blueprint for the Bullpup Shotgun.',
		weight = 100,
		stack = false
	},
	
		['casino_coke'] = {
		label = 'casino coke',
		weight = 0,
		close = true,
		consume = 0,
	},


	['blueprint_carbinerifle'] = {
		label = 'Blueprint - Carbine Rifle',
		description = 'Blueprint for the Carbine Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_carbinerifle_mk2'] = {
		label = 'Blueprint - Carbine Rifle MK2',
		description = 'Blueprint for the Carbine Rifle MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_combatmg'] = {
		label = 'Blueprint - Combat MG',
		description = 'Blueprint for the Combat MG.',
		weight = 100,
		stack = false
	},

	['blueprint_combatmg_mk2'] = {
		label = 'Blueprint - Combat MG MK2',
		description = 'Blueprint for the Combat MG MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_combatpdw'] = {
		label = 'Blueprint - Combat PDW',
		description = 'Blueprint for the Combat PDW.',
		weight = 100,
		stack = false
	},

	['blueprint_combatpistol'] = {
		label = 'Blueprint - Combat Pistol',
		description = 'Blueprint for the Combat Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_combatshotgun'] = {
		label = 'Blueprint - Combat Shotgun',
		description = 'Blueprint for the Combat Shotgun.',
		weight = 100,
		stack = false
	},

	['blueprint_compactrifle'] = {
		label = 'Blueprint - Compact Rifle',
		description = 'Blueprint for the Compact Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_digiscanner'] = {
		label = 'Blueprint - Digiscanner',
		description = 'Blueprint for the Digiscanner.',
		weight = 100,
		stack = false
	},

	['blueprint_gusenberg'] = {
		label = 'Blueprint - Gusenberg',
		description = 'Blueprint for the Gusenberg.',
		weight = 100,
		stack = false
	},

	['blueprint_heavypistol'] = {
		label = 'Blueprint - Heavy Pistol',
		description = 'Blueprint for the Heavy Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_heavyrifle'] = {
		label = 'Blueprint - Heavy Rifle',
		description = 'Blueprint for the Heavy Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_heavyshotgun'] = {
		label = 'Blueprint - Heavy Shotgun',
		description = 'Blueprint for the Heavy Shotgun.',
		weight = 100,
		stack = false
	},

	['blueprint_heavysniper'] = {
		label = 'Blueprint - Heavy Sniper',
		description = 'Blueprint for the Heavy Sniper.',
		weight = 100,
		stack = false
	},

	['blueprint_heavysniper_mk2'] = {
		label = 'Blueprint - Heavy Sniper MK2',
		description = 'Blueprint for the Heavy Sniper MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_machinepistol'] = {
		label = 'Blueprint - Machine Pistol',
		description = 'Blueprint for the Machine Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_marksmanpistol'] = {
		label = 'Blueprint - Marksman Pistol',
		description = 'Blueprint for the Marksman Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_marksmanrifle'] = {
		label = 'Blueprint - Marksman Rifle',
		description = 'Blueprint for the Marksman Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_marksmanrifle_mk2'] = {
		label = 'Blueprint - Marksman Rifle MK2',
		description = 'Blueprint for the Marksman Rifle MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_metaldetector'] = {
		label = 'Blueprint - Metal Detector',
		description = 'Blueprint for the Metal Detector.',
		weight = 100,
		stack = false
	},

	['blueprint_mg'] = {
		label = 'Blueprint - MG',
		description = 'Blueprint for the MG.',
		weight = 100,
		stack = false
	},

	['blueprint_militaryrifle'] = {
		label = 'Blueprint - Military Rifle',
		description = 'Blueprint for the Military Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_minismg'] = {
		label = 'Blueprint - Mini SMG',
		description = 'Blueprint for the Mini SMG.',
		weight = 100,
		stack = false
	},

	['blueprint_musket'] = {
		label = 'Blueprint - Musket',
		description = 'Blueprint for the Musket.',
		weight = 100,
		stack = false
	},

	['blueprint_pistol'] = {
		label = 'Blueprint - Pistol',
		description = 'Blueprint for the Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_pistol_mk2'] = {
		label = 'Blueprint - Pistol MK2',
		description = 'Blueprint for the Pistol MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_pistol50'] = {
		label = 'Blueprint - Pistol .50',
		description = 'Blueprint for the Pistol .50.',
		weight = 100,
		stack = false
	},

	['blueprint_precisionrifle'] = {
		label = 'Blueprint - Precision Rifle',
		description = 'Blueprint for the Precision Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_pumpshotgun'] = {
		label = 'Blueprint - Pump Shotgun',
		description = 'Blueprint for the Pump Shotgun.',
		weight = 100,
		stack = false
	},

	['blueprint_pumpshotgun_mk2'] = {
		label = 'Blueprint - Pump Shotgun MK2',
		description = 'Blueprint for the Pump Shotgun MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_revolver'] = {
		label = 'Blueprint - Revolver',
		description = 'Blueprint for the Revolver.',
		weight = 100,
		stack = false
	},

	['blueprint_revolver_mk2'] = {
		label = 'Blueprint - Revolver MK2',
		description = 'Blueprint for the Revolver MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_smg'] = {
		label = 'Blueprint - SMG',
		description = 'Blueprint for the SMG.',
		weight = 100,
		stack = false
	},

	['blueprint_smg_mk2'] = {
		label = 'Blueprint - SMG MK2',
		description = 'Blueprint for the SMG MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_snspistol'] = {
		label = 'Blueprint - SNS Pistol',
		description = 'Blueprint for the SNS Pistol.',
		weight = 100,
		stack = false
	},

	['blueprint_specialcarbine'] = {
		label = 'Blueprint - Special Carbine',
		description = 'Blueprint for the Special Carbine.',
		weight = 100,
		stack = false
	},

	['blueprint_specialcarbine_mk2'] = {
		label = 'Blueprint - Special Carbine MK2',
		description = 'Blueprint for the Special Carbine MK2.',
		weight = 100,
		stack = false
	},

	['blueprint_tacticalrifle'] = {
		label = 'Blueprint - Tactical Rifle',
		description = 'Blueprint for the Tactical Rifle.',
		weight = 100,
		stack = false
	},

	['blueprint_tecpistol'] = {
		label = 'Blueprint - Tec Pistol',
		description = 'Blueprint for the Tec Pistol.',
		weight = 100,
		stack = false
	},

	['red_grapes'] = {
		label = 'Red grapes',
		weight = 200,
		stack = true
	},

	['white_grapes'] = {
		label = 'White grapes',
		weight = 200,
		stack = true
	},

	['white_wine_juice'] = {
		label = 'White wine juice',
		weight = 1000,
		stack = true
	},

	['red_wine_juice'] = {
		label = 'Red wine juice',
		weight = 1000,
		stack = true
	},

	['empty_bottle'] = {
		label = 'Empty wine bottle',
		weight = 200,
		stack = true
	},

	['white_wine'] = {
		label = 'White wine',
		weight = 1200,
		stack = true
	},

	['red_wine'] = {
		label = 'Red wine',
		weight = 1200,
		stack = true
	},

	['grape_snips'] = {
		label = 'Grape snips',
		weight = 200,
		stack = false
	},

	['burger_bleeder'] = {
		label = 'Bleeder burger',
		weight = 300,
	},

	['burger_heartstopper'] = {
		label = 'Heart stopper burger',
		weight = 500,
	},

	['burger_torpedo'] = {
		label = 'Torpedo Sandwich',
		weight = 200,
	},

	['burger_meatfree'] = {
		label = 'Meat free burger',
		weight = 200,
	},

	['burger_moneyshot'] = {
		label = 'Money shot burger',
		weight = 300,
	},

	['burger_chickenwrap'] = {
		label = 'Chicken wrap',
		weight = 200,
	},

	['burger_donut'] = {
		label = 'Donut',
		weight = 300,
	},

	['burger_applepie'] = {
		label = 'Apple pie',
		weight = 300,
	},

	['burger_fries'] = {
		label = 'Freedom fries',
		weight = 200,
	},

	['burger_coffee'] = {
		label = 'Coffee',
		weight = 250,
	},

	['burger_ecola'] = {
		label = 'eCola',
		weight = 500,
	},

	['burger_sprunk'] = {
		label = 'Sprunk',
		weight = 500,
	},

	['burger_emptycup'] = {
		label = 'Empty cup',
		weight = 50,
	},

	['bacon'] = {
		label = 'Bacon',
		weight = 50
	},

	['bun'] = {
		label = 'Burger bun',
		weight = 50
	},

	['baguette'] = {
		label = 'Baguette',
		weight = 50
	},

	['cheddar'] = {
		label = 'Cheddar cheese',
		weight = 20
	},

	['raw_chicken'] = {
		label = 'Raw chicken',
		weight = 150
	},

	['chicken_strips'] = {
		label = 'Chicken strips',
		weight = 150
	},

	['cooked_patty'] = {
		label = 'Cooked patty',
		weight = 150
	},

	['patty'] = {
		label = 'Patty',
		weight = 150
	},

	['sliced_onion'] = {
		label = 'Sliced onion',
		weight = 30
	},

	['lettuce'] = {
		label = 'Fresh salad',
		weight = 50
	},

	['tomato'] = {
		label = 'Tomato',
		weight = 50
	},

	['wrap'] = {
		label = 'Tortilla wrap',
		weight = 50
	},

	['sliced_potato'] = {
		label = 'Potato',
		weight = 200
	},

	['mojito'] = {
		label = 'Mojito',
		weight = 300
	},

	['vodka'] = {
		label = 'Vodka',
		weight = 300
	},

	['champagne'] = {
		label = 'Champagne',
		weight = 300
	},

	['tequila'] = {
		label = 'Tequila',
		weight = 300
	},

	['martini'] = {
		label = 'Martini',
		weight = 300
	},

	['icetea'] = {
		label = 'Icetea',
		weight = 300
	},

	['lemonade'] = {
		label = 'Lemonade',
		weight = 300
	},

--- lunar_drugscreator ---

	['ammonia'] = {
		label = 'Ammonia',
		weight = 500,
		stack = true,
	},

	['sodium_benzoate'] = {
		label = 'Sodium benzoate',
		weight = 750,
		stack = true,
	},

	['meth_tray'] = {
		label = 'Meth tray',
		weight = 1000,
		stack = true,
	},

	['meth'] = {
		label = 'Meth',
		weight = 1,
		stack = true,
	},

	['meth_bag'] = {
		label = 'Meth bag',
		weight = 50,
		stack = true,
	},

	['plastic_bag'] = {
		label = 'Plastic bag',
		weight = 40,
		stack = true,
	},

	['meth_syringe'] = {
		label = 'Meth syringe',
		weight = 75,
		stack = true,
	},

	-- Cocaine related items
	['coke_seed'] = {
		label = 'Cocaine seed',
		weight = 10,
		stack = true,
	},

	['coke_leaf'] = {
		label = 'Cocaine leaf',
		weight = 50,
		stack = true,
	},

	['coke_paste'] = {
		label = 'Cocaine paste',
		weight = 150,
		stack = true,
	},

	['coke'] = {
		label = 'Cocaine',
		weight = 1,
		stack = true,
	},

	['coke_bag'] = {
		label = 'Cocaine bag',
		weight = 50,
		stack = true,
	},

	['coke_brick'] = {
		label = 'Cocaine brick',
		weight = 200,
		stack = true,
	},

	['coke_doll'] = {
		label = 'Cocaine doll',
		weight = 500,
		stack = true,
	},

	-- Weed related items
	['weed_seed'] = {
		label = 'Weed seed',
		weight = 5,
		stack = true,
	},

	['weed_pot'] = {
		label = 'Flower Pot',
		weight = 500,
		stack = true,
	},

	['trowel'] = {
		label = 'Trowel',
		weight = 150,
		stack = true,
	},

	['weed_bud'] = {
		label = 'Weed bud',
		weight = 25,
		stack = true,
	},

	['clean_weed_bud'] = {
		label = 'Clean weed bud',
		weight = 20,
		stack = true,
	},

	['cookie_dough'] = {
		label = 'Cookie dough',
		weight = 200,
		stack = true
	},

	['weed_cookie'] = {
		label = 'Weed cookie',
		weight = 50,
		stack = true
	},

	['weed_bag'] = {
		label = 'Weed bag',
		weight = 50,
		stack = true,
	},

	['weed_joint'] = {
		label = 'Weed joint',
		weight = 15,
		stack = true,
	},

	['weed_papers'] = {
		label = 'Weed papers',
		weight = 5,
		stack = true,
	},

	-- Heroin related items
	['poppy_seeds'] = {
		label = 'Poppy seeds',
		weight = 5,
		stack = true,
	},

	['poppy_plant'] = {
		label = 'Poppy plant',
		weight = 100,
		stack = true,
	},

	['opium'] = {
		label = 'Opium',
		weight = 1,
		stack = true,
	},

	['heroin'] = {
		label = 'Heroin',
		weight = 1,
		stack = true,
	},

	['heroin_bag'] = {
		label = 'Heroin bag',
		weight = 50,
		stack = true,
	},

	['heroin_syringe'] = {
		label = 'Heroin syringe',
		weight = 75,
		stack = true,
	},

	['syringe'] = {
		label = 'Syringe',
		weight = 25,
		stack = true,
	},

	-- LSD related items
	['ergot_fungus'] = {
		label = 'Ergot fungus',
		weight = 50,
		stack = true,
	},

	['generic_leaf'] = {
		label = 'Leaf',
		weight = 20,
		stack = true,
	},

	['lsd_liquid'] = {
		label = 'LSD liquid',
		weight = 25,
		stack = true,
	},

	['lsd'] = {
		label = 'LSD',
		weight = 1,
		stack = true,
	},

	['art_papers'] = {
		label = 'Art papers',
		weight = 5,
		stack = true,
	},

	-- Ecstasy related items
	['safrole_oil'] = {
		label = 'Safrole oil',
		weight = 300,
		stack = true,
	},

	['ecstasy_crystals'] = {
		label = 'Ecstasy crystals',
		weight = 1,
		stack = true,
	},

	['ecstasy_pill'] = {
		label = 'Ecstasy pill',
		weight = 15,
		stack = true,
	},

	-- Mushroom related items
	['mushrooms'] = {
		label = 'Mushrooms',
		weight = 1,
		stack = true,
	},

	['mushroom_powder'] = {
		label = 'Mushroom powder',
		weight = 1,
		stack = true,
	},

	['chocolate_chips'] = {
		label = 'Chocolate chips',
		weight = 30,
		stack = true,
	},

	['mushroom_chocolate'] = {
		label = 'Mushroom chocolate',
		weight = 45,
		stack = true,
	},

	-- Ketamine related items
	['anesthetic'] = {
		label = 'anesthetic',
		weight = 200,
		stack = true,
	},

	['ketamine'] = {
		label = 'Ketamine',
		weight = 1,
		stack = true,
	},

	['ketamine_bag'] = {
		label = 'Ketamine bag',
		weight = 50,
		stack = true,
	},

	-- Crack related items
	['baking_soda'] = {
		label = 'Baking soda',
		weight = 100,
		stack = true,
	},

	['crack'] = {
		label = 'Crack',
		weight = 1,
		stack = true,
	},

	['crack_bag'] = {
		label = 'Crack bag',
		weight = 50,
		stack = true,
	},

	['crack_pipe'] = {
		label = 'Crack pipe',
		weight = 150,
		stack = true,
	},

	['crack_syringe'] = {
		label = 'Crack syringe',
		weight = 75,
		stack = true,
	},

	['pipe'] = {
		label = 'Pipe',
		weight = 100,
		stack = true,
	},

	-- Fentanyl related items
	['npp_chemical'] = {
		label = 'NPP chemical',
		weight = 300,
		stack = true,
	},

	['aniline_solution'] = {
		label = 'Aniline solution',
		weight = 250,
		stack = true,
	},

	['fentanyl'] = {
		label = 'Fentanyl',
		weight = 1,
		stack = true,
	},

	['fentanyl_bag'] = {
		label = 'Fentanyl bag',
		weight = 25,
		stack = true,
	},

	['meth_table'] = {
		label = 'Meth table',
		weight = 2250,
		stack = false
	},

	['coke_table'] = {
		label = 'Coke table',
		weight = 2250,
		stack = false
	},

	['weed_table'] = {
		label = 'Weed table',
		weight = 2250,
		stack = false
	},

	['chem_table'] = {
		label = 'Chemistry table',
		weight = 2250,
		stack = false
	},

	['burner_phone'] = {
		label = 'Burner phone',
		weight = 200,
		stack = true
	},

	['light1'] = {
		label = 'Portable Lamp',
		weight = 2000,
		stack = true
	},

	['light2'] = {
		label = 'Portable Lamp',
		weight = 2000,
		stack = true
	},

	['fertilizer'] = {
		label = 'Fertilizer',
		weight = 250,
		stack = true
	},

	['water_can'] = {
		label = 'Watering can',
		weight = 250,
		stack = true
	},
}