# Tick
#> 投げられた直後のアイテムをセットアップ
execute as @a at @s if score @s KotaItems.Growing_ItemDropping matches 1.. anchored eyes as @e[type=item,sort=nearest,limit=1] if predicate kota_items:flags/can_grow run function kota_items:growing/setup

#> 成長処理 & Ageが一定値に達したらステップ進行
# タイマー加算
execute as @a at @s as @e[tag=KotaItems.Growing,distance=..16] if score @s UUID = @p UUID at @s if predicate kota_items:flags/location/can_grow if score @s KotaItems.Growing_AgeTarget matches 1.. run scoreboard players add @s KotaItems.Growing_Age 1

# 目標値に達したら成長処理実施
execute as @a at @s as @e[tag=KotaItems.Growing,distance=..16] if score @s UUID = @p UUID if score @s KotaItems.Growing_Age >= @s KotaItems.Growing_AgeTarget if data entity @s Item.tag.KotaServer.Custom.Growing.ProcessTime[0] run function kota_items:growing/on_grow
