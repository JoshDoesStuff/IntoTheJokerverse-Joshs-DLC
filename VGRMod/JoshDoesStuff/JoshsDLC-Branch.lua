local jokers_def =  {
    seventh_beat = {
        ["name"] = "On The 7th Beat",
        ["text"] = {
            "After every {C:attentio}7th card played",
            "This card gains {C:chips}+7 chips"
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
        4,
        7,
        true,
        true,
        true,
        true,
        '',
        '7thBeat',
        nil
    )
}


G.localization.misc.dictionary.k_sevenUpgrade = "S+"

init_localization()

SMODS.Sprite:new("7thBeat", SMODS.findModByID("VGRMod").path.."JoshDoesStuff/", "onThe7thBeat.png", 71, 95, "asset_atli"):register()

local seventally = 1

function Joker_Info.seventh_beat.loc_def(center)
    if context.individual and context.cardarea == G.play then
        return {center.ability.extra.curr_chips, center. ability.extra.chips_add}
    end
end

function Joker_Info.seventh_beat.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'rd_ref'}
end


Joker_Info.seventh_beat.calculate = function(self, context)
    if seventally == 7 and not context.repetition then
        
        seventally = 1

        self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod
        
        return {
            extra = {focus = self, message = localize('k_upgrade_ex')},
            card = self,
            colour = G.C.CHIPS
        } 
    else

        seventally = (seventally + 1)

    end

end

return Joker_Info