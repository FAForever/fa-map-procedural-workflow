version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Paradise_Atoll",
    description = "",
    preview = '',
    map_version = 1,
    type = 'skirmish',
    starts = true,
    size = {1024, 1024},
    reclaim = {0, 0},
    map = '/maps/Paradise_Atoll/Paradise_Atoll.scmap',
    save = '/maps/Paradise_Atoll/Paradise_Atoll_save.lua',
    script = '/maps/Paradise_Atoll/Paradise_Atoll_script.lua',
    norushradius = 40,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_17 NEUTRAL_CIVILIAN' ),
            },
        },
    },
}
