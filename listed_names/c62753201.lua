--ヴァレル・レフリジェレーション
--Borrel Refrigeration
function c62753201.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_EQUIP)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCost(c62753201.cost)
	e1:SetTarget(c62753201.target)
	e1:SetOperation(c62753201.activate)
	c:RegisterEffect(e1)
end
c62753201.listed_names={31833038}
function c62753201.cfilter(c)
	return c:IsSetCard(0x102)
end
function c62753201.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckReleaseGroup(tp,c62753201.cfilter,1,nil) end
	local rg=Duel.SelectReleaseGroup(tp,c62753201.cfilter,1,1,nil)
	Duel.Release(rg,REASON_COST)
	aux.RemainFieldCost(e,tp,eg,ep,ev,re,r,rp,1)
end
function c62753201.filter(c)
	return c:IsFaceup() and c:IsType(TYPE_LINK) and (c:IsCode(31833038) or c:IsSetCard(0x10f))
end
function c62753201.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) and c62753201.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c62753201.filter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_EQUIP)
	Duel.SelectTarget(tp,c62753201.filter,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_EQUIP,e:GetHandler(),1,0,0)
end
function c62753201.eqlimit(e,c)
	return e:GetLabelObject()==c
end
function c62753201.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_SZONE) or not c:IsRelateToEffect(e) or c:IsStatus(STATUS_LEAVE_CONFIRMED) then return end
	local tc=Duel.GetFirstTarget()
	if tc and tc:IsRelateToEffect(e) and tc:IsFaceup() then
		local fid=c:GetFieldID()
		Duel.Equip(tp,c,tc)
		tc:RegisterFlagEffect(62753201,RESET_EVENT+0x1fe0000,0,1,fid)
		--
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e1:SetValue(c62753201.eqlimit)
		e1:SetLabelObject(tc)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		c:RegisterEffect(e1)
		--
		local e2=Effect.CreateEffect(c)
		e2:SetDescription(aux.Stringid(62753201,0))
		e2:SetType(EFFECT_TYPE_QUICK_O)
		e2:SetCode(EVENT_FREE_CHAIN)
		e2:SetRange(LOCATION_MZONE)
		e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
		e2:SetReset(RESET_EVENT+0x1fe0000)
		e2:SetCountLimit(1)
		e2:SetLabel(62753201)
		e2:SetTarget(c62753201.indtg)
		e2:SetOperation(c62753201.intop)
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
		e3:SetRange(0xff)
		e3:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
		e3:SetCondition(c62753201.efconrst)
		e3:SetTarget(c62753201.eftg)
		e3:SetLabel(fid)
		e3:SetLabelObject(e2)
		c:RegisterEffect(e3)
	else
		c:CancelToGrave(false)
	end
end
function c62753201.efconrst(e)
	if not e:GetHandler():IsLocation(LOCATION_SZONE) then
		local ev=Duel.GetCurrentChain()
		for i=1,ev do
			local te=Duel.GetChainInfo(i,CHAININFO_TRIGGERING_EFFECT)
			if te:GetLabel()==62753201 then return true end
		end
		e:Reset()
		return false
	end
	return true
end
function c62753201.eftg(e,c)
	return c:GetFlagEffectLabel(62753201)==e:GetLabel()
end
function c62753201.indtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) and chkc:IsFaceup() end
	if chk==0 then return Duel.IsExistingTarget(Card.IsFaceup,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,Card.IsFaceup,tp,LOCATION_MZONE,0,1,1,nil)
end
function c62753201.indop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc and tc:IsRelateToEffect(e) and tc:IsFaceup() then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
		e1:SetValue(1)
		e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e1)
		local e2=e1:Clone()
		e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
		tc:RegisterEffect(e2)
	end
end
