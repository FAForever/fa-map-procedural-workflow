version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Template-10x10",
    description = "",
    preview = '',
    map_version = 1,
    type = 'skirmish',
    starts = true,
    size = {512, 512},
    reclaim = {0, 0},
    map = '/maps/Template-10x10.v0001/Template-10x10.scmap',
    save = '/maps/Template-10x10.v0001/Template-10x10_save.lua',
    script = '/maps/Template-10x10.v0001/Template-10x10_script.lua',
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
