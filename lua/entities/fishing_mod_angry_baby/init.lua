AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:InitializeData()
	self:SetModel("models/props_c17/doll01.mdl")
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	self:StartMotionController()
	
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(100)
		phys:SetDamping(0,0)
		phys:Wake()
		phys:SetBuoyancyRatio( 0 )
	end

end

function ENT:PhysicsSimulate(phys, deltatime)
	if self.dead then return end
	phys:Wake()

	if self:WaterLevel() >= 3 then
		phys:SetDamping(0,0)
		if constraint.FindConstraint(self, "Weld") then
			phys:AddVelocity(VectorRand()*1000)
			phys:AddAngleVelocity(VectorRand()*5000)
			return
		end
	
		if ValidEntity(self.target) then
			phys:AddVelocity((self.target:GetPos() - self:GetPos()):Normalize()*60)
			phys:AddAngleVelocity(VectorRand()*2000)
		else
			phys:AddVelocity(VectorRand()*200)
			phys:AddAngleVelocity(VectorRand()*2000)
		end
	else
		phys:SetDamping(1, 0)
		if math.random() > 0.95 then
			if ValidEntity(self.target) then
				phys:AddVelocity((self.target:GetPos() - self:GetPos()):Normalize()*100)
				phys:AddAngleVelocity(VectorRand()*2000)
			else
				phys:AddVelocity(VectorRand()*200)
				phys:AddAngleVelocity(VectorRand()*2000)
			end
		end
	end
end

function ENT:Revive()
	self.dead = false
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)
	if dmginfo:GetDamage() > 10 and not self.dead then
		self.dead = true
		self:GetPhysicsObject():SetBuoyancyRatio( 1 )
		self:EmitSound("ambient/creatures/teddy.wav", 100, math.random(90,110))
	end
end

function ENT:Think()
	if self.dead then return end
	self:GetPhysicsObject():Wake()
	
	for key, entity in pairs(ents.FindInSphere(self:GetPos(), 10000)) do
		if string.find(entity:GetModel() or "", "melon") or entity ~= self and entity:GetClass() ~= "fishing_mod_angry_baby" and entity:GetVelocity():Length() > 20 then
			self.target = entity
		end
	end
	
	if ValidEntity(self.target) and not constraint.FindConstraint(self, "Weld") and (self.target and self.target:GetClass() == "fishing_rod_hook") and self.target:GetPos():Distance(self:GetPos()) < 30 then
		self.target:Hook(self, self.data)
	end
	self:NextThink(CurTime()+0.3)
	return true
end
--lua_run Entity(1):GetFishingRod():GetHook():Hook("fishing_mod_fish")