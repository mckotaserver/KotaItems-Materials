## データの途中変更予定がある場合の処理
# 一時データリセット
data modify storage kota_items:temp Growing.dataModifier set value {}

# 現在の成長レベルを目標値として取得
data modify storage kota_items:temp Growing.dataModifier.Index set from storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.Level

# 検索元データをセット
data modify storage kota_items:temp Growing.dataModifier.Input set from storage kota_items:temp Growing.RecipeSearch.Output.dataModifier

# 検索function実行
function kota_items:growing/data_modifier/search

# 一致したデータをアイテムのデータにmerge
data modify storage kota_items:temp Growing.ItemData merge from storage kota_items:temp Growing.dataModifier.Output.tag

# LoreのOriginalとして設定されているデータを上書き (Loreに変更予定があれば)
execute if data storage kota_items:temp Growing.dataModifier.Output.tag.display.Lore run data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.OriginalLore set from storage kota_items:temp Growing.dataModifier.Output.tag.display.Lore
