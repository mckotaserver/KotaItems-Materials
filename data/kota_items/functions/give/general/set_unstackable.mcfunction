# スタック出来なくするため乱数生成, 適当なデータに適用
function kota_items:misc/rng-complex
data modify entity @e[type=item,sort=nearest,limit=1] Item.tag.KotaServer.UUID set from storage kota_items:temp RandomUUID
