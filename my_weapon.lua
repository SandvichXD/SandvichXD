SWEP.AdminSpawnable = false
SWEP.ViewModelFOV = 85
SWEP.ViewModel = "models/weapons/cs02/v_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/cs02/w_rif_ak47.mdl"
SWEP.AutoSwitchTo = false // when someone walks over the swep, chould i automatectly change to your swep ?
SWEP.Slot = 2 // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.HoldType = "ar2" // How the swep is hold Pistol smg greanade melee
SWEP.PrintName = "Ak-47 RED" // your sweps name
SWEP.Author = "SandvichXD Weapons" // Your name
SWEP.Spawnable = true // Can everybody spawn this swep ? - If you want only admin keep this false and adminsapwnable true.
SWEP.AutoSwitchFrom = false // Does the weapon get changed by other sweps if you pick them up ?
SWEP.FiresUnderwater = false // Does your swep fire under water ?
SWEP.Weight = 5 // Chose the weight of the Swep
SWEP.DrawCrosshair = true // Do you want it to have a crosshair ?
SWEP.Category = "SandvichXD Weapons" // Make your own catogory for the swep
SWEP.SlotPos = 5 // Deside wich slot you want your swep do be in 1 2 3 4 5 6
SWEP.DrawAmmo = true // Does the ammo show up when you are using it ? True / False
SWEP.ReloadSound = "Weapon_Pistol.Reload" // Reload sound, you can use the default ones, or you can use your one; Example; "sound/myswepreload.waw"
SWEP.Instructions = "LMB to Fire."
SWEP.Contact = "N/A"
SWEP.Purpose = "A realistic glock"
SWEP.base = "weapon_pistol"
SWEP.ViewModelFlip = true


SWEP.Primary.Sound = "weapons/cs02/ak47-1.wav" // The sound that plays when you shoot :]
SWEP.Primary.Damage = 50 // How much damage the swep is doing
SWEP.Primary.TakeAmmo = 1 // How much ammo does it take for each shot ?
SWEP.Primary.ClipSize = 30 // The clipsize
SWEP.Primary.Ammo = "pistol" // ammmo type pistol/ smg1
SWEP.Primary.DefaultClip = 120 // How much ammo does the swep come with `?
SWEP.Primary.Spread = .2 // Does the bullets spread all over, if you want it fire exactly where you are aiming leave it o.1
SWEP.Primary.NumberofShots = 1 // How many bullets you are firing each shot.
SWEP.Primary.Automatic = true // Is the swep automatic ?
SWEP.Primary.Recoil = .5 // How much we should punch the view
SWEP.Primary.Delay = 0.1 // How long time before you can fire again
SWEP.Primary.Force = 20 // The force of the shot

//Secondary Fire Variables\\
SWEP.Secondary.NumberofShots = 0 // How many explosions for each shot
SWEP.Secondary.Force = 10 // Explosions Force
SWEP.Secondary.Spread = 3 // How much the explosion does spread
SWEP.Secondary.Sound = "Weapon_357.Reload" // Fire sound
SWEP.Secondary.DefaultClip = 0 // How much ammo the secoindary swep comes with
SWEP.Secondary.Automatic = true // Is it automactic ?
SWEP.Secondary.Ammo = "none" // Leave as Pistol !
SWEP.Secondary.Recoil = 0 // How uch we should punch the view
SWEP.Secondary.Delay = 0.1 // How long you have to wait before fire a new shot
SWEP.Secondary.TakeAmmo = 1 // How much ammo Does it take ?
SWEP.Secondary.ClipSize = 0 // ClipSize
SWEP.Secondary.Damage = 50 -- The damage the explosion does.
SWEP.Secondary.Magnitude = "0" -- How big its the explosion ?
//Secondary Fire Variables\\

//SWEP:Initialize()\\
function SWEP:Initialize()
util.PrecacheSound(self.Primary.Sound)
util.PrecacheSound(self.Secondary.Sound)
if ( SERVER ) then
self:SetWeaponHoldType( self.HoldType )
end
end
//SWEP:Initialize()\\

//SWEP:PrimaryFire()\\
function SWEP:PrimaryAttack()
if ( !self:CanPrimaryAttack() ) then return end
local bullet = {}
bullet.Num = self.Primary.NumberofShots
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0)
bullet.Tracer = 0
bullet.Force = self.Primary.Force
bullet.Damage = self.Primary.Damage
bullet.AmmoType = self.Primary.Ammo
local rnda = self.Primary.Recoil * -1
local rndb = self.Primary.Recoil * math.random(-1, 1)
self:ShootEffects()
self.Owner:FireBullets( bullet )
self.Weapon:EmitSound(Sound(self.Primary.Sound))
self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) )
self:TakePrimaryAmmo(self.Primary.TakeAmmo)
self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
end
//SWEP:PrimaryFire()\\
