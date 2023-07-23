version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Template-20x20",
    description = "",
    preview = '',
    map_version = 1,
    type = 'skirmish',
    starts = true,
    size = {1024, 1024},
    reclaim = {0, 0},
    map = '/maps/Template-20x20.v0001/Template-20x20.scmap',
    save = '/maps/Template-20x20.v0001/Template-20x20_save.lua',
    script = '/maps/Template-20x20.v0001/Template-20x20_script.lua',
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
