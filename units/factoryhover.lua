unitDef = {
  unitname         = [[factoryhover]],
  name             = [[Hovercraft Platform]],
  description      = [[Produces Hovercraft, Builds at 10 m/s]],
  acceleration     = 0,
  brakeRate        = 0,
  buildCostMetal   = 600,
  builder          = true,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 15,
  buildingGroundDecalSizeY      = 15,
  buildingGroundDecalType       = [[factoryhover_aoplane.dds]],

  buildoptions     = {
    [[hovercon]],
    [[hoverraid]],
    [[hoverskirm]],
    [[hoverassault]],
	[[hoverdepthcharge]],
	[[hoverriot]],
    [[hoverarty]],
    [[hoveraa]],
  },

  buildPic         = [[factoryhover.png]],
  canMove          = true,
  canPatrol        = true,
  category         = [[UNARMED FLOAT]],
  corpse           = [[DEAD]],

  customParams     = {
    sortName = [[8]],
	modelradius    = [[60]],
	default_spacing = 8,
	aimposoffset   = [[0 0 -32]],
    midposoffset    = [[0 -25 -32]],
    solid_factory   = [[8]],
  },

  energyUse        = 0,
  explodeAs        = [[LARGE_BUILDINGEX]],
  footprintX       = 8,
  footprintZ       = 12,
  iconType         = [[fachover]],
  idleAutoHeal     = 5,
  idleTime         = 1800,
  levelGround      = true,
  maxDamage        = 4000,
  maxSlope         = 15,
  maxVelocity      = 0,
  minCloakDistance = 150,
  moveState        = 1,
  noAutoFire       = false,
  objectName       = [[ARMFHP.s3o]],
  selfDestructAs   = [[LARGE_BUILDINGEX]],
  showNanoSpray    = false,
  sightDistance    = 273,
  turnRate         = 0,
  useBuildingGroundDecal = true,
  waterline        = 1,
  workerTime       = 10,
  yardMap          = [[xoooooox ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo ooccccoo xoccccox yyyyyyyy yyyyyyyy yyyyyyyy yyyyyyyy]],

  featureDefs      = {

    DEAD  = {
      blocking         = false,
      featureDead      = [[HEAP]],
      footprintX       = 8,
      footprintZ       = 7,
      object           = [[ARMFHP_DEAD.s3o]],
    },


    HEAP  = {
      blocking         = false,
      footprintX       = 8,
      footprintZ       = 7,
      object           = [[debris4x4c.s3o]],
    },

  },

}

return lowerkeys({ factoryhover = unitDef })
