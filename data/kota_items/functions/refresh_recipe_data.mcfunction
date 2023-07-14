##> レシピデータの更新
# リセット
data modify storage kota_items:core recipes set value {}

# Growing
data modify storage kota_items:core recipes.Growing set value []

data modify storage kota_items:core recipes.Growing append value {"Id":"dragon_shard",ProcessTime:[60,61,62,63],"dataModifier":[{"Level":1s,"tag":{"display":{Name:'{"text":"testaaa_level1","italic":false}',Lore:['{"text":"LoreTestlvl1-1","italic":false,"color":"aqua"}']}}},{"Level":3s,"tag":{"display":{Name:'{"text":"ababa_levell2","italic":false}',Lore:['{"text":"LoreTestlvl3","italic":false}','{"text":"LoreTestlvl3-2","italic":false,"color":"yellow"}']}}}]}
data modify storage kota_items:core recipes.Growing append value {"Id":"crystal_shard",ProcessTime:[120,200]}
