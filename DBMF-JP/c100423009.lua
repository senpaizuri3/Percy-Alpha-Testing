--塊斬機ラプラシア
--Cluster Zan-Ki Laplacian
--Scripted by AlphaKretin
local s,id=GetID()
function s.initial_effect(c)
    --xyz summon
    aux.AddXyzProcedure(c,nil,4,3)
    c:EnableReviveLimit()
    --atk
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOGRAVE)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCondition(s.con)
	e1:SetCost(s.cost)
	e1:SetTarget(s.tg)
	e1:SetOperation(s.op)
	c:RegisterEffect(e1,false,REGISTER_FLAG_DETACH_XMAT)
	--destroy replace
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EFFECT_DESTROY_REPLACE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTarget(s.reptg)
	e2:SetValue(s.repval)
	c:RegisterEffect(e2)
end
s.listed_series={0x231}
function s.con(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsSummonType(SUMMON_TYPE_XYZ)
end
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local ct=0
	if s.handtg(e,tp,eg,ep,ev,re,r,rp,0) then ct=ct+1 end
	if s.montg(e,tp,eg,ep,ev,re,r,rp,0) then ct=ct+1 end
	if s.sttg(e,tp,eg,ep,ev,re,r,rp,0) then ct=ct+1 end
	if chk==0 then return ct>0 and c:CheckRemoveOverlayCard(tp,1,REASON_COST) end
	c:RemoveOverlayCard(tp,1,ct,REASON_COST)
	local ft=Duel.GetOperatedGroup():GetCount()
	e:SetLabel(ft)
end
function s.tg(e,tp,eg,ep,ev,re,r,rp,chk)
	local hand=s.handtg(e,tp,eg,ep,ev,re,r,rp,0)
	local mon=s.montg(e,tp,eg,ep,ev,re,r,rp,0)
	local st=s.sttg(e,tp,eg,ep,ev,re,r,rp,0)
	if chk==0 then return hand or mon or st end
	local ct=0
	if hand then ct=ct+1 end
	if mon then ct=ct+1 end
	if st then ct=ct+1 end
	local ft=e:GetLabel()
	if ft<ct then ct=ft end
	local sel
	while ft>0 do
		if hand and sel&0x1=0 and Duel.SelectYesNo(aux.Stringid(id,1)) then
			sel=sel+0x1
			Duel.Hint(HINT_OPSELECTED,1-tp,aux.Stringid(id,1))
		end
		if mon and sel&0x2=0 and Duel.SelectYesNo(aux.Stringid(id,2)) then
			sel=sel+0x2
			Duel.Hint(HINT_OPSELECTED,1-tp,aux.Stringid(id,2))
		end
		if st and sel&0x4=0 and Duel.SelectYesNo(aux.Stringid(id,3)) then
			sel=sel+0x4
			Duel.Hint(HINT_OPSELECTED,1-tp,aux.Stringid(id,3))
		end
		ft=ft-1
	end
	e:SetLabel(sel)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	local sel=e:GetLabel()
	if sel&0x1==0x1 then
		s.handop(e,tp,eg,ep,ev,re,r,rp)
	end
	if sel&0x2==0x2 then
		s.monop(e,tp,eg,ep,ev,re,r,rp)
	end
	if sel&0x4==0x4 then
		s.setop(e,tp,eg,ep,ev,re,r,rp)
	end
end
function s.handtg(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then return Duel.GetFieldGroupCount(1-tp,LOCATION_HAND,0)~=0 end
    Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,1-tp,LOCATION_HAND)
end
function s.handop(e,tp,eg,ep,ev,re,r,rp)
    local g=Duel.GetFieldGroup(1-tp,LOCATION_HAND,0)
    if #g==0 then return end
    local sg=g:RandomSelect(1-tp,1)
    Duel.SendtoGrave(sg,REASON_EFFECT)
end
function s.montg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsAbleToGrave,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,0,0)
end
function s.monop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectMatchingCard(tp,Card.IsAbleToGrave,tp,0,LOCATION_MZONE,1,1,nil)
	if #g>0 then
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end
function s.stfilter(c)
	return c:IsType(TYPE_SPELL+TYPE_TRAP) and c:IsAbleToGrave()
end
function s.sttg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.stfilter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,0,0)
end
function s.monop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectMatchingCard(tp,s.stftiler,tp,0,LOCATION_MZONE,1,1,nil)
	if #g>0 then
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end
function s.repfilter(c,tp)
	return c:IsSetCard(0x231) and c:IsControler(tp) and c:IsLocation(LOCATION_ONFIELD)
		and c:IsReason(REASON_EFFECT) and not c:IsReason(REASON_REPLACE)
end
function s.reptg(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	local g=c:GetLinkedGroup()
	if chk==0 then return eg:IsExists(s.repfilter,1,nil,tp) and c:CheckRemoveOverlayCard(tp,1,REASON_EFFECT) end
	if Duel.SelectEffectYesNo(tp,c,96) then
		c:RemoveOverlayCard(tp,1,1,REASON_EFFECT)
		return true
	else return false end
end
function s.repval(e,c)
	return s.repfilter(c,e:GetHandlerPlayer())
end