local utils = {}

-- Add an ingredient to a recipe
function utils.add_recipe_ingredient_item(name, item_name, amount)
    local recipe = data.raw.recipe[name]
    if recipe then
        recipe.ingredients = recipe.ingredients or {}
        table.insert(recipe.ingredients, {
            type = "item",
            name = item_name,
            amount = amount,
        })
    end
end

-- Remove an ingredient from a recipe
function utils.remove_recipe_ingredient(name, ingredient_name)
    local recipe = data.raw.recipe[name]
    if recipe and recipe.ingredients then
        for index, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == ingredient_name then
                table.remove(recipe.ingredients, index)
                return
            end
        end
    end
end

-- Regenerate recycling recipe for a given recipe (using functions from the quality mod)
function utils.regenerate_recycling_recipe(recipe_name)
    local recycling = require("__quality__.prototypes.recycling")
    local recipe = data.raw.recipe[recipe_name]
    if recipe ~= nil then
        recycling.generate_recycling_recipe(recipe)
    end
end

-- Set the amount of units needed for a technology
function utils.set_tech_unit_count(tech_name, new_count)
    local tech = data.raw.technology[tech_name]

    if tech and tech.unit then
        tech.unit.count = new_count
    end
end

-- Remove one ingredient (science pack) of a technology
function utils.remove_tech_unit_ingredient(tech_name, ingredient)
    local tech = data.raw.technology[tech_name]

    if tech and tech.unit then
        for index, ingredient_table in pairs(tech.unit.ingredients) do
            if ingredient_table[1] == ingredient then
                table.remove(tech.unit.ingredients, index)
                return
            end
        end
    end
end

-- Remove a prerequisite from a technology
function utils.remove_tech_prerequisite(tech_name, prerequisite_name)
    local tech = data.raw.technology[tech_name]

    if tech and tech.prerequisites then
        for index, prerequisite in pairs(tech.prerequisites) do
            if prerequisite == prerequisite_name then
                table.remove(tech.prerequisites, index)
                break
            end
        end
    end
end

return utils
