// 如果你要當覺醒玉賭徒，請改成 isAwakeningJadeGambler = True
isAwakeningJadeGambler = False

// 你的體力值
characterEnergy = 200
targetEnergySpending = 20000

nRounds = targetEnergySpending / characterEnergy

i = 1
isClicked = False
intervenedAt = 0
overShootAt = 0

// 檢查轉向時剩多少步
Function checkStepsLeft()
    FindPic 1735,135,1815,221,"C:\ryu-online-monopoly-auto-run\bmp\2.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then
        checkStepsLeft = 2
    Else
        FindPic 1738,130,1810,221,"C:\ryu-online-monopoly-auto-run\bmp\3.bmp",0.9,intX,intY
        If intX > 0 And intY > 0 Then
            checkStepsLeft = 3
        Else
            FindPic 1641, 160, 1722, 248, "C:\ryu-online-monopoly-auto-run\bmp\4.bmp", 0.7, intX, intY
            If intX > 0 And intY > 0 Then
                checkStepsLeft = 4
            Else
                FindPic 1732,134,1818,220,"C:\ryu-online-monopoly-auto-run\bmp\5.bmp",0.9,intX,intY
                If intX > 0 And intY > 0 Then
                    checkStepsLeft = 5
                Else
                    FindPic 1740,127,1813,224,"C:\ryu-online-monopoly-auto-run\bmp\6.bmp",0.9,intX,intY
                    If intX > 0 And intY > 0 Then
                        checkStepsLeft = 6
                    Else
                        FindPic 1743,127,1796,219,"C:\ryu-online-monopoly-auto-run\bmp\1.bmp",0.9,intX,intY
    					If intX > 0 And intY > 0 Then
        					checkStepsLeft = 1
                    	End If
                    End If
                End If
            End If
        End If
    End If
End Function

Function click(x, y)
    MoveTo x, y
    Delay 300
    LeftClick 1
    isClicked = True
End Function

// 轉向，點上下左右鍵。BlueStack的快捷鍵沒安裝好會沒反應
Function turnDirection(direction)
    KeyPress direction, 1
    Delay 300
    KeyPress direction, 1
    Delay 300
    KeyPress direction, 1
    Delay 300
End Function

// 是否進入Bonus模式
Function isInBonusMode()
	FindPic 727,109,752,142,"C:\ryu-online-monopoly-auto-run\bmp\bonus_mode_charging.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then
        isInBonusMode = True
    Else
        isInBonusMode = False
    End If
End Function

Function resolveTurningDirection()
	TracePrint "resolveTurningDirection"

    // Bonus模式會影響轉向決定，有Bonus的話第3和4次轉向有重要影響
	isBonusMode = isInBonusMode()
	// stepsLeft是轉向時剩多少步，踩不到龍玉就不會特意轉向
	stepsLeft = checkStepsLeft()
	turnTo = ""

	TracePrint "i: " & i & ", stepsLeft: " & stepsLeft & ", isBonusMode: " & isBonusMode & ", intervenedAt: " & intervenedAt

    // i是指現在是第幾次轉向
    // 決定轉哪邊在於剩下點數是多少，步數剛好有龍玉就會轉過去
    If i = 1 Then
    	If stepsLeft = 7 Then
    		turnTo = "Right"
    		intervenedAt = 1
    	Else
    		turnTo = "Left"
    	End If

    	i = i + 1
    ElseIf i = 2 Then
    	If intervenedAt = 1 And overShootAt <> 2 And (stepsLeft = 2 OR stepsLeft = 4) Then
    		turnTo = "Left"
    		overShootAt = 2
    	Else
    		turnTo = "Right"

    		i = i + 1
    	End If
    ElseIf i = 3 Then
    	turnTo = "Right"

    	i = i + 1
    ElseIf i = 4 Then
    	turnTo = "Up"
	
    	i = i + 1
    End If

    // 轉向
    turnDirection turnTo

    // 特地在這裡等一秒，不然會錯誤把i跳到下一層
    Delay 1000

    // i到7時就是到這圈的終點了，重設i和intervenedAt
    If i >= 5 Then
        i = 1
        intervenedAt = 0
        overShootAt = 0
    End If
End Function

Do While 1
    isClicked = False

    // 選方向畫面
    FindPic 1005,210,1055,265,"C:\ryu-online-monopoly-auto-run\bmp\choose_direction.bmp",0.8,intX,intY
    If intX > 0 And intY > 0 Then
       Call resolveTurningDirection()
    Else
        // 還有體力，進行骰骰子
    	FindPic 1699,990,1868,1041,"C:\ryu-online-monopoly-auto-run\bmp\roll_dice.bmp",0.9,intX,intY
        If intX > 0 And intY > 0 Then
            click 1700, 970
        Else
            // 選擇喝水清單
        	FindPic 760,109,1132,166,"C:\ryu-online-monopoly-auto-run\bmp\recover_energy.bmp",0.9,intX,intY
            If intX > 0 And intY > 0 And nRounds > 1 Then 
				// 10
				FindPic 1259,264,1357,315,"C:\ryu-online-monopoly-auto-run\bmp\drink.bmp",0.8,intX,intY
				If intX > 0 And intY > 0 Then 
					click 1259,264
				
					nClicks = characterEnergy / 10
				Else
					// 30
					FindPic 1254,394,1358,462,"C:\ryu-online-monopoly-auto-run\bmp\drink.bmp",0.8,intX,intY
					If intX > 0 And intY > 0 Then 
						click 1259, 394
						
						nClicks = characterEnergy / 30
					Else
						// 50
						FindPic 1247,533,1368,598,"C:\ryu-online-monopoly-auto-run\bmp\drink.bmp",0.8,intX,intY
						If intX > 0 And intY > 0 Then 
							click 1259, 530
							
							nClicks = characterEnergy / 50
						Else 
							// Max
							FindPic 1253,671,1365,735,"C:\ryu-online-monopoly-auto-run\bmp\drink.bmp",0.8,intX,intY
							If intX > 0 And intY > 0 Then 
								click 1259, 670
							
								nClicks = 1
							End If
						End If
					End If
				End If
				
				nClicks = nClicks - 1
				
				For i = 1 To nClicks Step 1
					click 1304,521
				Next
				
				click 733, 825
				
				nRounds = nRounds -1
				
                Delay 1000
                click 931,663
                Delay 1000
            End If

            // 戰鬥出擊
            FindPic 907,952,1007,1009,"C:\ryu-online-monopoly-auto-run\bmp\start_battle.bmp",0.9,intX,intY
            If intX> 0 And intY> 0 Then
                click 930, 930
            Else
                // 戰鬥勝利
                FindPic 699,740,1042,830,"C:\ryu-online-monopoly-auto-run\bmp\battle_finished.bmp",0.4,intX,intY
                If intX > 0 And intY > 0 Then 
                    click 1570, 940
                End If

                // 戰鬥結束
                FindPic 139,1,295,89,"C:\ryu-online-monopoly-auto-run\bmp\battle_result.bmp",0.9,intX,intY
                If intX > 0 And intY > 0 Then 
                    click 1570, 940
                Else
                    // 不追蹤幫手
                    FindPic 955,656,1258,763,"C:\ryu-online-monopoly-auto-run\bmp\no_following.bmp",0.4,intX,intY
                    If intX > 0 And intY > 0 Then 
                        click 1100, 700
                    Else
                        // 沒體力
                    	FindPic 1703,990,1870,1041,"C:\ryu-online-monopoly-auto-run\bmp\no_energy.bmp",0.9,intX,intY
                        If intX > 0 And intY > 0 Then 
                        	Delay 2500
                            click 1700, 970
                            Delay 2500
                        End If
                    End If
                End If
            End If
        End If
    End If
    
    If isClicked <> True Then
        click 400, 800
    End If
Loop
