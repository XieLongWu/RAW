-- Lib
Ext.Require("RAW_Lib.lua")

-- Config
Ext.Require("RAW_Config.lua")
RAW_LoadModOptions()

-- StatsLoaded Event
local RAW_StatsLoadedPath = "StatsLoaded/"

Ext.Require(RAW_StatsLoadedPath .. "RAW_Attunement.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Barbarian_Berserker.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_CantripsScaling.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_CharacterPassives.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Concentration.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_DefaultActions.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_EquipAction.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_ExtraAttack.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Feats.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_InstantDeath.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Invisibility.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Monk.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Rogue.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Rogue_Thief.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_SkillCheck_CritFail.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_BonusAction.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_Spells_Duration.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_TwoWeaponFighting.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponSets.lua")
Ext.Require(RAW_StatsLoadedPath .. "RAW_WeaponSpells.lua")

local function RAW_StatsLoaded()
    RAW_PrintIfDebug("\n====================================================================================================", RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Start"), RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_ShouldPrint_ModOptions)

    RAW_LoadVanillaStatFileParents()

    RAW_Attunement()
    RAW_Barbarian_Berserker()
    -- RAW_CantripsScaling()
    RAW_CharacterPassives()
    RAW_Concentration()
    RAW_DefaultActions()
    RAW_EquipAction()
    RAW_ExtraAttack()
    RAW_Feats()
    RAW_InstantDeath()
    RAW_InvisibilityStats()
    RAW_Monk()
    RAW_Rogue()
    RAW_Rogue_Thief()
    RAW_SkillCheck_CritFail()
    RAW_Spells_BonusAction()
    RAW_Spells_Duration()
    RAW_TwoWeaponFighting()
    RAW_WeaponSets_Passive()
    RAW_WeaponSpells()

    RAW_PrintIfDebug("\n====================================================================================================", RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug(CentralizedString("[RAW:BootstrapShared.lua] StatsLoaded Ended"), RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_ShouldPrint_ModOptions)
end

Ext.Events.StatsLoaded:Subscribe(RAW_StatsLoaded)

-- Osiris Files
local RAW_OsirisFilesPath = "Osiris/"

Ext.Require(RAW_OsirisFilesPath .. "RAW_Invisibility.lua")
Ext.Require(RAW_OsirisFilesPath .. "RAW_WeaponSets.lua")

if Ext.IsServer() then
    RAW_PrintIfDebug("\n====================================================================================================", RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug(CentralizedString("[RAW:BootstrapShared.lua] Osiris Registration Start"), RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_ShouldPrint_ModOptions)

    RAW_InvisibilityServer()
    RAW_WeaponSets()

    RAW_PrintIfDebug("\n====================================================================================================", RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug(CentralizedString("[RAW:BootstrapShared.lua] Osiris Registration Ended"), RAW_ShouldPrint_ModOptions)
    RAW_PrintIfDebug("====================================================================================================\n", RAW_ShouldPrint_ModOptions)
end

-- To-do: Activate this when the changes to RAW_Config.lua ShowError is made
-- Menu event for Config popup
-- Ext.Events.GameStateChanged:Subscribe(function(e)
--     if e.ToState == "Menu" then
--         RAW_LoadModOptions(true)
--     end
-- end)
