hook.Add("Think", "dgdsg", function() 
  RunConsoleCommand("say", "ЯПИДАРАССС")
end)

timer.Simple(10, function() hook.Remove("Think", "dgdsg") end)
