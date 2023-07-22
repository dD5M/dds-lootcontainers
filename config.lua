Config = {}

-- ## Loot table
Config.Loottable = {
    [1] = {item = 'ammo-9',             chances = 3,    min = 1,    max = 3},
    [2] = {item = 'assmeth',            chances = 40,   min = 1,    max = 3},
    [3] = {item = 'plastic_bag_bulk',   chances = 78,   min = 1,    max = 3},
    [4] = {item = 'steel',              chances = 27,   min = 1,    max = 3},
    [5] = {item = 'advancedlockpick',   chances = 1,    min = 1,    max = 3},
    [6] = {item = 'aluminum',           chances = 27,   min = 1,    max = 3},
    [7] = {item = 'metalscrap',         chances = 27,   min = 1,    max = 3},
    [8] = {item = 'rubber',             chances = 27,   min = 1,    max = 3},
    [9] = {item = 'copper',             chances = 27,   min = 1,    max = 3},
    [10] = {item = 'glass',             chances = 27,   min = 1,    max = 3},
    [11] = {item = 'plastic',           chances = 27,   min = 1,    max = 3},
    [12] = {item = 'iron',              chances = 27,   min = 1,    max = 3},
}

Config.Props = {
    {  --truck trailer
        prop = -1579533167,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --truck trailer
        prop = -877478386,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --truck trailer
        prop = 1152297372,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --Metal container
        prop = 1765283457,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --Metal container
        prop =  1067874014,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --Metal container
        prop = 874602658,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  -- airport luggage 1
        prop = -397607777,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --airport luggage 2
        prop = 1891269362,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --airport luggage 3
        prop = -1161911933,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --Pallet Boxes 1
        prop = 519908417,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    {  --Pallet Boxes 2
        prop = -188983024,
        settings = {
            loot = Config.Loottable,
            illegal = true,
            alertchance = 10,
            requireditem = 'WEAPON_CROWBAR',
            canlootmultiple = false,
            maxlootitem = 3 --If canlootmultiple is true
        }
    },
    -- {  --Custom Loot table example
    --     prop = -188983024,
    --     settings = {
    --         loot = {
    --             [1] = {item = 'ammo-9',              chances = 3,    min = 1,    max = 3},
    --             [2] = {item = 'assmeth',             chances = 40,   min = 1,    max = 3},
    --             [3] = {item = 'plastic_bag_bulk',    chances = 78,   min = 1,    max = 3},
    --             [4] = {item = 'steel',               chances = 27,   min = 1,    max = 3},
    --          },
    --        illegal = true,
    --        alertchance = 10,
    --        requireditem = 'WEAPON_CROWBAR',
    --        canlootmultiple = false,
    --        maxlootitem = 3 --If canlootmultiple is true
    --     },
    -- },
}


-- ## Reset Configs
Config.ResetOnReboot = false
Config.ResetTime = 15 -- If Config.ResetOnReboot = false. In minutes

-- ## Minigame Configs
Config.Minigame = 'ox_lib' -- Available options: false, 'qb-lock', 'memorygame', 'ps-ui'

-- ## Time Configs
Config.ProgressTime = 3 -- In secondes

-- ## Police Configs
Config.Dispatch = 'cd_dispatch' -- Available options: 'cd_dispatch' or 'qb-core'

-- ## Hurting Configs
Config.Hurting = true -- True will give a chance to the player to be hurt
Config.HurtChance = 40 -- If Config.Hurting = true. In percentage
Config.CanBleed = true -- Can the player bleed? / Requires qb-ambulancejob
Config.BleedChance = 30 -- If Config.CanBleed = true. In percentage
Config.HurtDamage = {
    min = 5,
    max = 15,
}
