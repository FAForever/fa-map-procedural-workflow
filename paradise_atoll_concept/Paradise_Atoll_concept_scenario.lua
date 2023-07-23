version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Paradise Atoll Concept",
    description = "",
    preview = '',
    map_version = 1,
    type = 'skirmish',
    starts = true,
    size = {1024, 1024},
    reclaim = {50400, 0},
    map = '/maps/paradise_atoll_concept/paradise_atoll_concept.scmap',
    save = '/maps/paradise_atoll_concept/paradise_atoll_concept_save.lua',
    script = '/maps/paradise_atoll_concept/paradise_atoll_concept_script.lua',
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
