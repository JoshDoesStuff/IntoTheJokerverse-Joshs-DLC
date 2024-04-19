local jokers_def {
    seventh_beat = {
        ["name"] = "On The 7th Beat",
        ["text"] = {
            "After every {C:attention}#7th# card played",
            "This card gains {C:chips}+#7# chips"
        }
    }
} 


local Joker_Info {
    seventh_beat = SMODS.Joker:new(
        "On The 7th beat",
        "On The 7th beat",
        jokers_def.seventh_beat
        {extra = {chips = 0, chip_mod = 7}}
        {x = 0, y = 0}
        4,
        7,
        true,
        true,
        true,
        true,
        '',
        'VGRMOD_Jokers',
        nil
    )
}


G.localization.misc.dictionary.k_sevenUpgrade = "S+"

init_localization()

let seventally = 0

function Joker_Info.seventh_beat.loc_def(center)
    if center.ability.name == 'On The 7th Beat' then
        return {center.ability.extra.curr_chips, center. ability.extra.chips_add}

end

function Joker_Info.seventh_beat.tooltip(card, info_queue)
	info_queue[#info_queue+1] = {set = 'Other', key = 'rd_ref'}
end


Joker_Info.seventh_beat.calculate = function(self, context, seventally)
    if seventally == 7 then
        
        seventally = 0

        self.ability.extra.chips = self.ability.extra.chips + self.ability.extra.chip_mod
        
        return {
            extra = {focus = self, message = localize('k_upgrade_ex')},
            card = self,
            colour = G.C.CHIPS
        }

    end

    if seventally < 7 then

        seventally = seventally + 1

    end

   

end

return Joker_Info