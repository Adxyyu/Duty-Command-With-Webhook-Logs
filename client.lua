function DisplayDutyCommandSuggestion()
    TriggerEvent('chat:addSuggestion', '/duty', 'Start or end duty.',
        {
            { name = 'department', help = 'Department name (e.g., LSPD)' },
            { name = 'callsign', help = 'Your callsign (e.g., 1L-01)' }
        }
    )
end

DisplayDutyCommandSuggestion()
