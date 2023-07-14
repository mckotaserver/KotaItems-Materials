## 成長処理
# Ageをリセット
scoreboard players set @s KotaItems.Growing_Age 0

# アイテムデータの取得
data modify storage kota_items:temp Growing.ItemData set from entity @s Item.tag

say OnGrow0

#> 目標Ageを次の段階へ変更
# 内部データから目標Ageを取得
execute store result score @s KotaItems.Growing_AgeTarget run data get storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.ProcessTime[0]

# 取得済みのAgeをデータから削除
data remove storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.ProcessTime[0]

# 次の目標データがなければ目標をリセット, 成長しないように
execute unless data storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.ProcessTime[0] run scoreboard players set @s KotaItems.Growing_AgeTarget -1
execute unless data storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.ProcessTime[0] run data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.ProcessTime set value "null"

say err1

#> 成長レベルを加算, CMDなどデータ改変
# 成長レベルを+1, ストレージに戻す
execute store result score $GrowthLevel KotaItems.Temp run data get storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.Level
scoreboard players add $GrowthLevel KotaItems.Temp 1

execute store result storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.Level short 1 run scoreboard players get $GrowthLevel KotaItems.Temp

#> データの都度書換処理
# データベースを検索, 途中変更があるかな
data modify storage kota_items:temp Growing.RecipeSearch.Input set from entity @s Item.tag.KotaServer.Id
function kota_items:growing/recipe_search/_

say err2

# 途中変更の予定がある場合は該当function実行
execute if data storage kota_items:temp Growing.RecipeSearch.Output.dataModifier[0] run function kota_items:growing/data_modifier/_

say err3

# CMDの変更
execute store result score $CustomModelData KotaItems.Temp run data get storage kota_items:temp Growing.ItemData.CustomModelData
scoreboard players add $CustomModelData KotaItems.Temp 1

execute store result storage kota_items:temp Growing.ItemData.CustomModelData int 1 run scoreboard players get $CustomModelData KotaItems.Temp

#> 成長レベルのLore表示
# 成長度合い(%)の計算
execute store result score $GrowthPercentage KotaItems.Temp run data get storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.Level 100
execute store result score $StepsCount KotaItems.Temp run data get storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.StepsCount

scoreboard players operation $GrowthPercentage KotaItems.Temp /= $StepsCount KotaItems.Temp

execute store result storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthPercentage int 1 run scoreboard players get $GrowthPercentage KotaItems.Temp

data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthLore set value []

data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthLore append string storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthPercentage
data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthLore append value "%"

# Loreを初期状態へリセット
data modify storage kota_items:temp Growing.ItemData.display.Lore set from storage kota_items:temp Growing.ItemData.KotaServer.Custom.OriginalLore

#> 変更後のデータをアイテムに移動
# Item Modifierを利用して成長度合いをLoreに追加 (エンティティ状態では直接適用できないためItemDisplayを介す)
summon item_display ~ ~ ~ {item:{id:"minecraft:stone",Count:1b,tag:{}},Tags:["KotaItems.Temp"]}
data modify entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] item.tag set from storage kota_items:temp Growing.ItemData

item modify entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] container.0 kota_items:growing/percentage_display

data modify entity @s Item.tag set from entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] item.tag

kill @e[tag=KotaItems.Temp,limit=1,sort=nearest]

#> 演出
# playsound
execute at @s run playsound block.glass.break master @a ~ ~ ~ 1 2

# particle
execute at @s run particle witch ~ ~ ~ 0 0 0 0.1 10


say on grow final