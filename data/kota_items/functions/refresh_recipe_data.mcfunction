##> レシピデータの更新
# リセット
data modify storage kota_items:core recipes set value {}

# Growing
data modify storage kota_items:core recipes.Growing set value []

data modify storage kota_items:core recipes.Growing append value {"Id":"dragon_shard",ProcessTime:[60,61,62,63]}
data modify storage kota_items:core recipes.Growing append value {"Id":"crystal_shard",ProcessTime:[120,200],dataModifier:[{"Level":1s,"tag":{display:{Name:'{"translate":"kota-items.misc.crystal_shard.name_1"}',Lore:['{"translate":"kota-items.misc.crystal_shard.lore_1"}']}}},{"Level":2s,"tag":{display:{Name:'{"translate":"kota-items.misc.crystal_shard.name_2"}',Lore:['{"translate":"kota-items.misc.crystal_shard.lore_2"}']}}}]}
