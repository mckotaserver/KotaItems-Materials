## 疑似乱数生成
# 出力値リセット
scoreboard players set $RandomNumber KotaItems.Temp 0

# バイナリ法で生成
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 1
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 2
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 4
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 8
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 16
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 32
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 64
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 128
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 256
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 512
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 1024
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 2048
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 4096
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 8192
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 16384
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 32768
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 65536
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 131072
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 262144
execute if predicate kota_items:misc/1-n/02 run scoreboard players add $RandomNumber KotaItems.Temp 524288

scoreboard players operation $RandomNumber KotaItems.Temp %= #1000000 Constant 
