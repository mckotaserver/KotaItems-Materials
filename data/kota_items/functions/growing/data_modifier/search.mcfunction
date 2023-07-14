## 現在の成長レベルに合致する途中変更予定があるかの判定
# メモリを解放
data remove storage kota_items:temp Growing.dataModifier.Memory

# Inputの[0].Levelを取得
data modify storage kota_items:temp Growing.dataModifier.Memory.Input set from storage kota_items:temp Growing.dataModifier.Input[0].Level

# 判定結果をリセット
data modify storage kota_items:temp Growing.dataModifier.Memory.CompareResult set value "null"

# ↑ がIndexと合致するか判定
execute store success storage kota_items:temp Growing.dataModifier.Memory.CompareResult byte 1 run data modify storage kota_items:temp Growing.dataModifier.Memory.Input set from storage kota_items:temp Growing.dataModifier.Index

# CompareResultが1(両データが一致しない場合)はInput[0]を削除し、次へ ([1]がなければそこで処理終了)
execute if data storage kota_items:temp {Growing:{dataModifier:{Memory:{CompareResult:1b}}}} run data remove storage kota_items:temp Growing.dataModifier.Input[0]
execute if data storage kota_items:temp {Growing:{dataModifier:{Memory:{CompareResult:1b}}}} if data storage kota_items:temp Growing.dataModifier.Input[0] run function kota_items:growing/data_modifier/search

# CompareResultが0(両データが一致する場合)は検索処理を終了
execute if data storage kota_items:temp {Growing:{dataModifier:{Memory:{CompareResult:0b}}}} run data modify storage kota_items:temp Growing.dataModifier.Output set from storage kota_items:temp Growing.dataModifier.Input[0]

