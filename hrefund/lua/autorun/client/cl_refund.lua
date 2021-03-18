
function hrefund_ui()
    
local panel = vgui.Create("DFrame")
             
    panel:SetSize( 360, 400 )    
    panel:Center()        
    panel:SetTitle( "" )       
    panel:MakePopup()  
    panel:SetDraggable(true)
    panel:TDLib()
        :ClearPaint()
        :Background(Color(54, 54, 54), 6)

    local nav = vgui.Create("DPanel", panel)

    nav:SetPos(0,0)
    nav:SetSize(360, 40)
    nav:TDLib()
        :Background(Color(87, 87, 87), 0)
        :Text("Refund Admin System", "DermaLarge", Color(199,199,199), TEXT_ALIGN_CENTER, 0)


    local close = vgui.Create("DButton", nav)

    close:SetPos(335, 5)
    close:SetSize(20, 20)
    close:TDLib()
        :Text("X", "DermaDefault", Color(199,199,199), TEXT_ALIGN_CENTER, 0)
        :Background(Color(107, 107, 107), 0)

    function close:DoClick(clr, tn)
        panel:Close()
    end


    local playerpanel = vgui.Create("DPanel", panel)

    playerpanel:SetPos(10,50)
    playerpanel:SetSize(340, 340)
    playerpanel:TDLib()
        :Background(Color(87, 87, 87), 0)

    local playernav = vgui.Create("DButton", playerpanel)
    playernav:SetSize(300, 20)
    playernav:Dock(TOP)
    playernav:DockMargin(0,1, 0, 1)
    playernav:TDLib()
        :Text("Online Players", "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 0)
        :Background(Color(107, 107, 107), 0)
   
    local refundpanel = vgui.Create("DPanel", panel)

    refundpanel:SetPos(10,50)
    refundpanel:SetSize(340, 340)
    refundpanel:SetVisible(false)
    refundpanel:TDLib()
        :Background(Color(87, 87, 87), 0)
 
    local playername = vgui.Create("DPanel", refundpanel)
    playername:SetSize(300, 30)
    playername:Dock(TOP)
    playername:DockMargin(0,1, 0, 1)
    playername:TDLib()
        :Background(Color(107, 107, 107), 0)

    local playersteamid = vgui.Create("DPanel", refundpanel)
    playersteamid:SetSize(300, 30)
    playersteamid:Dock(TOP)
    playersteamid:DockMargin(0,1, 0, 1)
    playersteamid:TDLib()
        :Background(Color(107, 107, 107), 0)
    local playerrank = vgui.Create("DPanel", refundpanel)
    playerrank:SetSize(300, 30)
    playerrank:Dock(TOP)
    playerrank:DockMargin(0,1, 0, 1)
    playerrank:TDLib()
        :Background(Color(107, 107, 107), 0)

    local refundbutton = vgui.Create("DButton", refundpanel)

    refundbutton:SetSize(340, 100)
    refundbutton:Dock(BOTTOM)
    refundbutton:DockMargin(1, 0, 1, 1)
    refundbutton:TDLib()        
            :Text("Issue refund", "DermaLarge", Color(199,199,199), TEXT_ALIGN_LEFT, 0)
            :Background(Color(50, 168, 82), 0)

   local checkpanel1 = vgui.Create("DPanel", refundpanel)
    checkpanel1:SetHeight(30)
    checkpanel1:Dock(TOP)
    checkpanel1:DockMargin(0, 7, 0, 1)
    checkpanel1:TDLib()
        :Background(Color(107, 107, 107), 0)
        :Text("Select to refund money.", "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 35)


    local moneycheckbox = vgui.Create("DCheckBox", checkpanel1)
        moneycheckbox:SetSize(20, 20)
        moneycheckbox:SetPos(10, 5)
        moneycheckbox:DockMargin(5, 0, 5, 0)
        moneycheckbox:TDLib() 
                        :ClearPaint()
                        :CircleCheckbox(Color(55, 55, 55))

   local checkpanel2 = vgui.Create("DPanel", refundpanel)
    checkpanel2:SetHeight(30)
    checkpanel2:Dock(TOP)
    checkpanel2:DockMargin(0, 7, 0, 10)
    checkpanel2:TDLib()
        :Background(Color(107, 107, 107), 0)
            :Text("Select to refund a weapon.", "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 35)


    local weaponcheckbox = vgui.Create("DCheckBox", checkpanel2)
        weaponcheckbox:SetSize(20, 20)
        weaponcheckbox:SetPos(10, 5)
        weaponcheckbox:DockMargin(5, 0, 5, 0)
        weaponcheckbox:TDLib() 
                        :ClearPaint()
                        :CircleCheckbox(Color(55, 55, 55))      


    local refundtextbox = vgui.Create( "DTextEntry", refundpanel ) 
    refundtextbox:SetHeight(40)
    refundtextbox:Dock( BOTTOM )
    refundtextbox:DockMargin(5, 0, 5, 15)

                    

            
     

    for k,v  in pairs(player.GetAll()) do
    

    players = vgui.Create("DButton", playerpanel)
    players:SetSize(300, 30)
    players:Dock(TOP)
    players:DockMargin(0,1, 0, 1)
    players:TDLib()
        :Text(v:Nick(), "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 0)
        :Background(Color(107, 107, 107), 0)

    


    function players:DoClick()
        playerpanel:SetVisible(false) 
        refundpanel:SetVisible(true) 
        playersteamid:SetVisible(true) 
        playername:SetVisible(true) 
        playerrank:SetVisible(true) 

        vsteamid = v:SteamID64()

        vplayer = v 

        vname = v:Nick()

        playername:TDLib()
            :Text("Name: ".. v:Nick(), "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 5)
        playersteamid:TDLib()
            :Text("Steam ID: ".. v:SteamID(), "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 5)
         playerrank:TDLib()
            :Text("Rank: ".. v:GetUserGroup(), "DermaDefault", Color(199,199,199), TEXT_ALIGN_LEFT, 5)
    end


end

function refundbutton:DoClick()

        if weaponcheckbox:GetChecked() == true and moneycheckbox:GetChecked() == true then

        chat.AddText( color_green,"Refund | ", color_white, "You can not check two boxes.")

        return
end




    net.Start("hrefund_giverefund")
    net.WriteEntity( vplayer )
    net.WriteBool(moneycheckbox:GetChecked())
    net.WriteString( refundtextbox:GetValue() )
    net.SendToServer()



end

    
end

net.Receive("hrefund_openui", function()
    
    hrefund_ui()

end)


net.Receive("hrefund_errormessage", function()
    
    local msg = net.ReadString()

    chat.AddText( color_green,"Refund | ", color_white, msg)

end)

print(LocalPlayer():GetModel())








