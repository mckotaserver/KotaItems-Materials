## レシピ情報の検索(実行パート)
#> 下準備
# 一時メモリを念のためリセット
data modify storage kota_items:temp Growing.RecipeSearch.Memory set value {}

# 検索するアイテムのIdを取得
data modify storage kota_items:temp Growing.RecipeSearch.Memory.Target set from storage kota_items:temp Growing.RecipeSearch.Input

# データベースからレシピ情報をメモリにコピー
data modify storage kota_items:temp Growing.RecipeSearch.Memory.Main set from storage kota_items:core recipes.Growing

#> 検索処理の実行
function kota_items:growing/recipe_search/loop

#> データの移動
# アイテムにコピー
data modify storage kota_items:temp Growing.RecipeSearch.Output set from storage kota_items:temp Growing.RecipeSearch.Memory.Main[0]

