require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Ucitava uobicajeno ponasanje plugina 

        ["core.norg.concealer"] = {}, -- Dodaje ikonice dokumentima

        ["core.norg.dirman"] = { -- Upravlja Neorg radnim prostorima(workspaces)
            config = {
                workspaces = {
                    notes = "~/notes",
                },
                default_workspace = "notes",
            },
        },

        ["core.presenter"] = { -- Powerpoint prezentacije
            config = {
                zen_mode = "zen-mode",
            },
        },

        ["core.export"] = {},

    },
}
