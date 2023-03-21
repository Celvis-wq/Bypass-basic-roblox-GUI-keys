-- Bypass basic Roblox GUI key system
-- by: Celvis#5477

-- Please note that you may have to change somethings up yourself to get it to work. Just depends. If you are smart enough you'll figure it out.

-- variables
local textBox = game:GetService("CoreGui").Loader.LoaderFrame.KeyFrame.TextBox;
local old; old = hookmetamethod(textBox, "__index", function(self, index)
    
    -- check
    if index == "Text" then
        return debug.getstack(3)[12][3]; -- rec change here
    end
    return old(self, index);
end);

--[[ Example usage
-- variables
local textBox = game:GetService("CoreGui").ui_key.main.keybox;
local old; old = hookmetamethod(textBox, "__index", function(self, index)
    
    -- check
    if index == "Text" then
        return "ABCD" --_G._stk;
    end
    return old(self, index);
end);



 -- OR
-- variables
local textBox = game:GetService("CoreGui").ui_key.main.keybox;
local old; old = hookmetamethod(textBox, "__index", function(self, index)
    
    -- check
    if index == "Text" then
        return getgenv()._stk;
    end
    return old(self, index);
end);
--]]

--[[ I am still wondering if this will help with well obfuscated scripts, maybe not :/
local part = Instance.new("TextBox");
local properties = getproperties(part);
print(properties.Text)

--]]
