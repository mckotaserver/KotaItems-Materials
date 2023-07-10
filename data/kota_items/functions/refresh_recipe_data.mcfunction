##> レシピデータの更新
# リセット
data modify storage kota_items:core recipes set value {}

# Growing
data modify storage kota_items:core recipes.Growing set value []

data modify storage kota_items:core recipes.Growing append value {"Id":"dragon_shard",ProcessTime:[80,100,120,140]}
data modify storage kota_items:core recipes.Growing append value {"Id":"test_crystal",ProcessTime:[120,120,150,150]}
