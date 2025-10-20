Config = {}

-----------------------------------------------------------
-- settings
-----------------------------------------------------------
Config.TicketCost = 5
Config.DistanceSpawn = 20.0
Config.FadeIn = true

-----------------------------------------------------------
-- blip settings
-----------------------------------------------------------
Config.Blip = {
    blipName   = 'Port', -- Config.Blip.blipName
    blipSprite = 'blip_ambient_riverboat', -- Config.Blip.blipSprite
    blipScale  = 0.2 -- Config.Blip.blipScale
}

-----------------------------------------------------------
-- port settings
-----------------------------------------------------------
Config.PortLocations = {

    {
        name          = 'Blackwater Port',
        ticketprompt  = 'port-stdenis-ticket',
		ticketlable   = 'Buy a Ticket',
		travellable   = 'Travel to Guarma',
		travelprompt  = 'port-stdenis-travel',
        coords        = vector3(-718.86, -1278.43, 41.95),
		ticketkeybind = 'ENTER',
		travelkeybind = 'J',
        npcmodel      = `u_m_o_rigtrainstationworker_01`,
        npccoords     = vector4(-718.21, -1280.17, 41.82, 96.46),
        currentport   = 'vanhorn',
        traveldest    = 'guarma',
        showblip      = true
    },
	
    {
        name          = 'Guarma Port',
        ticketprompt  = 'port-guarma-ticket',
		ticketlable   = 'Buy a Ticket',
		travellable   = 'Travel to Saint Denis',
		travelprompt  = 'port-guarma-travel',
        coords        = vector3(1268.6583, -6851.772, 43.318504),
		ticketkeybind = 'ENTER',
		travelkeybind = 'J',
        npcmodel      = `u_m_o_rigtrainstationworker_01`,
        npccoords     = vector4(1264.16, -6851.91, 43.7, 252.27),
        currentport   = 'guarma',
        traveldest    = 'vanhorn',
        showblip      = true
    },

    {
        name          = 'Saint Denis Port',
        ticketprompt  = 'port-stdenis-ticket',
		ticketlable   = 'Buy a Ticket',
		travellable   = 'Travel to Guarma',
		travelprompt  = 'port-stdenis-travel',
        coords        = vector3(2663.5056, -1543.155, 45.969764),
		ticketkeybind = 'ENTER',
		travelkeybind = 'J',
        npcmodel      = `u_m_o_rigtrainstationworker_01`,
        npccoords     = vector4(2662.3156, -1541.951, 45.969783, 265.44274),
        currentport   = 'stdenis',
        traveldest    = 'guarma',
        showblip      = true
    },
    
}
