Entity = class('Entity')



Collidable = class('Collidable', Entity)



Tile = class('Tile', Entity)



Mob = class('Mob', Entity)



Shooter = class('Shooter', Entity)

Player = class('Player', Mob, Shooter)

