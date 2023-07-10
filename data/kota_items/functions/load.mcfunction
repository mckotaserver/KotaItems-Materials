# Load
#> function呼び出し
function kota_items:growing/load

#> スコアボード定義
scoreboard objectives add Constant dummy

scoreboard players set #-1 Constant -1
scoreboard players set #10 Constant 10
scoreboard players set #100 Constant 100
scoreboard players set #1000 Constant 1000
scoreboard players set #1000000 Constant 1000000

#> レシピ情報の更新
function kota_items:refresh_recipe_data
