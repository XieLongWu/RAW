local modOption = "weaponSets"
local debugLog = IsModOptionLogging(modOption)

local function RAW_RegisterWeaponSetEvent()
    Ext.Osiris.RegisterListener("Equipped", 2, "after",
        function(item, char)
            if not RAW_Bool(Osi.IsPlayer(char)) then
                return
            end

            local slot = Osi.GetEquipmentSlotForItem(item)

            -- 3: MeleeMainHand | 4: MeleeOffHand
            if slot == 3 or slot == 4 then
                local rangedOffWeapon = Osi.GetEquippedItem(char, "Ranged Offhand Weapon")
                if rangedOffWeapon ~= nil then
                    Osi.Unequip(char, rangedOffWeapon)
                end

                local rangedMainWeapon = Osi.GetEquippedItem(char, "Ranged Main Weapon")
                if rangedMainWeapon ~= nil then
                    Osi.Unequip(char, rangedMainWeapon)
                end
            end

            -- 5: RangedMainHand | 6: RangedOffHand
            if slot == 5 or slot == 6 then
                local meleeOffWeapon = Osi.GetEquippedItem(char, "Melee Offhand Weapon")
                if meleeOffWeapon ~= nil then
                    Osi.Unequip(char, meleeOffWeapon)
                end

                local meleeMainWeapon = Osi.GetEquippedItem(char, "Melee Main Weapon")
                if meleeMainWeapon ~= nil then
                    Osi.Unequip(char, meleeMainWeapon)
                end
            end
        end
    )
end

function RAW_WeaponSets()
    RAW_PrintIfDebug("\n====================================================================================================", debugLog)
    RAW_PrintIfDebug(CentralizedString("Option: " .. modOption), debugLog)

    if not IsModOptionEnabled(modOption) then
        RAW_PrintIfDebug(CentralizedString("Disabled!"), debugLog)
        RAW_PrintIfDebug("====================================================================================================\n", debugLog)
        return
    end

    RAW_PrintIfDebug(CentralizedString("Enabled!"), debugLog)

    RAW_RegisterWeaponSetEvent()

    RAW_PrintIfDebug("\n" .. CentralizedString("Finished the Weapon Set Restrictions"), debugLog)
    RAW_PrintIfDebug("====================================================================================================\n", debugLog)
end
