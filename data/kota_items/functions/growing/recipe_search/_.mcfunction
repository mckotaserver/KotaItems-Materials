## レシピ情報の検索(実行パート)
#> 下準備
# 一時メモリを念のためリセット
data modify storage kota_items:temp Growing.RecipeSearch.Memory set value {}

# 検索するアイテムもIdを取得
data modify storage kota_items:temp Growing.RecipeSearch.Memory.Target set from entity @s Item.tag.KotaServer.Id

# データベースからレシピ情報をメモリにコピー
data modify storage kota_items:temp Growing.RecipeSearch.Memory.Main set from storage kota_items:core recipes.Growing

#> 検索処理の実行
function kota_items:growing/recipe_search/loop

#> データの移動
# アイテムにコピー
data modify storage kota_items:temp Growing.RecipeSearch.Result set from storage kota_items:temp Growing.RecipeSearch.Memory.Main[0]

# 総ステップ数の設定
execute store result score $Growing.ProcessSteps KotaItems.Temp run data get storage kota_items:temp Growing.RecipeSearch.Memory.Main[0].ProcessTime
execute store result storage kota_items:temp Growing.RecipeSearch.Result.ProcessStepTotal int 1 run scoreboard players get $Growing.ProcessSteps KotaItems.Temp

