--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck
Debug.AddCard(100423001,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423002,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423003,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423004,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423006,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423007,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100423008,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(1004230010,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(1004230011,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(1004230012,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(1004230013,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Extra Deck
Debug.AddCard(100423009,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(100423008,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(100423007,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(30822527,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(30822527,0,0,LOCATION_EXTRA,0,8)
--Hand
Debug.AddCard(100423003,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100423011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100423001,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100423010,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100423010,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100423004,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Monster Zones
Debug.AddCard(63288573,0,0,LOCATION_MZONE,5,1,true)
Debug.AddCard(100423002,0,0,LOCATION_MZONE,4,1,true)
Debug.AddCard(46104361,0,0,LOCATION_MZONE,3,4,true)
--Spell & Trap Zones
Debug.AddCard(54447022,0,0,LOCATION_SZONE,0,10)
Debug.AddCard(100423013,0,0,LOCATION_SZONE,1,10)
Debug.AddCard(100423012,0,0,LOCATION_SZONE,2,10)
Debug.AddCard(100423011,0,0,LOCATION_SZONE,3,10)
--Extra Deck
Debug.AddCard(2857636,1,1,LOCATION_EXTRA,0,8)
--Monster Zones
Debug.AddCard(55885348,1,1,LOCATION_MZONE,3,1,true)
Debug.AddCard(75878039,1,1,LOCATION_MZONE,2,1,true)
Debug.AddCard(1861629,1,1,LOCATION_MZONE,1,1,true)
--Spell & Trap Zones
Debug.AddCard(17626381,1,1,LOCATION_SZONE,4,5)
Debug.ReloadFieldEnd()
