--Created using senpaizuri's Puzzle Maker (updated by Naim)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_TEST_MODE,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck
Debug.AddCard(48115277,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100414004,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100414005,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100414006,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100414013,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(100414013,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(13039848,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Extra Deck
Debug.AddCard(100414007,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(100414008,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(100414009,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(9433350,1,1,LOCATION_GRAVE,0,POS_FACEUP)
--Hand
Debug.AddCard(100414001,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100414002,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100414003,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100414010,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100414011,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(48115277,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Monster Zones
--Spell & Trap Zones
Debug.AddCard(100414012,0,0,LOCATION_SZONE,3,10)
--Monster Zones
Debug.AddCard(38517737,1,1,LOCATION_MZONE,2,1,true)
--Spell & Trap Zones
Debug.AddCard(20522190,1,1,LOCATION_SZONE,3,10)
Debug.ReloadFieldEnd()