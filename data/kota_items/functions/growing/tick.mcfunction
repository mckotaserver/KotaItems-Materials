# Tick
#> 投げられた直後のアイテムをセットアップ
execute as @a at @s if score @s KotaItems.Growing_ItemDropping matches 1.. anchored eyes as @e[type=item,sort=nearest,limit=1] if predicate kota_items:flags/can_grow run function kota_items:growing/setup

#> 成長処理 & Ageが一定値に達したらステップ進行
# タイマー加算
execute at @a as @e[tag=KotaItems.Growing,distance=..16] if score @s UUID = @p UUID run scoreboard players add @s KotaItems.Growing_Age 1

#> もろもろ
# 未設定のプレイヤーにUUIDを設定
execute as @a unless score @s UUID = @s UUID store result score @s UUID run data get entity @s UUID[0]
