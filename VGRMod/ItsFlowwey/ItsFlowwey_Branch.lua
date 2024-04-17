
local jokers_def = {
	parsnip_seeds = { -- Parsnip Seeds
		["name"] = "Parsnip Seeds",
		["text"] = {
			"{C:mult}+#1#{} Mult after grown",
			"{C:mult}+#2#{} Mult per {V:1}#3#{} card held in hand",
			"Grown after triggering {C:attention}#4#{} times",
			"Resets at end of round",
			"{C:inactive}Plant these in the spring.",
			"{C:inactive}Takes 4 days to mature.{}"
		}
	},
	strawberry_seeds = { -- Strawberry Seeds
		["name"] = "Strawberry Seeds",
		["text"] = {
			"{X:mult,C:white}#1#X{} Mult after grown",
			"{X:mult,C:white}+#2#X{} Mult per {V:1}#3#{} card held in hand",
			"Grown after triggering {C:attention}#4#{} times",
			"Resets at end of round",
			"{C:inactive}Plant these in spring",
			"{C:inactive}Takes 8 days to mature.{}"
		}
	},
	starfruit_seeds = { -- Starfruit Seeds
		["name"] = "Starfruit Seeds",
		["text"] = {
			"Earn {C:money}#1#${} dollars after grown",
			"{C:money}+#2#${} per {V:1}#3#{} card held in hand",
			"Grown after triggering {C:attention}#4#{} times",
			"Resets at end of round",
			"{C:inactive}Plant these in spring",
			"{C:inactive}Takes 13 days to mature.{}"
		}
	},
	ancient_seeds = { -- Ancient Seeds
		["name"] = "Ancient Seeds",
		["text"] = {
			"{C:chips}+#1#{} Chips after grown",
			"{C:chips}+#2#{} Chips per {V:1}#3#{} card held in hand",
			"Grown after triggering {C:attention}#4#{} times",
			"Resets at end of round",
			"{C:inactive}Could these still grow?"
		}
	},
	power_shard = { -- Power Shard
		["name"] = "Power Shard",
		["text"] = {
			"The joker to the left", 
			"of this joker",
			"is {C:attention}Overclocked{} by {C:red}#1#%",
			"{C:attention}Output: #2#%"
		}
	},
	ace_up_your_sleeve = { -- Power Shard
		["name"] = "Ace Up Your Sleeve",
		["text"] = {
			"When round begins,",
			"add a random {C:attention}Ace",
			"with a random {C:dark_edition}Edition{}",
			"to your hand"
		}
	},
	backup_battery = { -- Backup Battery
		["name"] = "Backup Battery",
		["text"] = {
			"{C:attention}Use{} this joker",
			"to gain {C:blue}+#1#{} hands",
			"for this blind",
			"Disabled for {C:attention}3 blinds{} when used",
			"{C:attention}#2#{}"
		}
	},
	hacking_drone = { -- Hacking Drone
		["name"] = "Hacking Drone",
		["text"] = {
			"{C:attention}Use{} this joker",
			"to temporarily {C:attention}Debuff",
			"this blind for then",
			"next {C:attention}2{} hands"
		}
	},
	minnie_gun = { -- Minnie Gun
		["name"] = "Minnie Gun",
		["text"] = {
			"{C:chips}+#1#{} Chips",
			"Gains {C:chips}+#2#{} Chips",
			"when played hand contains",
			"a {C:attention}#3#{}"
		}
	},
	innervate = { -- Innervate
		["name"] = "Innervate",
		["text"] = {
			"+1 Hands",
			"When {C:attention}Blind{} is selected",
			"Add {C:attention}#1# Debuffed",
			"cards to deck",
		}
	},
}

-- SMODS.Joker:new(name, slug, config, spritePos, loc_txt, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat, effect, atlas, soul_pos)
--what each branch would look like
local Joker_Info = {
	parsnip_seeds = SMODS.Joker:new(
		"Parsnip Seeds", --name
		"parsnip_seeds", --slug
		{extra = {suit = 'Clubs', curr_mult = 0, mult_add = 6, trigger_req = 4, grown = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.parsnip_seeds, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	ancient_seeds = SMODS.Joker:new(
		"Ancient Seeds", --name
		"ancient_seeds", --slug
		{extra = {suit = 'Spades', curr_chips = 0, chips_add = 25, trigger_req = 7, grown = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.ancient_seeds, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	strawberry_seeds = SMODS.Joker:new(
		"Strawberry Seeds", --name
		"strawberry_seeds", --slug
		{extra = {suit = 'Hearts', curr_xmult = 1, xmult_add = 0.25, trigger_req = 8, grown = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.strawberry_seeds, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	starfruit_seeds = SMODS.Joker:new(
		"Starfruit Seeds", --name
		"starfruit_seeds", --slug
		{extra = {suit = 'Diamonds', curr_money = 0, money_add = 1, trigger_req = 13, grown = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.starfruit_seeds, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	power_shard = SMODS.Joker:new(
		"Power Shard", --name
		"power_shard", --slug
		{extra = {base_overclock = 0.5, curr_overclock = 1}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.power_shard, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	ace_up_your_sleeve = SMODS.Joker:new(
		"Ace Up Your Sleeve", --name
		"ace_up_your_sleeve", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.ace_up_your_sleeve, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	backup_battery = SMODS.Joker:new(
		"Backup Battery", --name
		"backup_battery", --slug
		{extra = {hand_gain = 4, blind_disabled_count = 0}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.backup_battery, --loc_txt
		1, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	hacking_drone = SMODS.Joker:new(
		"Hacking Drone", --name
		"hacking_drone", --slug
		{extra = {used = false, debuffed_blind_count = 2, blind_reactive = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.hacking_drone, --loc_txt
		1, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	minnie_gun = SMODS.Joker:new(
		"Minnie Gun", --name
		"minnie_gun", --slug
		{extra = {curr_chips = 12, chips_gain = 12, hand = 'Three of a Kind'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.minnie_gun, --loc_txt
		1, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	),
	innervate = SMODS.Joker:new(
		"Innervate", --name
		"innervate", --slug
		{extra = {cards_debuffed_count = 2}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.innervate, --loc_txt
		1, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		'VGRMod_Jokers', --atlas
		nil --soul_pos
	)
}

SMODS.Sprite:new("VGRMod_Jokers", SMODS.findModByID("VGRMod").path.."ItsFlowwey/", "VGRMod_Jokers.png", 71, 95, "asset_atli"):register()
G.localization.misc.dictionary.k_grown = "Grown!"
G.localization.misc.dictionary.k_harvested = "Harvested!"
G.localization.descriptions.Other['stardew_valley_ref'] = {
	name = 'Stardew Valley Reference',
	text = {
		'This Joker is',
		'from',
		'{C:attention}Stardew Valley{}'
	}
}
G.localization.misc.dictionary.k_hacked = "Hacked!"
G.localization.misc.dictionary.k_hand_remaining = "1 Hand Remaining!"
G.localization.misc.dictionary.k_reenabled = "Re-enabled!"
G.localization.misc.v_dictionary['backup_active'] = "Active!"
G.localization.misc.v_dictionary['backup_inactive'] = "#1# blinds remaining"
G.localization.descriptions.Other['ftl_ref'] = {
	name = 'FTL Reference',
	text = {
		'This Joker is',
		'from',
		'{C:spectral}FTL: Faster',
		'{C:spectral}Than Light{}'
	}
}
G.localization.descriptions.Other['satis_ref'] = {
	name = 'Satisfactory Reference',
	text = {
		'This Joker is',
		'from',
		'{C:attention}Satisfactory'
	}
}
G.localization.descriptions.Other['overclock'] = {
	name = 'Overclock',
	text = {
		'This Joker is',
		'from',
		'{C:attention}Satisfactory'
	}
}
G.localization.descriptions.Other['dndg_ref'] = {
	name = 'D&DG Reference',
	text = {
		'This Joker is',
		'from',
		'{C:attention}Dungeons',
		'{C:attention}& Degenerate Gamblers'
	}
}
G.localization.misc.dictionary['k_plus_innerve'] = "+1 Debuffed Cards"
G.localization.descriptions.Other['osfe_ref'] = {
	name = 'OSFE Reference',
	text = {
		'This Joker is a',
		'from',
		'{C:attention}One Step',
		'{C:attention}From Eden'
	}
}
G.localization.descriptions.Other['board_game'] = {
	name = 'BOARD GAME???',
	text = {
		'HOW DID YOU GET HERE?'
	}
}

init_localization()

--Joker UIBox Info
function Joker_Info.parsnip_seeds.loc_def(center)
	if center.ability.name == 'Parsnip Seeds' then
		return {center.ability.extra.curr_mult, center.ability.extra.mult_add, localize(center.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.trigger_req}
	end
end
function Joker_Info.ancient_seeds.loc_def(center)
	if center.ability.name == 'Ancient Seeds' then
		return {center.ability.extra.curr_chips, center.ability.extra.chips_add, localize(center.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.trigger_req}
	end
end
function Joker_Info.strawberry_seeds.loc_def(center)
	if center.ability.name == 'Strawberry Seeds' then
		return {center.ability.extra.curr_xmult, center.ability.extra.xmult_add, localize(center.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.trigger_req}
	end
end
function Joker_Info.starfruit_seeds.loc_def(center)
	if center.ability.name == 'Starfruit Seeds' then
		return {center.ability.extra.curr_money, center.ability.extra.money_add, localize(center.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.trigger_req}
	end
end
function Joker_Info.power_shard.loc_def(center)
	if center.ability.name == 'Power Shard' then
		local power_shard_train = 1
		local left_disconnect = false
		local right_disconnect = false
		if G.jokers then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == center then 
					for ii = 1, i-1 do
						if G.jokers.cards[i-ii]and G.jokers.cards[i-ii].ability.name == 'Power Shard' and right_disconnect ~= true then 
							if G.jokers.cards[i-ii+1] and G.jokers.cards[i-ii+1].ability.name ~= 'Power Shard' then
								right_disconnect = true
							else
								power_shard_train = power_shard_train + 1
							end
						end
					end
					for ii = 1, #G.jokers.cards-i do
						if G.jokers.cards[i+ii]and G.jokers.cards[i+ii].ability.name == 'Power Shard' and left_disconnect ~= true then 
							if G.jokers.cards[i+ii-1] and G.jokers.cards[i+ii-1].ability.name ~= 'Power Shard' then
								left_disconnect = true
							else
								power_shard_train = power_shard_train + 1
							end
						end
					end
				end
			end
		end
		local total_overclock = 1 + center.ability.extra.base_overclock*power_shard_train
		center.ability.extra.curr_overclock = total_overclock
		return {center.ability.extra.base_overclock, center.ability.extra.curr_overclock*100}
	end
end
function Joker_Info.backup_battery.loc_def(center)
	if center.ability.name == 'Backup Battery' then
		return {center.ability.extra.hand_gain, localize{type = 'variable', key = (center.ability.extra.blind_disabled_count == 0 and 'backup_active' or 'backup_inactive'), vars = {center.ability.extra.blind_disabled_count}}}
	end
end
function Joker_Info.minnie_gun.loc_def(center)
	if center.ability.name == 'Minnie Gun' then
		return {center.ability.extra.curr_chips, center.ability.extra.chips_gain, localize(center.ability.extra.hand, 'poker_hands')}
	end
end
function Joker_Info.innervate.loc_def(center)
	if center.ability.name == 'Innervate' then
		return {center.ability.extra.cards_debuffed_count}
	end
end

--Joker Tooltips
function Joker_Info.parsnip_seeds.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'stardew_valley_ref'}
end
function Joker_Info.ancient_seeds.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'stardew_valley_ref'}
end
function Joker_Info.strawberry_seeds.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'stardew_valley_ref'}
end
function Joker_Info.starfruit_seeds.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'stardew_valley_ref'}
end
function Joker_Info.power_shard.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'satis_ref'}
end
function Joker_Info.ace_up_your_sleeve.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'dndg_ref'}
end
function Joker_Info.backup_battery.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'ftl_ref'}
end
function Joker_Info.hacking_drone.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'ftl_ref'}
end
function Joker_Info.minnie_gun.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'osfe_ref'}
end
function Joker_Info.innervate.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'osfe_ref'}
end

--Parsnip Seeds
Joker_Info.parsnip_seeds.calculate = function(self, context)
	if not context.blueprint then
		if context.end_of_round and not context.repetition and not context.individual then
			self.ability.extra.curr_mult = 0
			self.ability.extra.grown = false
			return {
				message = localize('k_harvested')
			}
		end
		if context.individual and not context.end_of_round and context.cardarea == G.hand and context.other_card:is_suit("Clubs") then
			if context.other_card.debuff then
				return {
					message = localize('k_debuffed'),
					colour = G.C.RED,
					card = self
				}
			else
				self.ability.extra.curr_mult = self.ability.extra.curr_mult + self.ability.extra.mult_add
				if self.ability.extra.curr_mult == self.ability.extra.mult_add*self.ability.extra.trigger_req and self.ability.extra.grown ~= true then
					self.ability.extra.grown = true
					return {
						message = localize('k_grown'),
						card = self
					}
				else
					return {
						message = localize('k_upgrade_ex'),
						card = self
					}
				end
			end
		end
	end
	if SMODS.end_calculate_context(context) then
		if self.ability.extra.grown == true then
			return {
				message = localize{type='variable',key='a_mult',vars={self.ability.extra.curr_mult}},
				mult_mod = self.ability.extra.curr_mult
			}
		end
	end
end
--Strawberry Seeds
Joker_Info.strawberry_seeds.calculate = function(self, context)
	if not context.blueprint then
		if context.end_of_round and not context.repetition and not context.individual then
			self.ability.extra.curr_xmult = 1
			self.ability.extra.grown = false
			return {
				message = localize('k_harvested')
			}
		end
		if context.individual and not context.end_of_round and context.cardarea == G.hand and context.other_card:is_suit("Hearts") then
			if context.other_card.debuff then
				return {
					message = localize('k_debuffed'),
					colour = G.C.RED,
					card = self
				}
			else
				self.ability.extra.curr_xmult = self.ability.extra.curr_xmult + self.ability.extra.xmult_add
				if self.ability.extra.curr_xmult == self.ability.extra.xmult_add*self.ability.extra.trigger_req and self.ability.extra.grown ~= true then
					self.ability.extra.grown = true
					return {
						message = localize('k_grown'),
						card = self
					}
				else
					return {
						message = localize('k_upgrade_ex'),
						card = self
					}
				end
			end
		end
	end
	if SMODS.end_calculate_context(context) then
		if self.ability.extra.grown == true then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.curr_xmult}},
				colour = G.C.RED,
				Xmult_mod = self.ability.extra.curr_xmult
			}
		end
	end
end
--Ancient Seeds
Joker_Info.ancient_seeds.calculate = function(self, context)
	if not context.blueprint then
		if context.end_of_round and not context.repetition and not context.individual then
			self.ability.extra.curr_chips = 0
			self.ability.extra.grown = false
			return {
				message = localize('k_harvested')
			}
		end
		if context.individual and not context.end_of_round and context.cardarea == G.hand and context.other_card:is_suit("Spades") then
			if context.other_card.debuff then
				return {
					message = localize('k_debuffed'),
					colour = G.C.RED,
					card = self
				}
			else
				self.ability.extra.curr_chips = self.ability.extra.curr_chips + self.ability.extra.chips_add
				if self.ability.extra.curr_chips == self.ability.extra.chips_add*self.ability.extra.trigger_req and self.ability.extra.grown ~= true then
					self.ability.extra.grown = true
					return {
						message = localize('k_grown'),
						card = self
					}
				else
					return {
						message = localize('k_upgrade_ex'),
						card = self
					}
				end
			end
		end
	end
	if SMODS.end_calculate_context(context) then
		if self.ability.extra.grown == true then
			return {
				message = localize{type='variable',key='a_chips',vars={self.ability.extra.curr_chips}},
				chip_mod = self.ability.extra.curr_chips, 
				colour = G.C.CHIPS
			}
		end
	end
end
--Starfruit Seeds
Joker_Info.starfruit_seeds.calculate = function(self, context)
	if not context.blueprint then
		if context.end_of_round and not context.repetition and not context.individual then
			self.ability.extra.grown = false
			return {
				message = localize('k_harvested')
			}
		end
		if context.individual and not context.end_of_round and context.cardarea == G.hand and context.other_card:is_suit("Diamonds") then
			if context.other_card.debuff then
				return {
					message = localize('k_debuffed'),
					colour = G.C.RED,
					card = self
				}
			else
				self.ability.extra.curr_money = self.ability.extra.curr_money + self.ability.extra.money_add
				if self.ability.extra.curr_money == self.ability.extra.money_add*self.ability.extra.trigger_req and self.ability.extra.grown ~= true then
					self.ability.extra.grown = true
					return {
						message = localize('k_grown'),
						card = self
					}
				else
					return {
						message = localize('k_upgrade_ex'),
						card = self
					}
				end
			end
		end
	end
end
--Power Shard
Joker_Info.power_shard.calculate = function(self, context)
	local other_joker = nil
	local power_shard_train = 1
	local left_disconnect = false
	local right_disconnect = false
	if G.jokers then
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == self then 
				for ii = 1, i-1 do
					if G.jokers.cards[i-ii]and G.jokers.cards[i-ii].ability.name == 'Power Shard' and right_disconnect ~= true then 
						if G.jokers.cards[i-ii+1] and G.jokers.cards[i-ii+1].ability.name ~= 'Power Shard' then
							right_disconnect = true
						else
							power_shard_train = power_shard_train + 1
						end
					end
				end
				for ii = 1, #G.jokers.cards-i do
					if G.jokers.cards[i+ii]and G.jokers.cards[i+ii].ability.name == 'Power Shard' and left_disconnect ~= true then 
						if G.jokers.cards[i+ii-1] and G.jokers.cards[i+ii-1].ability.name ~= 'Power Shard' then
							left_disconnect = true
						else
							power_shard_train = power_shard_train + 1
						end
					end
				end
			end
		end
	end
	local total_overclock = 1 + self.ability.extra.base_overclock*power_shard_train
	self.ability.extra.curr_overclock = total_overclock
	for i = 1, #G.jokers.cards do
		if G.jokers.cards[i].ability.overclocked then G.jokers.cards[i].ability.overclocked = nil end
		if G.jokers.cards[i] == self then other_joker = G.jokers.cards[i+1] end
	end
	if other_joker and other_joker ~= self and other_joker.ability.name ~= 'Power Shard' then
		other_joker.ability.overclocked = true
	end
end
--Ace Up Your Sleeve
Joker_Info.ace_up_your_sleeve.calculate = function(self, context)
	if context.first_hand_drawn then
		G.E_MANAGER:add_event(Event({
			func = function() 
				local _card = create_playing_card({
					front = pseudorandom_element({G.P_CARDS.S_A,G.P_CARDS.D_A,G.P_CARDS.C_A,G.P_CARDS.H_A}, pseudoseed('auys_ace')), 
					center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.EDITION})
				local edition_type = pseudorandom_element({{foil = true}, {holo = true}, {polychrome = true}}, pseudoseed('auys_edition'))
				_card:set_edition(edition_type, true)
				G.GAME.blind:debuff_card(_card)
				G.hand:sort()
				if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
				return true
			end}))

		playing_card_joker_effects({true})
	end
end
--Backup Battery
Joker_Info.backup_battery.calculate = function(self, context)
	if context.setting_blind and not self.getting_sliced and not context.blueprint then
		if self.ability.extra.blind_disabled_count ~= 0 then 
			self.ability.extra.blind_disabled_count = self.ability.extra.blind_disabled_count - 1
		end
		if self.ability.extra.blind_disabled_count == 0 then
			local eval = function(card) return (card.ability.extra.blind_disabled_count == 0) and not G.RESET_JIGGLES end
			juice_card_until(self, eval, true)
		end
	end
end
function Joker_Info.backup_battery.use(card)
	ease_hands_played(card.ability.extra.hand_gain)
	card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hand_gain}}})
	card.ability.extra.blind_disabled_count = 2
end
function Joker_Info.backup_battery.can_use(card)
	if G.STATE == G.STATES.SELECTING_HAND and card.ability.extra.blind_disabled_count == 0 then
		return true
	else
		return false
	end
end
--Hacking Drone
Joker_Info.hacking_drone.calculate = function(self, context)
	if context.setting_blind and not self.getting_sliced and (G.GAME.blind:get_type() == 'Boss') then
		local eval = function(card) return (G.GAME.blind:get_type() == 'Boss' and card.ability.extra.used ~= true) end
		juice_card_until(self, eval, true)
	end
	if self.ability.extra.used == true and self.ability.extra.debuffed_blind_count ~= 0 and self.ability.extra.blind_reactive == false then
		if context.cardarea == G.jokers and context.after and not context.individual then
			self.ability.extra.debuffed_blind_count = self.ability.extra.debuffed_blind_count - 1
			if self.ability.extra.debuffed_blind_count == 0 then
				self.ability.extra.blind_reactive = true
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_reenabled'), color = G.C.BLUE})
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,
					func = function()
						G.GAME.blind.disabled = false
						G.GAME.blind:set_text()
						if G.GAME.blind.name == 'The Needle' then 
							G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
							ease_hands_played(-G.GAME.blind.hands_sub)
						end
						if G.GAME.blind.name == 'The Manacle' then
							G.hand:change_size(-1)
						end
						for _, v in ipairs(G.playing_cards) do
							G.GAME.blind:debuff_card(v)
						end
						if G.GAME.blind.name == 'The Eye' and not reset then
							G.GAME.blind.hands = {
								["Flush Five"] = false,
								["Flush House"] = false,
								["Five of a Kind"] = false,
								["Straight Flush"] = false,
								["Four of a Kind"] = false,
								["Full House"] = false,
								["Flush"] = false,
								["Straight"] = false,
								["Three of a Kind"] = false,
								["Two Pair"] = false,
								["Pair"] = false,
								["High Card"] = false,
							}
						end
						if G.GAME.blind.name == 'The Mouth' and not reset then
							G.GAME.blind.only_hand = false
						end
						if G.GAME.blind.name == 'The Fish' and not reset then 
							G.GAME.blind.prepped = nil
						end
						if G.GAME.blind.name == 'The Water' and not reset then 
							G.GAME.blind.discards_sub = G.GAME.current_round.discards_left
							ease_discard(-G.GAME.blind.discards_sub)
						end
						if G.GAME.blind.name == 'The Wall' then G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*4*G.GAME.starting_params.ante_scaling end
						if G.GAME.blind.name == 'Violet Vessel' then G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*6*G.GAME.starting_params.ante_scaling end
						return true
					end
				})) 

			else
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_hand_remaining'), color = G.C.BLUE})
			end
		end
	end
	if context.end_of_round then
		if self.ability.extra.used == true then self.ability.extra.used = false end
	end
end
function Joker_Info.hacking_drone.use(card)
	G.GAME.blind:disable()
	card.ability.extra.debuffed_blind_count = 2
	card.ability.extra.used = true
	card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_hacked'), color = G.C.BLUE})
end
function Joker_Info.hacking_drone.can_use(card)
	if G.STATE == G.STATES.SELECTING_HAND and G.GAME.blind:get_type() == 'Boss' and card.ability.extra.used == false then
		return true
	else
		return false
	end
end
--Minnie Gun
Joker_Info.minnie_gun.calculate = function(self, context)
	if context.cardarea == G.jokers and not context.individual and context.before and next(context.poker_hands[self.ability.extra.hand]) then
		self.ability.extra.curr_chips = self.ability.extra.curr_chips + self.ability.extra.chips_gain
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.CHIPS,
			card = self
		}
	end
	if SMODS.end_calculate_context(context) then
		return {
			message = localize{type='variable',key='a_chips',vars={self.ability.extra.curr_chips}},
			chip_mod = self.ability.extra.curr_chips, 
			colour = G.C.CHIPS
		}
	end
end
--Innervate
Joker_Info.innervate.calculate = function(self, context)
	if context.setting_blind and not self.getting_sliced then
		ease_hands_played(1)
		for i = 1, self.ability.extra.cards_debuffed_count do
			G.E_MANAGER:add_event(Event({
				func = function() 
					local front = pseudorandom_element(G.P_CARDS, pseudoseed('innerve_front'))
					G.playing_card = (G.playing_card and G.playing_card + 1) or 1
					local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
					card:start_materialize({G.C.SECONDARY_SET.Enhanced})
					G.play:emplace(card)
					table.insert(G.playing_cards, card)
					card.debuffed_from_innerve = true
					card:set_debuff()
					return true
				end}))
			card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_innerve'), colour = G.C.SECONDARY_SET.Enhanced})

			G.E_MANAGER:add_event(Event({
				func = function() 
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					return true
				end}))
				draw_card(G.play,G.deck, 90,'up', nil)

			playing_card_joker_effects({true})
		end
	end
end
local CardSet_debuff = Card.set_debuff
function Card:set_debuff(should_debuff)
	CardSet_debuff(self, should_debuff)
	if self.debuffed_from_innerve then
		self.debuff = true
		return 
	end
end
local CardRemove_from_deck_ref = Card.add_to_deck
function Card.remove_from_deck(self, from_debuff)
	if self.added_to_deck then
		if self.ability.name == 'Innervate' then
			ease_hands_played(-1)
		end
	end
	CardRemove_from_deck_ref(self)
end

local CardCalc_joker = Card.calculate_joker
function Card.calculate_joker(self, context)
	if self.debuff then return nil end
	if self.ability.set == "Joker" and not self.debuff then
		--Overclock Logic
		if self.ability.overclocked and self.ability.overclocked == true and context.first_pass ~= false then 
			context.first_pass = false
			if (SMODS.end_calculate_context(context) == true) or 
			(context.individual and (context.cardarea == G.play or context.cardarea == G.hand)) or 
			(context.other_joker) then
				local joker_return = self:calculate_joker(context)
				if not joker_return then sendInfoMessage("Joker has no return") end
				if joker_return then
					local overclocked_amount
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i] == self then overclocked_amount = G.jokers.cards[i-1].ability.extra.curr_overclock end
					end

					if context.individual then 
						if joker_return.chips then
							joker_return.chips = joker_return.chips*overclocked_amount
						end
						if joker_return.mult then
							joker_return.mult = joker_return.mult*overclocked_amount
						end
						if joker_return.x_mult then
							joker_return.x_mult = joker_return.x_mult*overclocked_amount
						end
						if joker_return.dollars then
							joker_return.dollars = joker_return.dollars*overclocked_amount
						end
						if joker_return.h_mult then
							joker_return.h_mult = joker_return.h_mult*overclocked_amount
						end
					end
					if SMODS.end_calculate_context(context) == true or context.other_joker then
						if joker_return.chip_mod then 
							joker_return.chip_mod = joker_return.chip_mod*overclocked_amount
							if joker_return.message then
								joker_return.message = localize{type='variable',key='a_chips',vars={joker_return.chip_mod}}
							end
						end
						if joker_return.mult_mod then 
							joker_return.mult_mod = joker_return.mult_mod*overclocked_amount
							if joker_return.message then
								joker_return.message = localize{type='variable',key='a_mult',vars={joker_return.mult_mod}}
							end
						end
						if joker_return.Xmult_mod then 
							joker_return.Xmult_mod = joker_return.Xmult_mod*overclocked_amount
							if joker_return.message then
								joker_return.message = localize{type='variable',key='a_xmult',vars={joker_return.Xmult_mod}}
							end
						end
					end
				end
				return joker_return
			end
		end
	end
	return CardCalc_joker(self, context)
end

--Money Joker Setup
local Cardcalculate_dollar_bonus_ref = Card.calculate_dollar_bonus
function Card.calculate_dollar_bonus(self)
	if self.ability.set == "Joker" and not self.debuff then
		if self.ability.overclocked and self.ability.overclocked == true and not self.ability.first_pass then --Overclock Logic
			self.ability.first_pass = true
			local joker_orig_money = self:calculate_dollar_bonus()
			self.ability.first_pass = nil
			if joker_orig_money then
				local overclocked_amount
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] == self then overclocked_amount = G.jokers.cards[i-1].ability.extra.curr_overclock end
				end
				joker_orig_money = math.floor(joker_orig_money*overclocked_amount)
			end
			return joker_orig_money
		end
		if self.ability.name == 'Starfruit Seeds' then
			local money_to_make = self.ability.extra.curr_money
			self.ability.extra.curr_money = 0
			return money_to_make
		end
	end
	return Cardcalculate_dollar_bonus_ref(self)
end

return Joker_Info
