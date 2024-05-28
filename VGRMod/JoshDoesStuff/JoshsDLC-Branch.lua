local jokers_def =  {
    seventh_beat = {
        ["name"] = "On The 7th Beat",
        ["text"] = {
            "After every {C:attention}7th{} card played",
            "This card gains {C:chips}+7{} chips",
        }
    }, 
    
    fireAndIce = {
        ["name"] = "A Dance of Fire and Ice",
        ["text"] = {
            "After every {C:attention}7th{} hand played",
            "This card generates {C:attention}2 planet cards"
        }
    },

    scrungle = {
        ["name"] = "SCRUNGLE",
        ["text"] = {
            "Colby will lobotomize you",
        }
    },

    salvation = {
        ["name"] = "We, Are Your Salvation",
        ["text"] =  {"{C:attention}Prevents{} a game over",
        "Unless current blind is a {C:attention}Boss Blind{}",
        },
    }

    
} 


local Joker_Info  = {
    seventh_beat = SMODS.Joker:new(
        "On The 7th beat",
        "On The 7th beat",
        {extra = {chips = 0, chip_mod = 7}},
        {x = 0, y = 0},
        jokers_def.seventh_beat,
        2,
        7,
        true,
        true,
        true,
        true,
        '',
        '7thBeat',
        nil
    ),

    fireAndIce = SMODS.Joker:new(
        "A Dance of Fire and Ice",
        "A Dance of Fire and Ice",
        {extra = {chips=0}},
        {x = 0, y = 0},
        jokers_def.fireAndIce,
        3,
        7, 
        true,
        true,
        true,
        true, 
        '',
        'fireAndIce',
        nil
    ),

    scrungle = SMODS.Joker:new(
        "Scrungle",
        "Srcungle",
        {extra = {chips=0}},
        {x = 0, y = 0},
        jokers_def.scrungle,
        3,
        0,
        true,
        true,
        true,
        true,
        '',
        'scrungle',
        nil
    ),

    salvation = SMODS.Joker:new(
        "Salvation",
        "Salvation",
        {extra = {chips = 0}},
        {x = 0, y = 0},
        jokers_def.salvation,
        4,
        7,
        true,
        true,
        false,
        false,
        '',
        'salvation',
        nil
    ),

    
}


local function create_planet(joker, planet, other_joker)
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        local card_type = 'Planet'
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, planet, 'blusl')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                if other_joker then
                    other_joker:juice_up(0.5, 0.5)
                end
                return true
            end)
        }))

        -- Show message
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_plus_planet'),
            colour = G.C.SECONDARY_SET.Planet
        })
    else
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_no_space_ex')
        })
    end
end


G.localization.misc.dictionary.k_sevenUpgrade = "S+"

init_localization()

SMODS.Sprite:new("7thBeat", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "onThe7thBeat.png", 71, 95, "asset_atli"):register()

SMODS.Sprite:new("fireAndIce", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "fireAndIce.png", 71, 95, "asset_atli"):register()

SMODS.Sprite:new("scrungle", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "scrungle.png", 71, 95, "asset_atli"):register()

SMODS.Sprite:new("salvation", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "salvation.png", 71, 95, "asset_atli"):register()

seventally = 1
sevenHands = 1

function Joker_Info.seventh_beat.loc_def(center)

end

function Joker_Info.fireAndIce.loc_def(center)

end

function Joker_Info.seventh_beat.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'rd_ref'}
end

function Joker_Info.fireAndIce.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'adofai_ref'}
end

function Joker_Info.scrungle.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'scrungle_ref'}
end

function Joker_Info.salvation.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'destiny_ref'}
end


Joker_Info.seventh_beat.calculate = function(self, context)
    if context.individual then
        if context.cardarea == G.play then
            if seventally == 7 and not context.repetition then 
                seventally = 1
                print('upgraded')
                self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod
                return {
                    extra = {focus = self, message = localize('k_sevenUpgrade')},
                    card = self,
                    color = G.C.CHIPS
                }

            else 
                seventally = (seventally + 1)     
                return {

                }
            end
        end
    end
    if context.joker_main and self.ability.extra.chips ~= 0 then
       
        return {
            message = localize{type='variable', key='a_chips', vars={self.ability.extra.chips}},
            chip_mod = self.ability.extra.chips,
            card = self,
            colour = G.C.CHIPS
        } 
    end 
end


Joker_Info.fireAndIce.calculate = function(self, context)
    if context.individual then
        if context.cardarea == G.play then
        end
    end
    if context.joker_main then
        if sevenHands == 7 then
        
        create_planet(self, _planet, aurora_borealis)
        create_planet(self)

        sevenHands = 1

        else
        sevenHands = sevenHands + 1

        print(sevenHands)

        
        
    end
    end 
end



Joker_Info.scrungle.calculate = function(self, context)

    -- Shamelessly stolen from betma jokers code, because I have no clue how to do this but I needed it done for an assignment
    -- TODO:// Rewrite this in my own code. 

    if self.ability.name == "Scrungle" and context.joker_main then 
        self.ability.extra.added_to_deck = true --not the right place for this but eh
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('tarot1')
                    return true end }))
                for i=1, #G.hand.cards do
                    local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                end
    
                delay(0.5)
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i=1, #G.playing_cards do
                            local card = G.playing_cards[i]
                            local cen_pool = {}
                            for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                                cen_pool[#cen_pool+1] = v
                            end
                            center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))

                            card:set_ability(center, nil, true)
                        end  
                        return true
                    end}))
                
                for i=1, #G.hand.cards do
                    local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
                end
                delay(0.5)                


            end
        end



Joker_Info.salvation.calculate = function(self, context)

    if self.ability.name == "Salvation" and not G.GAME.blind.boss then
        self.debuff = false
        if context.game_over then
        return {
            message = localize('k_saved_ex'),
            saved = true,
            colour = G.C.RED
        }
    end
end

    
    if self.ability.name == "Salvation" and G.GAME.blind.boss then
        self.debuff = true
    end
end


return Joker_Info




