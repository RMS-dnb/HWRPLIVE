### MUST READ

This model replaces the weapon_revolver_cattleman_mexican.
If you want to replace a different knife/melee weapon, here is a list of knives you can replace:


# Weapon Name                        Weapon Model Name
weapon_melee_knife_jawbone 			w_melee_knife03
weapon_melee_knife_rustic			w_melee_knife24
weapon_melee_knife_trader			w_melee_knife23

weapon_melee_machete				w_melee_machete01
weapon_melee_machete_collector		w_melee_machete03

weapon_melee_cleaver				w_melee_hatchet02
weapon_melee_hatchet				w_melee_hatchet01
weapon_melee_hatchet_hunter			w_melee_hatchet07

You will change the Weapon Name in the <Name> entry in the .meta file and sc.lua, and you will change the model names in the stream folder to the 
matching model name for the same weapon from the list above.

# example of change for the weapon model from the rustic knife to the hunter hatchet:
https://ibb.co/nq95qTjb

!Most weapon models (Aside from melee weapons) have a +hi texture which is the high res texture dict, you must change it's name too,
for eg.
`w_revolver_cattleman02+hi` -> `w_melee_knife02+hi`

Other weapons will work, but they will need further manipulation, for example a pistol will work, but since it has multiple moving pieces,
like barrel, clip and grip. They will need to be streamed over with an empty model, or disabled as an attatchment.