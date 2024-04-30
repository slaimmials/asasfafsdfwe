function rand_str(len)
    len = tonumber(len) or 1
    
    local function rand_char()
        return math.random() > 0.5 
            and string.char(math.random(65, 90))
            or string.char(math.random(97, 122))
    end
    local function rand_num()
        return string.char(math.random(48, 57))
    end
    
    local str = ""
    for i = 1, len do
        str = str .. (math.random() > 0.5 and rand_char() or rand_num())
    end
    return str
end
local cryptedName = rand_str(124)
local fakeRT = GetRenderTarget( "fakeRT" .. os.time(), ScrW(), ScrH() )
hook.Add( "RenderScene", rand_str(15), function( vOrigin, vAngle, vFOV )
    local view = {
        x = 0,
        y = 0,
        w = ScrW(),
        h = ScrH(),
        dopostprocess = true,
        origin = vOrigin,
        angles = vAngle,
        fov = vFOV,
        drawhud = true,
        drawmonitors = true,
        drawviewmodel = true
    }
 
    render.RenderView( view )
    render.CopyTexture( nil, fakeRT )
 
    cam.Start2D()
        hook.Run( cryptedName.."HUDPaint" )
    cam.End2D()
 
    render.SetRenderTarget( fakeRT )
 
    return true
end )

hook.Add( "ShutDown", "RemoveAntiScreenGrab", function()
    render.SetRenderTarget()
end )

local Menu = vgui.Create("DFrame")
local MenuToggle = true
Menu:SetTitle("")
Menu:ShowCloseButton(false)
Menu:SetDraggable(true)
Menu:SetSize(605, 400)
Menu:Center()
Menu:MakePopup()
local alpha = 255
local alphaMultiplier = -1
function Menu:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 0, 2, 2, w-4, h-4, Color(60,60,60,255) )
	draw.RoundedBox( 0, 3, 3, w-6, h-6, Color(35,35,35,255) )
	draw.RoundedBox( 0, 8, 8, w-16, h-16, Color(60,60,60,255) )
	draw.RoundedBox( 0, 9, 9, w-18, h-18, Color(35,35,35,255) )
	surface.SetFont( "BudgetLabel" )
	surface.SetTextColor( 255, 255, 255,0 )
	surface.SetTextPos( 5, 1.5 )
	surface.DrawText( "MENU NAME SUKAAAA" )
    alpha = alpha + alphaMultiplier
    if alpha == 25 then
        alphaMultiplier = 1
    elseif alpha == 255 then
        alphaMultiplier = -1
    end
end
local menuitems = {
	Visuals = {
		enabled = false,
        shadow = {0,0},
        functions = {
            Standart = {"Active","Box"},
            as = {"Siski","penis"},
            
        }
	},
	Miscellaneous = {
		enabled = false,
        shadow = {0,0}
	},
	Aimbot = {
		enabled = false,
        shadow = {0,0}
	},
	PlayerList = {
		enabled = false,
        shadow = {0,0}
	},
}

function toggleAllPages()
    for i,v in pairs(menuitems) do
        v.enabled = false
    end
end

local Visuals = vgui.Create("DButton",Menu)
Visuals:SetText("")
Visuals:SetPos(9, 9)
Visuals:SetSize(150, 35)
function Visuals:Paint( w, h )
	local text = "Visuals"
	draw.RoundedBox( 0, 0, 0, w, h, Color(35,35,35,255) )
    if menuitems.Visuals.enabled == false then
	    draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(50,50,50,255) )
    else
        draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(43,214,15,alpha) )
    end
    if Visuals:IsHovered() then
        if menuitems.Visuals.shadow[1] < 3 then
            menuitems.Visuals.shadow[1] = menuitems.Visuals.shadow[1] + 0.1
        end
        if menuitems.Visuals.shadow[2] < 1 then
            menuitems.Visuals.shadow[2] = menuitems.Visuals.shadow[2] + 0.1
        end
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 20 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Visuals.shadow[1], h/2-5+menuitems.Visuals.shadow[1] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 100 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Visuals.shadow[2], h/2-5+menuitems.Visuals.shadow[2] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    else
        menuitems.Visuals.shadow[1]=0
        menuitems.Visuals.shadow[2]=0
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    end
end
function Visuals:DoClick()
	toggleAllPages()
    menuitems.Visuals.enabled = true
end

local Miscellaneous = vgui.Create("DButton",Menu)
Miscellaneous:SetText("")
Miscellaneous:SetPos(153, 9)
Miscellaneous:SetSize(150, 35)
function Miscellaneous:Paint( w, h )
	local text = "Miscellaneous"
	draw.RoundedBox( 0, 0, 0, w, h, Color(35,35,35,255) )
	if menuitems.Miscellaneous.enabled == false then
	    draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(50,50,50,255) )
    else
        draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(43,214,15,alpha) )
    end
	if Miscellaneous:IsHovered() then
        if menuitems.Miscellaneous.shadow[1] < 3 then
            menuitems.Miscellaneous.shadow[1] = menuitems.Miscellaneous.shadow[1] + 0.1
        end
        if menuitems.Miscellaneous.shadow[2] < 1 then
            menuitems.Miscellaneous.shadow[2] = menuitems.Miscellaneous.shadow[2] + 0.1
        end
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 20 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Miscellaneous.shadow[1], h/2-5+menuitems.Miscellaneous.shadow[1] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 100 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Miscellaneous.shadow[2], h/2-5+menuitems.Miscellaneous.shadow[2] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    else
        menuitems.Miscellaneous.shadow[1]=0
        menuitems.Miscellaneous.shadow[2]=0
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    end
end
function Miscellaneous:DoClick()
	toggleAllPages()
    menuitems.Miscellaneous.enabled = true
end

local Aimbot = vgui.Create("DButton",Menu)
Aimbot:SetText("")
Aimbot:SetPos(299, 9)
Aimbot:SetSize(150, 35)
function Aimbot:Paint( w, h )
	local text = "Aimbot"
	draw.RoundedBox( 0, 0, 0, w, h, Color(35,35,35,255) )
	if menuitems.Aimbot.enabled == false then
	    draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(50,50,50,255) )
    else
        draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(43,214,15,alpha) )
    end
	if Aimbot:IsHovered() then
        if menuitems.Aimbot.shadow[1] < 3 then
            menuitems.Aimbot.shadow[1] = menuitems.Aimbot.shadow[1] + 0.1
        end
        if menuitems.Aimbot.shadow[2] < 1 then
            menuitems.Aimbot.shadow[2] = menuitems.Aimbot.shadow[2] + 0.1
        end
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 20 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Aimbot.shadow[1], h/2-5+menuitems.Aimbot.shadow[1] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 100 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.Aimbot.shadow[2], h/2-5+menuitems.Aimbot.shadow[2] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    else
        menuitems.Aimbot.shadow[1]=0
        menuitems.Aimbot.shadow[2]=0
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    end
end
function Aimbot:DoClick()
	toggleAllPages()
    menuitems.Aimbot.enabled = true
end

local PlayerList = vgui.Create("DButton",Menu)
PlayerList:SetText("")
PlayerList:SetPos(446, 9)
PlayerList:SetSize(150, 35)
function PlayerList:Paint( w, h )
	local text = "Player List"
	draw.RoundedBox( 0, 0, 0, w, h, Color(35,35,35,255) )
	if menuitems.PlayerList.enabled == false then
	    draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(50,50,50,255) )
    else
        draw.RoundedBox( 0, 4, h-3, w-8, 3, Color(43,214,15,alpha) )
    end
	if PlayerList:IsHovered() then
        if menuitems.PlayerList.shadow[1] < 3 then
            menuitems.PlayerList.shadow[1] = menuitems.PlayerList.shadow[1] + 0.1
        end
        if menuitems.PlayerList.shadow[2] < 1 then
            menuitems.PlayerList.shadow[2] = menuitems.PlayerList.shadow[2] + 0.1
        end
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 20 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.PlayerList.shadow[1], h/2-5+menuitems.PlayerList.shadow[1] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 100 )
        surface.SetTextPos( (w/2)-(#text*3)-menuitems.PlayerList.shadow[2], h/2-5+menuitems.PlayerList.shadow[2] )
        surface.DrawText( text )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    else
        menuitems.PlayerList.shadow[1]=0
        menuitems.PlayerList.shadow[2]=0
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( (w/2)-(#text*3), h/2-5 )
        surface.DrawText( text )
    end
end
function PlayerList:DoClick()
	toggleAllPages()
    menuitems.PlayerList.enabled = true
end
local cooldown
hook.Add("Think", "але аутист я думаю не мешай нахуй", function() 
    if (cooldown or 0) < CurTime() and input.IsKeyDown( KEY_END ) then
        cooldown = CurTime() + 0.4
        MenuToggle = not MenuToggle
        Menu:SetVisible(MenuToggle)
    end
end)

local MiscFunctionsPage = vgui.Create("DPanel",Menu)
MiscFunctionsPage:SetSize(605-18,360-18)
MiscFunctionsPage:SetPos(9,49)
function MiscFunctionsPage:Paint( w, h )
    if menuitems.Miscellaneous.enabled then
        local functionsCount = 1
        draw.RoundedBox( 0, 4, 4, w/2-10, 10+19*functionsCount, Color(0,0,0,255) )
        draw.RoundedBox( 0, 6, 6, (w/2-10)-4, (10+19*functionsCount)-4, Color(60,60,60,255) )
        draw.RoundedBox( 0, 7, 7, (w/2-10)-6, (10+19*functionsCount)-6, Color(35,35,35,255) )
        draw.RoundedBox( 0, (((w/2-10)-4)/2-70/2), 4, 70, 5, Color(35,35,35,255) )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 110, -2 )
        surface.DrawText( "Anti-Aim" )   
    end
end

local AimbotFunctionsPage = vgui.Create("DPanel",Menu)
AimbotFunctionsPage:SetSize(605-18,360-18)
AimbotFunctionsPage:SetPos(9,49)
function AimbotFunctionsPage:Paint( w, h )
    if menuitems.Aimbot.enabled then
        local functionsCount = 5
        draw.RoundedBox( 0, 4, 4, w/2-10, 10+19*functionsCount, Color(0,0,0,255) )
        draw.RoundedBox( 0, 6, 6, (w/2-10)-4, (10+19*functionsCount)-4, Color(60,60,60,255) )
        draw.RoundedBox( 0, 7, 7, (w/2-10)-6, (10+19*functionsCount)-6, Color(35,35,35,255) )
        draw.RoundedBox( 0, (((w/2-10)-4)/2-70/2), 4, 70, 5, Color(35,35,35,255) )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 122, -2 )
        surface.DrawText( "Main" )   
    end
end

local VisualsFunctionsPage = vgui.Create("DPanel",Menu)
VisualsFunctionsPage:SetSize(605-18,360-18)
VisualsFunctionsPage:SetPos(9,49)
function VisualsFunctionsPage:Paint( w, h )
    if menuitems.Visuals.enabled then
        local functionsCount = 3
        local y = 4
        draw.RoundedBox( 0, 4, y, w/2-10, 10+19*functionsCount, Color(0,0,0,255) )
        draw.RoundedBox( 0, 6, y+2, (w/2-10)-4, (10+19*functionsCount)-4, Color(60,60,60,255) )
        draw.RoundedBox( 0, 7, y+3, (w/2-10)-6, (10+19*functionsCount)-6, Color(35,35,35,255) )
        draw.RoundedBox( 0, (((w/2-10)-4)/2-70/2), y, 70, 5, Color(35,35,35,255) )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 122, -2 )
        surface.DrawText( "Main" )  

        local functionsCount = 1
        local y = 100
        draw.RoundedBox( 0, 4, y, w/2-10, 10+19*functionsCount, Color(0,0,0,255) )
        draw.RoundedBox( 0, 6, y+2, (w/2-10)-4, (10+19*functionsCount)-4, Color(60,60,60,255) )
        draw.RoundedBox( 0, 7, y+3, (w/2-10)-6, (10+19*functionsCount)-6, Color(35,35,35,255) )
        draw.RoundedBox( 0, (((w/2-10)-4)/2-70/2), y, 70, 5, Color(35,35,35,255) )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 100, -2+(y-3) )
        surface.DrawText( "Aimbot visuals" )  
    end
end
local buttons = {
    --["visuals_activated"] = {nil,false,0,"Visuals"}
}
local sliders = {
    --["visuals_activated"] = {nil,0,"Visuals",0,0}
}
hook.Add("Think", "InitalizeAll", function()
    for i,v in pairs(buttons) do
        v[1]:SetVisible(menuitems[v[4]].enabled)
    end
    for i,v in pairs(sliders) do
        v[1]:SetVisible(menuitems[v[2]].enabled)
    end
end)

function guiSlider(name,text,page,x,y,min,max)
    sliders[name] = {nil,"gaysex",0,{0,0,0}}
    sliders[name][1] = vgui.Create("DButton",VisualsFunctionsPage)
    sliders[name][1]:SetText("")
    sliders[name][1]:SetPos(x, y)
    sliders[name][1]:SetSize(250, 15)
    sliders[name][2] = page
    sliders[name][4][1] = min
    sliders[name][4][2] = max
    local obj = sliders[name][1]
    function obj:Paint( w, h )
        surface.SetDrawColor( 0, 0, 0, 255 )
        surface.DrawOutlinedRect( 0, 0, 100, 15, 2 )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 110, 0 )
        
        local mouseX, mouseY = obj:ScreenToLocal( gui.MouseX(), gui.MouseY() )
        if input.IsMouseDown( MOUSE_LEFT ) and obj:IsHovered() then
            sliders[name][4][3] = math.Clamp(mouseX, 0, 96)
        end
        sliders[name][3] = math.floor(sliders[name][4][1] + ( ( sliders[name][4][3] ) / ( 96 ) ) * ( sliders[name][4][2] - sliders[name][4][1] ))
        draw.RoundedBox( 0, 2, 3, sliders[name][4][3], 10, Color(35,255,35,200) )
        surface.DrawText( text )
        surface.SetTextPos( 2, 0.5 )
        surface.DrawText( sliders[name][3] )
    end
end

function guiButton(name,text,page,x,y,defaultEnabled)
    buttons[name] = {nil,false,0,"gaysex"}
    buttons[name][1] = vgui.Create("DButton",VisualsFunctionsPage)
    buttons[name][1]:SetText("")
    buttons[name][1]:SetPos(x, y)
    buttons[name][1]:SetSize(150, 15)
    buttons[name][4] = page
    local obj = buttons[name][1]
    if defaultEnabled ~= nil then
        buttons[name][2] = defaultEnabled
    end

    function obj:Paint( w, h )
        surface.SetDrawColor( 0, 0, 0, 255 )
        surface.DrawOutlinedRect( 0, 0, 15, 15, 2 )
        surface.SetFont( "BudgetLabel" )
        surface.SetTextColor( 255, 255, 255, 255 )
        surface.SetTextPos( 20, 0 )
        surface.DrawText( text )
        if buttons[name][2] then
            if buttons[name][3] < 11 then
                buttons[name][3] = buttons[name][3] + 1
            end
            draw.RoundedBox( 0, 2, 2, 11, buttons[name][3], Color(35,255,35,200) )
        else
            if buttons[name][3] > 0 then
                buttons[name][3] = buttons[name][3] - 1
            end
            draw.RoundedBox( 0, 2, 2, 11, buttons[name][3], Color(35,255,35,200) )
        end
    end
    function obj:DoClick()
        buttons[name][2] = not buttons[name][2]
    end
end

guiButton("visuals_enabled", "Enabled", "Visuals", 10, 10, true)
guiButton("visuals_Box", "Box", "Visuals", 10, 29)
guiButton("visuals_Tracers", "Tracers", "Visuals", 10, 48)
guiButton("visuals_drawFov", "Draw FOV", "Visuals", 10, 108)

guiButton("aimbot_enabled", "Enabled", "Aimbot", 10, 10)
guiButton("aimbot_checkWalls", "Wall check", "Aimbot", 10, 29)
guiButton("aimbot_autoFire", "Auto fire", "Aimbot", 10, 48)
guiSlider("aimbot_fov", "FOV", "Aimbot", 10, 48+19, 1, 360 )
guiButton("aimbot_interpolation", "Interpolation", "Aimbot", 10, 48+(19*2))

guiButton("misc_aa", "Enabled", "Miscellaneous", 10, 10)

local retur = {false,nil}

function isPlayerOnRAY(target,pos)
    local ray = util.TraceLine({mask=MASK_SHOT,ignoreworld=false,filter=LocalPlayer(),start=LocalPlayer():EyePos(),endpos=pos})
    if ray.Entity == target then
        return true
    end
    return false
end

hook.Add("CreateMove", "AAim", function(ccmd) 
    if buttons["misc_aa"][2] then
        ccmd:SetViewAngles( Angle(math.random(-180, 180), math.random(-180, 180), 0) )
    end
end)

hook.Add("CreateMove", "Aim", function(ccmd) 
    if ccmd:CommandNumber() == 0 then return end

    if buttons["aimbot_interpolation"][2] and buttons["aimbot_interpolation"][5] == nil then
        buttons["aimbot_interpolation"][5] = GetConVar("cl_interp"):GetFloat()
        print(buttons["aimbot_interpolation"][5])
        RunConsoleCommand("cl_interp", 0.0000001)
    elseif buttons["aimbot_interpolation"][5] ~= nil and not buttons["aimbot_interpolation"][2] then
        RunConsoleCommand("cl_interp", buttons["aimbot_interpolation"][5])
        buttons["aimbot_interpolation"][5] = nil
    end

	for i,v in pairs(player.GetAll()) do
        if buttons["aimbot_enabled"][2] and v ~= LocalPlayer() then
            if input.IsMouseDown( MOUSE_LEFT ) or buttons["aimbot_autoFire"][2] then
                local old = ccmd:GetViewAngles()
                local headPos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1")):ToScreen()
                local fov = sliders["aimbot_fov"][3]
                local headX = headPos.x
                local headY = headPos.y
                local inFovX = math.abs(ScrW()/2 - headX)
                local inFovY = math.abs(ScrH()/2 - headY)
                if inFovX <= fov and inFovY <= fov then     
                    local aimPosition = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
                    local aimAngle = (aimPosition - LocalPlayer():EyePos()):Angle()
                    aimAngle:Normalize()
                    --retur[1] = true
                    local doShoot = true
                    if buttons["aimbot_checkWalls"][2] then
                        doShoot = isPlayerOnRAY(v,aimPosition)
                    end
                    if doShoot then
                        ccmd:SetViewAngles( aimAngle )
                        retur[2] = old
                        if buttons["aimbot_autoFire"][2] then 
                            --RunConsoleCommand("+attack")
                            ccmd:AddKey(IN_ATTACK)
                        end 
                        return true
                    end
                end
            end
        end
    end
end)

hook.Add(cryptedName.."HUDPaint", rand_str(math.random(10,150)), function()
    if buttons["visuals_enabled"][2] then
        if buttons["visuals_drawFov"][2] then
            surface.DrawCircle( ScrW()/2, ScrH()/2, sliders["aimbot_fov"][3], Color(255, 255, 255, 255) )
        end
    end
    for i,v in pairs(player.GetAll()) do
        if buttons["visuals_enabled"][2] and v ~= LocalPlayer() then
            if buttons["visuals_Box"][2] then
                local bottom = v:GetPos():ToScreen()
                bottom.y = bottom.y - 5
                local headPos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
                headPos.z = headPos.z + 10
                local top = headPos:ToScreen()
                local left = 20
                local right = 20
                surface.SetDrawColor(0,0,255,200)

                surface.DrawLine(top.x-left,top.y,top.x+right,top.y)
                surface.DrawLine(top.x+right,top.y,bottom.x+right,bottom.y)
                surface.DrawLine(bottom.x+right,bottom.y,bottom.x-left,bottom.y)
                surface.DrawLine(bottom.x-left,bottom.y,top.x-left,top.y)
            end
            if buttons["visuals_Tracers"][2] then
                surface.SetDrawColor(0,0,255,200)
                if (v:GetPos():ToScreen().x <= ScrW()*2 and v:GetPos():ToScreen().x >= 0) and (v:GetPos():ToScreen().y <= ScrH()*2 and v:GetPos():ToScreen().y >= 0) then
                    surface.DrawLine(ScrW()/2,ScrH(),v:GetPos():ToScreen().x,v:GetPos():ToScreen().y)
                end
            end
        end
    end

end)

