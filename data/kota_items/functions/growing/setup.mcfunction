## Setup
#> 必要があればデータベースからレシピ情報取得
execute unless data entity @s Item.tag.KotaServer.Custom.Growing run function kota_items:growing/recipe_search/_
execute unless data entity @s Item.tag.KotaServer.Custom.Growing run data modify entity @s Item.tag.KotaServer.Custom.Growing set from storage kota_items:temp RecipeSearch.Result

#> アイテムデータの取得
data modify storage kota_items:temp Growing.ItemSetup set from entity @s Item.tag.KotaServer.Custom.Growing

#> タイマー・UUIDのスコア設定
# タイマー目標を設定
execute store result score @s KotaItems.Growing_AgeTarget run data get entity @s Item.tag.KotaServer.Custom.Growing.ProcessTime[0]

# UUID
scoreboard players operation @s UUID = @p UUID

#> 後処理
scoreboard players reset @a KotaItems.Growing_ItemDropping
