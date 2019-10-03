--Dream Mirror Hypnagogia
--Scripted by Eerie Code
local s,id=GetID()
function s.initial_effect(c)
    --Activate
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_ACTIVATE)
    e1:SetCode(EVENT_FREE_CHAIN)
    e1:SetCountLimit(1,id+EFFECT_COUNT_CODE_OATH)
    e1:SetTarget(s.target)
    e1:SetOperation(s.operation)
    c:RegisterEffect(e1)
end
s.listed_names={CARD_DREAM_MIRROR_JOY, CARD_DREAM_MIRROR_TERROR }
function s.filter(c,tp)
    return c:IsType(TYPE_FIELD) and c:IsCode(CARD_DREAM_MIRROR_JOY,CARD_DREAM_MIRROR_TERROR) and c:GetActivateEffect():IsActivatable(tp)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
    local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_DECK,0,nil)
    if chk==0 then return g:GetClassCount(Card.GetCode)>1 end
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
    local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_DECK,0,nil)
    if g:GetClassCount(Card.GetCode)<2 then return end
    Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,0))
    local tg1=g:Select(tp,1,1,nil)
    g:Remove(Card.IsCode,nil,tg1:GetFirst():GetCode())
    Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,1))
    local tg2=g:Select(tp,1,1,nil)
    local cs={tg1:GetFirst(),tg2:GetFirst()}
    for p=0,1 do
        local tc=cs[p]
        local te=tc:GetActivateEffect()
        local fc=Duel.GetFieldCardtp,LOCATION_SZONE,5)
        if fc then
            Duel.SendtoGrave(fc,REASON_RULE)
            Duel.BreakEffect()
        end
        Duel.MoveToField(tc,tp,p,LOCATION_SZONE,POS_FACEUP,true)
        local tep=tc:GetControler()
        local cost=te:GetCost()
        if cost then cost(te,tep,eg,ep,ev,re,r,rp,1) end
        Duel.RaiseEvent(tc,4179255,te,0,p,tp,Duel.GetCurrentChain())
    end
end
