-- Bypass basic Roblox GUI login
-- by: Celvis#5477

-- Please note that you may have to change somethings up yourself to get it to work. Just depends. If you are smart enough you'll figure it out.

-- variables
local textBox = game:GetService("CoreGui").Loader.LoaderFrame.KeyFrame.TextBox;
local old; old = hookmetamethod(textBox, "__index", function(self, index)
    
    -- check
    if index == "Text" then
        return debug.getstack(3)[12][3]; -- rec to change here
    end
    return old(self, index);
end);
