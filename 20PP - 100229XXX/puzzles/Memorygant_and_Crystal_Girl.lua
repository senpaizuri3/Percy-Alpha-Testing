--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck
Debug.AddCard(66661678,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(82498947,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Extra Deck
Debug.AddCard(100229003,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(41999284,0,0,LOCATION_EXTRA,0,8)
--Hand
Debug.AddCard(59160188,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100229002,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Monster Zones
Debug.AddCard(66661678,0,0,LOCATION_MZONE,2,1,true)
Debug.AddCard(1508649,0,0,LOCATION_MZONE,1,1,true)
Debug.AddCard(1508649,0,0,LOCATION_MZONE,3,1,true)
--Spell & Trap Zones
Debug.AddCard(19230407,0,0,LOCATION_SZONE,2,10)
--Monster Zones
Debug.AddCard(94784213,1,1,LOCATION_MZONE,2,1,true)
Debug.AddCard(20721928,1,1,LOCATION_MZONE,3,1,true)
Debug.ReloadFieldEnd()
aux.BeginPuzzle()