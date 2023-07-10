## 疑似乱数生成
# 出力値リセット
data modify storage kota_items:temp RandomUUID set value [I;0,0,0,0]

# UUIDから直接取得
summon marker ~ ~ ~ {Tags:["Random"]}
data modify storage kota_items:temp RandomUUID set from entity @e[tag=Random,limit=1] UUID
kill @e[tag=Random]
