local id = 0
local MPS = game:GetService("MarketplaceService")

MPS.ProcessReceipt = function(info)
    local plrId = info.PlayerId
    local productId = info.ProductId

    local plr = game.Players:GetPlayerByUserId(plrId)

    if productId == id then
        if plr then
            local stage = plr.leaderstats.Stage
            stage.Value = stage.Value + 1
            plr:LoadCharacter()
        end

        return Enum.ProductPurchaseDecision.PurchaseGranted
    end
end