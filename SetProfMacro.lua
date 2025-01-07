-- Register the slash command for /set_prof1
SLASH_SETPROF1 = "/set_prof1"

local function SetProf1Macro(msg, editbox)
    -- Get the list of professions
    local p = {GetProfessions()}
    
    -- Check if the first profession exists
    if p[1] then
        -- Get the profession's name
        local n = GetProfessionInfo(p[1])
        
        -- Get the index for the "P2" macro
        local index = GetMacroIndexByName("P2")
        
        -- If the macro exists, update it
        if index ~= 0 then
            EditMacro(index, nil, nil, "#showtooltip\n/run C_CraftingOrders.PlaceNewOrder({ skillLineAbilityID=50287, orderType=2, orderDuration=0, tipAmount=100, customerNotes='', orderTarget=nil, reagentItems={}, craftingReagentItems={} })\n")
            print("Macro P2 updated for profession:", n)
        else
            print("Macro P2 not found!")
        end
    else
        print("No profession found.")
    end
end

-- Register the slash command handler for /set_prof1
SlashCmdList["SETPROF1"] = SetProf1Macro
