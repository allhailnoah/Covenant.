Entity = class('Entity')



Collidable = class('Collidable', Entity)

function Collidable:getWeight()
	return 1
end

Tile = class('Tile', Entity)



Mob = class('Mob', Entity)

function Mob:getWalkSpeed()
	return 1
end

function Mob:getRunSpeed()
	return 2*self:getWalkSpeed()
end

Shooter = class('Shooter', Entity)

function Shooter:getBulletDamage() -- damage per bullet
	return 1
end

function Shooter:getShotCooldown() -- seconds between bullets
	return 1
end

function Shooter:getCooldownTime()
	return self.shootcooldown
end

function Shooter:initialize()
	self.shootcooldown = 0
end

function Shooter:shoot()
	if self.shootcooldown = 0 then
		-- TODO: make a bullet object
		self.shootcooldown = self:getShotCooldown()	
	end
end

function Shooter:update(dt)
	if self.shootcooldown-dt < 0 then
		self.shootcooldown = 0
	else
		self.shootcooldown = self.shootcooldown - dt
	end
end

Player = class('Player', Mob, Shooter)

