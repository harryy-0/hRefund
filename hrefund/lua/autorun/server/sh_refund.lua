util.AddNetworkString("hrefund_openui")
util.AddNetworkString("hrefund_giverefund")
util.AddNetworkString("hrefund_errormessage")

Access = {
	Usergroups = {
		"superadmin",
		"admin"
	},
	
	SteamIDs = {
		"76561198114248672"
	}
}



hook.Add("PlayerSay", "RefundCommand", function(ply, txt)

	if ( string.lower( txt ) == "!refund" ) then

	if (not table.HasValue(Access.Usergroups, ply:GetUserGroup())) and (not table.HasValue(Access.SteamIDs, ply:SteamID64())) then 

	hrefund_message("You do not have access to the menu.", ply)

	return end
		net.Start("hrefund_openui")
		net.Send(ply)
	end
end)


function hrefund_message(msg, ply)
	net.Start("hrefund_errormessage")
	net.WriteString(msg)
	net.Send(ply)
end


net.Receive("hrefund_giverefund", function(_, ply)

	if (not table.HasValue(Access.Usergroups, ply:GetUserGroup())) and (not table.HasValue(Access.SteamIDs, ply:SteamID64())) then 
	hrefund_message("You do not have access to the menu.", ply)
	return end


	local target = net.ReadEntity()

	local isMoney = net.ReadBool()

	local refundItem = net.ReadString()

	if isMoney == true then 
		refundItem = tonumber(refundItem)

		if not (isnumber(refundItem)) then 

		hrefund_message("You need to type a number.", ply)

		return end

		target:addMoney(refundItem)
		hrefund_message("You have refunded "..target:Nick().." "..DarkRP.formatMoney(refundItem)..".", ply)

	else

		if not weapons.Get(refundItem) then 

		hrefund_message( refundItem.." is not a valid weapon.", ply)

		return end

		if target:HasWeapon(refundItem) then

		hrefund_message( target:Name().." already has a "..refundItem, ply)

		return end
		
		target:Give(refundItem)
		hrefund_message("You have refunded "..target:Nick().." "..refundItem..".", ply)
	end	
end)





