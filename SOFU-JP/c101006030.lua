--ゴキポール
--Gokipole
--Scripted by AlphaKretin
function c101006030.initial_effect(c)
	--spsummon
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(101006030,0))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_TO_GRAVE)
	e1:SetCountLimit(1,101006030)
	e1:SetTarget(c101006030.target)
	e1:SetOperation(c101006030.operation)
	c:RegisterEffect(e1)
end
function c101006030.filter(c)
	return c:IsLevelBelow(4) and c:IsRace(RACE_INSECT) and c:IsAbleToHand()
end
function c101006030.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c101006030.filter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c101006030.desfilter(c,atk)
	return c:IsFaceup() and c:IsAttackAbove(atk)		
end
function c101006030.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c101006030.filter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		local tc=g:GetFirst()
		Duel.SendtoHand(tc,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,tc)
		if tc:IsType(TYPE_NORMAL) and tc:IsCanBeSpecialSummoned(e,0,tp,false,false) and Duel.SelectYesNo(tp,aux.Stringid(101006030,1)) then
			local ct=Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP)
			local dg=Duel.GetMatchingGroup(c101006030.desfilter,tp,0,LOCATION_MZONE,nil,tc:GetAttack())
			if ct>0 and #dg>0 then
				Duel.BreakEffect()
				Duel.Destroy(dg,REASON_EFFECT)
			end
		end
	end
end
--They see me rollin'
--They hatin'