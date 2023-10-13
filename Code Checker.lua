-- Settings:

getgenv().Snipe = true

-- Main Code:

local usedStrings = {}
local checkedCount = 0
local usedCount = 0

while Snipe == true do
    task.wait()
    local alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                     "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"} -- Include lowercase letters

    local randString = ""

    repeat
        for i=1, 6 do
            local rand = math.random(1, #alphabet)
            randString = randString .. alphabet[rand]
        end
    until not usedStrings[randString] -- Keep generating until it's unique

    if usedStrings[randString] then
        print("[OGC Sniper]: Checked " .. randString .. ", but it was already used!")
        usedCount = usedCount + 1
    else
        usedStrings[randString] = true -- Mark this randString as used
        print("[OGC Sniper]: Checked " .. randString .. "!")
        checkedCount = checkedCount + 1
    end

    local args = {
        [1] = randString
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Run"):FireServer(unpack(args))
        
        wait(99999)
    end
end
