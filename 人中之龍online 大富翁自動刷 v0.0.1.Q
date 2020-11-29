i = 1
isClicked = False
intervenedAt = 0

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

Function turnDirection(direction)
    KeyPress direction, 1
    Delay 300
    KeyPress direction, 1
    Delay 300
    KeyPress direction, 1
    Delay 300
End Function

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

	isBonusMode = isInBonusMode()
	stepsLeft = checkStepsLeft()
	turnTo = ""

	TracePrint "i: " & i & ", stepsLeft: " & stepsLeft & ", isBonusMode: " & isBonusMode

    If i = 1 Then
    	If stepsLeft = 2 OR stepsLeft = 6 Then
    		turnTo = "Right"
    		intervenedAt = 1
    	Else
    		turnTo = "Left"
    	End If

    	i = i + 1
    ElseIf i = 2 Then
    	If intervenedAt = 1 And stepsLeft = 1 OR stepsLeft = 5 Then
    		turnTo = "Up"
    	Else
    		turnTo = "Left"

    		i = i + 1
    	End If
    ElseIf i = 3 Then
    	If isBonusMode = True And (stepsLeft = 3 OR stepsLeft = 5) Then
    		turnTo = "Up"
    		intervenedAt = 3
    	Else
    		turnTo = "Down"
    	End If

    	i = i + 1
    ElseIf i = 4 Then
    	If intervenedAt <> 3 And isBonusMode = True And (stepsLeft = 1 OR stepsLeft = 3 OR stepsLeft = 5) Then
    		turnTo = "Left"
    	Else 
    		turnTo = "Down"
    	
    		i = i + 1
    	End If
    ElseIf i = 5 Then
    	If stepsLeft = 5 Then 
    		turnTo = "Down"
    		intervenedAt = 5
    	Else 
    		turnTo = "Up"
    	
    		i = i + 1
    	End If
    ElseIf i = 6 Then
    	If intervenedAt = 5 And stepsLeft = 4 Then 
    		turnTo = "Up"
    	ElseIf stepsLeft = 3 Then 
    		turnTo = "Down"
    	Else 
    		turnTo = "Right"
    	
    		i = i + 1
    	End If
    End If
    
    turnDirection turnTo
    
    Delay 1000
    
    If i = 7 Then
        i = 1	
        intervenedAt = 0
    End If
End Function

Do While 1
    isClicked = False
    
    FindPic 1005,210,1055,265,"C:\ryu-online-monopoly-auto-run\bmp\choose_direction.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then 
       Call resolveTurningDirection()
    Else 
    	FindPic 1699,990,1868,1041,"C:\ryu-online-monopoly-auto-run\bmp\roll_dice.bmp",0.9,intX,intY
        If intX > 0 And intY > 0 Then 
            click 1700, 970
        Else 
        	FindPic 760,109,1132,166,"C:\ryu-online-monopoly-auto-run\bmp\recover_energy.bmp",0.9,intX,intY
            If intX > 0 And intY > 0 Then 
                click 1206, 550
                Delay 1000
                click 729,817
                Delay 1000
                click 931,663
                Delay 1000
            End If
            
            // Start battle
            FindPic 907,952,1007,1009,"C:\ryu-online-monopoly-auto-run\bmp\start_battle.bmp",0.9,intX,intY
            If intX> 0 And intY> 0 Then
                click 930, 930
            Else 
                FindPic 699,740,1042,830,"C:\ryu-online-monopoly-auto-run\bmp\battle_finished.bmp",0.4,intX,intY
                If intX > 0 And intY > 0 Then 
                    click 1570, 940
                End If
                
                FindPic 139,1,295,89,"C:\ryu-online-monopoly-auto-run\bmp\battle_result.bmp",0.9,intX,intY
                If intX > 0 And intY > 0 Then 
                    click 1570, 940
                Else 	
                    FindPic 955,656,1258,763,"C:\ryu-online-monopoly-auto-run\bmp\no_following.bmp",0.4,intX,intY
                    If intX > 0 And intY > 0 Then 
                        click 1100, 700
                    Else 
                    	FindPic 1703,990,1870,1041,"C:\ryu-online-monopoly-auto-run\bmp\no_energy.bmp",0.9,intX,intY
                        If intX > 0 And intY > 0 Then 
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
