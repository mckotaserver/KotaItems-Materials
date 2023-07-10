# Tick
# function呼び出し
function kota_items:growing/tick

#> もろもろ
# 未設定のプレイヤーにUUIDを設定
execute as @a unless score @s UUID = @s UUID store result score @s UUID run data get entity @s UUID[0]
