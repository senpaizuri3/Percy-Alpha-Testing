--絶望の究極の布陣
--Ultimate Battle Formation of Despair
--Scripted by AlphaKretin
local s,id=GetID()
function s.initial_effect(c)
    --Activate
    local e1=Effect.CreateEffect(c)
    e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
    e1:SetType(EFFECT_TYPE_ACTIVATE)
    e1:SetCode(EVENT_FREE_CHAIN)
    e1:SetCondition(s.spcon)
    e1:SetTarget(s.sptg)
    e1:SetOperation(s.spop)
    c:RegisterEffect(e1)
end
s.listed_names={44095762,62279055,61740673}
function s.spcon(e,tp,eg,ep,ev,re,r,rp)
    return Duel.IsExistingMatchingCard(Card.IsLink,tp,LOCATION_MZONE,0,1,nil,4)
end
function s.GetZones(c,tp)
    local g=Duel.GetFieldGroup(tp,LOCATION_MZONE)
    local zone=0
    for tc in aux.Next(g) do
        zone=zone|c:GetToBeLinkedZone(tc,tp,true,true)
    end
end
function s.spfilter(c,e,tp)
    local zone=s.GetZones(c,tp)
    return zone>0 and c:IsLink(4) and c:IsCanBeSpecialSummoned(e,0,tp,false,false,POS_FACEUP,tp,zone)
end
function s.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then return Duel.IsExistingMatchingCard(s.spfilter,tp,LOCATION_EXTRA,0,1,nil,e,tp) end
    Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,LOCATION_EXTRA)
end
function s.rvfilter(c,codes)
    return #codes>0 and c:IsCode(table.unpack(codes)) and not c:IsPublic()
end
function s.spop(e,tp,eg,ep,ev,re,r,rp,chk)
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
    local g=Duel.SelectMatchingCard(s.spfilter,tp,LOCATION_EXTRA,0,1,1,nil,e,tp)
    if #g>0 then
        local tc=g:GetFirst()
        local zone=s.GetZones(tc,tp)
        if Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP,tp,zone)~=0 then
            local sg=Duel.GetMatchingGroup(s.spfilter,tp,LOCATION_MZONE,0,nil,e,tp)
            local codes={44095762,62279055,61740673}
            local rg=Duel.GetMatchingGroup(s.rvfilter,tp,LOCATION_SZONE,0,nil,codes)
            while #sg>0 and #rg>0 and Duel.SelectYesNo(tp,aux.Stringid(id,0)) do
                Duel.BreakEffect()
                Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONFIRM)
                local rc=rg:Select(tp,1,1,nil):GetFirst()
                Duel.ConfirmCards(rc,1-tp)
                Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
                local sc=sg:Select(tp,1,1,nil):GetFirst()
                local szone=s.GetZones(sc,tp)
                Duel.SpecialSummon(sc,0,tp,tp,false,false,POS_FACEUP,tp,szone)
                --remove code from table
                local newCodes={}
                local n=#codes
                for i=1,n do
                    if codes[i]~=rc:GetCode() then
                        table.insert(newCodes,codes[i])
                    end
                end
                codes=newCodes
                rg=Duel.GetMatchingGroup(s.rvfilter,tp,LOCATION_SZONE,0,nil,codes)
                sg=Duel.GetMatchingGroup(s.spfilter,tp,LOCATION_MZONE,0,nil,e,tp)
            end
        end
    end
end