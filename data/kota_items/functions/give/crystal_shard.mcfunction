## アイテム直入手
# /loot でアイテム召喚
loot spawn ~ ~ ~ loot kota_items:crystal_shard

# 設定用function
function kota_items:give/general/has_lore
function kota_items:give/general/set_unstackable

# 即時回収できるよう
data modify entity @e[type=item,sort=nearest,limit=1] PickupDelay set value 0

