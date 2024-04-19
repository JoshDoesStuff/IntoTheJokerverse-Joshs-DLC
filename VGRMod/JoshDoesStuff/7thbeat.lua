--- STEAMODDED HEADER
--- MOD_NAME: Into The Jokerverse: On The 7th Beat
--- MOD_ID: SevenBeat
--- MOD_AUTHOR: Josh
--- MOD_DESCRIPTION: On The 7th Beat
----------------------------------------------
------------MOD CODE -------------------------



function SMODS.INIT.JAPI()
    local loc_def = {
        ["name"] = "On The 7th Beat",
        ["text"] = {
            [1] = "Origin: Rhythm Doctor & 7th Beat Games",
            [2] = "Every 7th card scored gives +7 chips to that card",
        }
    }

    -- SMODS.Joker:new(name, slug, config, spritePos, loc_txt, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat)
    local joker_test = SMODS.Joker:new("On The 7th Beat", "7thbeat", {}, {
        x = 0,
        y = 0
    }, loc_def, 1, 4)

    SMODS.Sprite:new("7thbeat", SMODS.findModByID("BeatTest").path, "onThe7thBeat.png", 71, 95, "asset_atli"):register();

    joker_test:register()

    SMODS.Jokers.7thbeat.calculate = function(self, context)
        if SMODS.end_calculate_context(context) then
            return {
                mult_mod = 20,
                card = self,
                colour = G.C.RED,
                message = "Perfect - +0ms"
            }

        end
    end
end

----------------------------------------------
------------MOD CODE END------------