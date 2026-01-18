local utils = require("utils")

setting_remove_space_science = settings.startup["yet-another-early-spidertron-remove-space-science"].value

-- Spidertron recipe: Replace rocket turret with processing units
utils.remove_recipe_ingredient("spidertron", "rocket-turret")
utils.remove_recipe_ingredient("spidertron", "carbon-fiber")  -- added by Pacifist to replace rocket-turret
utils.add_recipe_ingredient_item("spidertron", "processing-unit", 10)
utils.regenerate_recycling_recipe("spidertron")

-- Spidertron technology: Remove agricultural science, reduce cost and fix prerequisites
utils.set_tech_unit_count("spidertron", 1000)  -- default: 2500
utils.remove_tech_unit_ingredient("spidertron", "agricultural-science-pack")
utils.remove_tech_prerequisite("spidertron", "rocket-turret")
utils.remove_tech_prerequisite("spidertron", "carbon-fiber")  -- added by Pacifist to replace rocket-turret

-- Optionally remove the space science pack too
if setting_remove_space_science then
    utils.remove_tech_unit_ingredient("spidertron", "space-science-pack")
    utils.remove_tech_prerequisite("spidertron", "space-science-pack")
else
    utils.add_tech_prerequisite("spidertron", "space-science-pack")
end
