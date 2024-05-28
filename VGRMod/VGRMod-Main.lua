--- STEAMODDED HEADER
--- MOD_NAME: Into the Jokerverse
--- MOD_ID: VGRMod
--- MOD_AUTHOR: [ItsFlowwey, JoshDoesStuff, Balatro Discord]
--- MOD_DESCRIPTION: Video game crossover themed mod
--- DISPLAY_NAME: Into the Jokerverse

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.VGRMod_Main()
	local VGRMod_File = SMODS.findModByID("VGRMod") --Main VGRMod Path
	--Add Your Master Lua File here
	local VGRMod_branches = {
		-- '/ItsFlowwey/ItsFlowwey_Branch.lua',
		'JoshDoesStuff/JoshsDLC-branch.lua'
	}

	local function init_jokers()
		for i, v in ipairs(VGRMod_branches) do
			local curr_branch = NFS.load(VGRMod_File.path .. VGRMod_branches[i])()
			for kk, vv in pairs(curr_branch) do
				vv:register()
			end
		end
	end

	--Add game ref tooltip here
	local game_ref_list = {
		stardew_valley_ref = {
			name = 'Stardew Valley Reference',
			text = {
				'This Joker is',
				'from',
				'{C:attention}Stardew Valley{}'
			}
		},
		ftl_ref = {
			name = 'FTL Reference',
			text = {
				'This Joker is',
				'from',
				'{C:spectral}FTL: Faster',
				'{C:spectral}Than Light{}'
			}
		},
		satis_ref = {
			name = 'Satisfactory Reference',
			text = {
				'This Joker is',
				'from',
				'{C:attention}Satisfactory'
			}
		},
		dndg_ref = {
			name = 'D&DG Reference',
			text = {
				'This Joker is',
				'from',
				'{C:attention}Dungeons',
				'{C:attention}& Degenerate Gamblers'
			}
		},
		osfe_ref = {
			name = 'OSFE Reference',
			text = {
				'This Joker is a',
				'from',
				'{C:attention}One Step',
				'{C:attention}From Eden'
			}
		},
		board_game = {
			name = 'BOARD GAME???',
			text = {
				'HOW DID YOU GET HERE?'
			}
		},
		rd_ref = {
			name = "Rhythm Doctor Refrence",
			text = {
				"This Joker is from",
				"{C:attention}Rhythm Doctor"
			}
		},

		adofai_ref = {
			name = "ADOFAI Reference",
			text = {
				"This Joker is from",
				"{C:attention}A Dance of Fire and Ice"
			},
		},

		scrungle_ref = {
			name = "Get Scrungled, Idiot",
			text = {
				"From an Inside Joke",
				"I mean, an unreleased video game",
				"This is totally on topic for the mod",
				"I swear"
			}
		},
		
		destiny_ref = {
			name = "Destiny 1/2 Reference",
			text = {
				"This Joker is from",
				"{C:attention}Destiny 1/2{}",
			}
		}
	}

	local function init_game_ref_tooltips()
		for k, v in pairs(game_ref_list) do
			G.localization.descriptions.Other[k] = v
		end
	end

	init_jokers()
	init_game_ref_tooltips()

	-- If your joker has special API, add here
	-- Code from autumnmood on discord, Joker can_use API
	-- active items
	local alias__G_UIDEF_use_and_sell_buttons = G.UIDEF.use_and_sell_buttons;
	function G.UIDEF.use_and_sell_buttons(card)
		local ret = alias__G_UIDEF_use_and_sell_buttons(card)
		
		if card.config.center.key and card.area and card.area.config.type == 'joker' then
			local center_obj = SMODS.Jokers[card.config.center.key]
			if center_obj and center_obj.can_use and center_obj.use and type(center_obj.can_use) == 'function' and type(center_obj.use) == 'function' then
				local nodes_todo = {n=G.UIT.R, config={align = 'cl'}, nodes={
					{n=G.UIT.C, config={ref_table = card, align = "cr",maxw = 1.25, padding = 0.1, r=0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_joker', func = 'can_use_joker'}, nodes={
						{n=G.UIT.B, config = {w=0.1,h=0.6}},
						{n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
					}}
				}}
				table.insert(ret.nodes[1].nodes, nodes_todo)
			end
		end
		
		return ret
	end

	G.FUNCS.can_use_joker = function(e)
		if e.config.ref_table:can_use_joker() then 
			e.config.colour = G.C.RED
			e.config.button = 'use_joker'
		else
			e.config.colour = G.C.UI.BACKGROUND_INACTIVE
			e.config.button = nil
		end
	end

	G.FUNCS.use_joker = function(e, mute, nosave)
		print("using a joker")
		e.config.button = nil
		local card = e.config.ref_table
		local area = card.area
		local prev_state = G.STATE
		local dont_dissolve = true
		local delay_fac = 1

		if card:check_use() then 
		G.E_MANAGER:add_event(Event({func = function()
			e.disable_button = nil
			e.config.button = 'use_joker'
		return true end }))
		return
		end
		
		G.STATE = G.STATES.PLAY_TAROT
		G.CONTROLLER.locks.use = true
		if card.ability.usable and (not card.ability.usable == false) then
			if G.booster_pack and not G.booster_pack.alignment.offset.py and (card.ability.consumeable or not (G.GAME.pack_choices and G.GAME.pack_choices > 1)) then
			G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
			G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
			end
			if G.shop and not G.shop.alignment.offset.py then
			G.shop.alignment.offset.py = G.shop.alignment.offset.y
			G.shop.alignment.offset.y = G.ROOM.T.y + 29
			end
			if G.blind_select and not G.blind_select.alignment.offset.py then
			G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
			G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
			end
			if G.round_eval and not G.round_eval.alignment.offset.py then
			G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
			G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
			end
		end
		
		G.TAROT_INTERRUPT = G.STATE
		local center_obj = SMODS.Jokers[card.config.center.key]
		if center_obj and center_obj.can_use and center_obj.use and type(center_obj.can_use) == 'function' and type(center_obj.use) == 'function' then
			--draw_card(G.hand, G.play, 1, 'up', true, card, nil, mute)
			--area:remove_card(card)
			area:remove_from_highlighted(card)
			play_sound('cardSlide2', nil, 0.3)
			delay(0.2)
			e.config.ref_table:use_consumeable(area)
			for i = 1, #G.jokers.cards do
				--need to figure out how to make a new context without breaking things
				--G.jokers.cards[i]:calculate_joker({using_consumeable = true, consumeable = card})
			end
		end
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,
			func = function()
				if not dont_dissolve then card:start_dissolve() end
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,
				func = function()
					G.STATE = prev_state
					G.TAROT_INTERRUPT=nil
					G.CONTROLLER.locks.use = false

					if card.ability.usable and (not card.ability.usable == false) then
					if G.shop then 
						G.shop.alignment.offset.y = G.shop.alignment.offset.py
						G.shop.alignment.offset.py = nil
					end
					if G.blind_select then
						G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
						G.blind_select.alignment.offset.py = nil
					end
					if G.round_eval then
						G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
						G.round_eval.alignment.offset.py = nil
					end
					end
					--draw_card(G.play, G.jokers, 1, 'up', true, card, nil, mute)
					if area and area.cards[1] then 
						G.E_MANAGER:add_event(Event({func = function()
						G.E_MANAGER:add_event(Event({func = function()
							G.CONTROLLER.interrupt.focus = nil
							if area then
							G.CONTROLLER:recall_cardarea_focus(area)
							end
						return true end }))
						return true end }))
					end
				return true
			end}))
			return true
		end}))
	end

	function Card:can_use_joker(any_state, skip_check)
		if not skip_check and ((G.play and #G.play.cards > 0) or
			(G.CONTROLLER.locked) or
			(G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
			then  return false end
		if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or any_state then
		end
		local t = nil
		local key = self.config.center.key
		local center_obj = SMODS.Jokers[key]
		if self.debuff then return false end
		if center_obj and center_obj.can_use and type(center_obj.can_use) == 'function' then
			t = center_obj.can_use(self) or t
		end
		if not (t == nil) then
			return t
		else
			return false
		end
	end

	-- to allow jokers to be used
	local alias__Card_use_consumeable = Card.use_consumeable
	function Card:use_consumeable(area, copier)
		local key = self.config.center.key
		local center_obj = SMODS.Jokers[key]
		if center_obj and center_obj.use and type(center_obj.use) == 'function' then
			stop_use()
			--if not copier then set_consumeable_usage(self) end
			if self.debuff then return nil end
			
			-- TODO figure this out
			--if self.ability.consumeable.max_highlighted then
				--update_hand_text({ immediate = true, nopulse = true, delay = 0 },
					--{ mult = 0, chips = 0, level = '', handname = '' })
			--end
			
			center_obj.use(self, area, copier)
		else
			alias__Card_use_consumeable(self, area, copier)
		end
	end
end

----------------------------------------------
------------MOD CODE END----------------------
