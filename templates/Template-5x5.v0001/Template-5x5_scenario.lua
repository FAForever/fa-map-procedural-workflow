version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Template-5x5",
    description = "",
    preview = '',
    map_version = 1,
    type = 'skirmish',
    starts = true,
    size = {256, 256},
    reclaim = {0, 0},
    map = '/maps/Template-5x5.v0001/Template-5x5.scmap',
    save = '/maps/Template-5x5.v0001/Template-5x5_save.lua',
    script = '/maps/Template-5x5.v0001/Template-5x5_script.lua',
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
