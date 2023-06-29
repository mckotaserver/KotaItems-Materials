## 与えられたデータに合致するレシピ情報を検索
#> 下準備
# 判定データを取得
data modify storage kota_items:temp Growing.RecipeSearch.Memory.Index set from storage kota_items:temp Growing.RecipeSearch.Memory.Main[0].Id

# 判定結果をリセット
data modify storage kota_items:temp Growing.RecipeSearch.Memory.CompareResult set value "null"

#> 判定
# 上書きをstore successして同じデータかどうか判定
execute store success storage kota_items:temp Growing.RecipeSearch.Memory.CompareResult byte 1 run data modify storage kota_items:temp Growing.RecipeSearch.Memory.Index set from storage kota_items:temp Growing.RecipeSearch.Memory.Target

# 一致しなければ該当データを削除、次のデータへ
execute if data storage kota_items:temp {Growing:{RecipeSearch:{Memory:{CompareResult:true}}}} run data remove storage kota_items:temp Growing.RecipeSearch.Memory.Main[0]
execute if data storage kota_items:temp {Growing:{RecipeSearch:{Memory:{CompareResult:true}}}} run function kota_items:growing/recipe_search/loop

