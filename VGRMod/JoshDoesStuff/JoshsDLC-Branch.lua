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

    
}


G.localization.misc.dictionary.k_sevenUpgrade = "S+"

init_localization()

SMODS.Sprite:new("7thBeat", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "onThe7thBeat.png", 71, 95, "asset_atli"):register()

SMODS.Sprite:new("fireAndIce", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "fireAndIce.png", 71, 95, "asset_atli"):register()

seventally = 1
sevenHands = 1

function Joker_Info.seventh_beat.loc_def(center)

end

function Joker_Info.fireAndIce.loc_def(center)

end

function Joker_Info.seventh_beat.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'rd_ref'}
end


Joker_Info.seventh_beat.calculate = function(self, context)
    if context.individual then
        if context.cardarea == G.play then
            if seventally == 7 and not context.repetition then 
                seventally = 1
                print('upgraded')
                self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod
                return {
                    extra = {focus = self, message = localize('k_upgrade_ex')},
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
    if context.joker_main then
        if sevenHands == 7 then
        
        end
        else 

        sevenHands = (sevenHands + 1)
        

    end
end

return Joker_Info