menu_lang = {}

function menu_lang.create(groupID)
    local obj = object.create(groupID)
    
    function obj.ondraw()
        local height = love.graphics.getHeight()
        local width = love.graphics.getWidth()
        local printf = love.graphics.printf
        
        love.graphics.setColor(1,1,1,1)
        love.graphics.setFont(font_main)

        textwidth = font_main:getWidth("... ??? !!!")
        printf("... ??? !!!", width/2-textwidth/2, height*0.05, 999)

        textwidth = font_main:getWidth("English")
        printf("English", width/2-textwidth/2, height*0.3, 999)

        textwidth = font_main:getWidth("日本語")
        printf("日本語", width/2-textwidth/2, height*0.45, 999)

    end

    function obj.onupdate(dt)

        local textheight = font_main:getHeight()

        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        --
        local textwidth = font_main:getWidth("English")
        local minx = width/2-textwidth/2
        if(touches.isInArea(minx-textwidth/2, height*0.3, minx+textwidth, height*0.3+textheight))then
            settings.language = "_en"
            swapLanguage()

            obj.perform(false)
            MainMenu.perform(true)
            touches.pause(1)
            settings.firstLaunch = 0
            checkSettings()
            saveSettings()
        end
        --
        textwidth = font_main:getWidth("日本語")
        minx = width/2-textwidth/2
        if(touches.isInArea(minx, height*0.45, minx+textwidth, height*0.45+textheight))then
            settings.language = "_jp"
            swapLanguage()

            obj.perform(false)
            MainMenu.perform(true)
            touches.pause(1)
            settings.firstLaunch = 0
            checkSettings()
            saveSettings()
        end
        --
        touches.clear()
    end

    function obj.oncreate()
        
    end

    function obj.ondestroy()

    end
    
    return obj
end

function swapLanguage()
    if(settings.language=="_en")then
        font_big = love.graphics.newFont("libs/comicsans.ttf", font_size_big)
        font_main = love.graphics.newFont("libs/comicsans.ttf", font_size_main)
        font_small = love.graphics.newFont("libs/comicsans.ttf", font_size_small)
    elseif(settings.language=="_jp")then
        font_big = love.graphics.newFont("libs/umeboshi.ttf", font_size_big)
        font_main = love.graphics.newFont("libs/umeboshi.ttf", font_size_main)
        font_small = love.graphics.newFont("libs/umeboshi.ttf", font_size_small)
    end
    updateLocalization()
end

function updateLocalization()
    if(settings.language=="_en")then
        ls_Bubbles = "Bubbles"
        ls_Start_Game = "Start Game"
        ls_Options = "Options"
        ls_ThanksTo = "Thanks to"
        ls_Exit = "Exit"

        ls_Back = "Back"

        ls_ShortGame = "Short game - 200 taps"
        ls_MediumGame = "Medium game - 500 taps"
        ls_LongGame = "Long game - 1000 taps"

        ls_CircleMaxSize = "Circle Max Size"
        ls_FieldSize = "Field Size: "
        ls_MusicVolume = "Music Volume"
        ls_PopSound = "Pop sound"
        ls_Language = "Language"
        ls_ResetToDefault = "Reset to Default"

        ls_Yes = "yes"
        ls_No = "no"

        ls_Score = "Score: "
        ls_Taps = "Taps: "

        ls_Pause = "PAUSE"
        ls_Best = "Best: "
        ls_NewRecord = "NEW RECORD!"
        ls_MaxCombo = "Max Combo: "
        ls_TapsLeft = "Taps Left: "
        ls_ToMainMenu = "To Main Menu"
        ls_Continue = "Continue"

        ls_GameOver = "GAME OVER"
        ls_TapLimit = "Tap Limit: "
        ls_PlayAgain = "Play Again"

        ls_Combo = "combo: "

        

    elseif(settings.language=="_jp")then
        ls_Bubbles = "バブル"
        ls_Start_Game = "ゲームをスタート"
        ls_Options = "セッティング"
        ls_ThanksTo = "のおかげで"
        ls_Exit = "エグジット"

        ls_Back = "バック"

        ls_ShortGame = "ショートゲーム-200タップ"
        ls_MediumGame = "中程度のゲーム-500タップ"
        ls_LongGame = "ロングゲーム-1000タップ"

        ls_CircleMaxSize = "サークル最大サイズ"
        ls_FieldSize = "フィールドサイズ" 
        ls_MusicVolume = "音楽の音量"
        ls_PopSound = "ポップ音"
        ls_Language = "言語"
        ls_ResetToDefault = "デフォルトにリセット"

        ls_Yes = "はい"
        ls_No = "番号"

        ls_Score = "スコア: "
        ls_Taps = "タップ: "

        ls_Pause = "休止"
        ls_Best = "ベスト: "
        ls_NewRecord = "新記録!"
        ls_MaxCombo = "最大コンボ: "
        ls_TapsLeft = "左タップ: "
        ls_ToMainMenu = "メインメニューへ"
        ls_Continue = "継続する"

        ls_GameOver = "ゲームオーバー"
        ls_TapLimit = "タップ制限: "
        ls_PlayAgain = "再びプレー"

        ls_Combo = "コンボ: "

    end

end