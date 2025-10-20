Slots = { ---- Maximum slots for each role/identifer
    default = 4,
    role = { --- role will override default
        superadmin = 5,
        admin = 5,
    },
    identifier = { --- identifier will override role and default
        ["license:bbfc6c52e6f60f369ab05c6050511ca74b827649"] = 6,
    }
}

PedPermission = { --- Access to ped model in the creator for each role/identifier
    default = false, ---- true = access, false = no access
    role = { --- role will override default
        superadmin = false,
        admin = false,
    },
    identifier = { --- identifier will override role and default
        ["license:40459a8e4fd14f7af205a34f33ec035121e7b7fa"] = true, ----nouiman
        ["license:4cbc1c57966e6a48a5d96866977a344cc3e84625"] = true, ----nouima
        ["license:45e7c763fe14fd53de5c1ec8feea1fb39a5869f6"] = true, ----tom
        ["license:4812d05232df3765147ab954322c9df2feb18318"] = true, ----vincent
        ["license:b3a2d231385814f5878da9a8c01848627ab5aaec"] = true, ---daLOTA WINTER
        ["license:bbfc6c52e6f60f369ab05c6050511ca74b827649"] = true, ----keates
        ["license:d60e6b3569dd4c6c94b0a3b888fbf366be4dcc68"] = true, ----leona steele
        ["license:ff52a61709c72da504804303118da003c5e62904"] = true, ----Evangeline Fairchild
        ["license:844b70b15ee8484ba979977c311e24b92630fec7"] = true, ---rat
        ["license:27ae8ac0047bd929ffb451e0fc2a8021f28f08c3"] = true, -- Zepic
        ["license:96f66177ba2d0d138dd657fb8de685f4be24620d"] = true, -- Harold
        ["license:161e1d6131c241bd5add261009c68b9a8dfa1789"] = true, -- Willard
        ["license:868224291704ea785e45f4f932071493dae06a3a"] = true, -- Willard
        ["license:f097ec667240ec381b31fd55efc22d767659084d"] = true, -- Willard
        ["license:e0ee8eb04f643c21d61e77a0050b205993f4b042"] = true, -- Willard
        ["license:b7d6f06843ff64953be20a4bda29b403b0a56917"] = true, -- CinnerH
        ["license:b58f9a4b2d3d8d1ad7a2c631ae70b342d7501754"] = true, -- johny leopold
        ["license:7eaf6c5c5d24c09e7d95858bfe53c33a9628d377"] = true, -- Niko Vasquez

    }   


}