--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck
Debug.AddCard(85080444,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Extra Deck
Debug.AddCard(100257061,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(41999284,0,0,LOCATION_EXTRA,0,8)
--Hand
Debug.AddCard(29975188,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(1142880,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(73642296,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(85080444,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--GY
Debug.AddCard(85080444,0,0,LOCATION_GRAVE,0,POS_FACEUP)
--Spell & Trap Zones
Debug.AddCard(19230407,0,0,LOCATION_SZONE,3,10)
Debug.AddCard(55573346,0,0,LOCATION_SZONE,2,10)
Debug.AddCard(76103675,0,0,LOCATION_SZONE,1,10)
Debug.ReloadFieldEnd()
