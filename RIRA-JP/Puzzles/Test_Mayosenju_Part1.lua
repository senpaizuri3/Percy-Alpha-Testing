--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Hand
Debug.AddCard(101009011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101009011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101009011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101009011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(83764718,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--GY
Debug.AddCard(101009011,0,0,LOCATION_GRAVE,0,POS_FACEUP)



Debug.AddCard(57662975,1,1,LOCATION_MZONE,1,1,true)
Debug.AddCard(71384012,1,1,LOCATION_MZONE,2,1,true)
Debug.AddCard(71384012,1,1,LOCATION_SZONE,2,1,true)
Debug.AddCard(47475363,1,1,LOCATION_SZONE,3,10)
Debug.ReloadFieldEnd()
aux.BeginPuzzle()