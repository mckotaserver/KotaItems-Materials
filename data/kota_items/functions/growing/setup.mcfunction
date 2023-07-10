## Setup
#> アイテムデータの取得
data modify storage kota_items:temp Growing.ItemSetup set from entity @s Item.tag.KotaServer.Custom.Growing

#> タイマー・UUIDのスコア設定
# タイマー目標を設定 (レシピを検索、目標値を設定)
data modify storage kota_items:temp Growing.RecipeSearch.Input set from entity @s Item.tag.KotaServer.Id
function kota_items:growing/recipe_search/_

execute unless data entity @s Item.tag.KotaServer.Custom.Growing.ProcessTime run data modify entity @s Item.tag.KotaServer.Custom.Growing.ProcessTime set from storage kota_items:temp Growing.RecipeSearch.Output.ProcessTime

execute store result score @s KotaItems.Growing_AgeTarget run data get entity @s Item.tag.KotaServer.Custom.Growing.ProcessTime[0]

# 全成長段階数の設定
execute store result score $StepsTotal KotaItems.Temp run data get storage kota_items:temp Growing.RecipeSearch.Output.ProcessTime
execute store result entity @s Item.tag.KotaServer.Custom.Growing.StepsCount int 1 run scoreboard players get $StepsTotal KotaItems.Temp

# UUID
scoreboard players operation @s UUID = @p UUID

# タグ付与
tag @s add KotaItems.Growing

#> 後処理
scoreboard players reset @a KotaItems.Growing_ItemDropping

