RegisterNetEvent("f4st-stand:RegisterStash", function(label)
    exports.ox_inventory:RegisterStash(label, label, 50, 5000000, nil)
end)
