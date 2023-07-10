## Lore持ちアイテム用の設定
# オリジナルのLoreデータを内部に格納
data modify entity @e[type=item,sort=nearest,limit=1] Item.tag.KotaServer.Custom.OriginalLore set from entity @e[type=item,sort=nearest,limit=1] Item.tag.display.Lore

# Item Modifierを利用して成長度合いをLoreに追加 (エンティティ状態では直接適用できないためItemDisplayを介す)
summon item_display ~ ~ ~ {item:{id:"minecraft:stone",Count:1b,tag:{}},Tags:["KotaItems.Temp"]}
data modify entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] item.tag set from entity @e[type=item,sort=nearest,limit=1] Item.tag

data modify storage kota_items:temp Growing.ItemData.KotaServer.Custom.Growing.GrowthLore set value ["0","%"]
item modify entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] container.0 kota_items:growing/percentage_display

data modify entity @e[type=item,sort=nearest,limit=1] Item.tag set from entity @e[tag=KotaItems.Temp,limit=1,sort=nearest] item.tag

kill @e[tag=KotaItems.Temp,limit=1,sort=nearest]
